//
//  TestObject.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "TestObject.h"
#import <objc/runtime.h>

@implementation TestObject
-(void)other
{
    NSLog(@"%s",__func__);
}

//动态解析
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//
//    //动态添加方法实现
//    if(sel == @selector(test)){
//         // 获取其他方法 指向method_t的指针
//        Method otherMethod = class_getInstanceMethod(self, @selector(other));
//        //动态添加test方法的实现
//        class_addMethod(self, sel, method_getImplementation(otherMethod), method_getTypeEncoding(otherMethod));
//        //返回YES，表示有动态添加方法
//        return YES;
//    }
//    NSLog(@"%s",__func__);
//    return [super resolveInstanceMethod:sel];
//}


//消息转发阶段
//若动态解析阶段,resovleInstanceMethod:方法没有实现，那么会进入消息转发阶段
/*
-(id)forwardingTargetForSelector:(SEL)aSelector
{
    if([self.cat respondsToSelector:aSelector]){
        return self.cat;
    }
    else{
        return self;
    }
}
 */

//首先调用forwardingTargetForSelector函数，在内部将消息转发给可以实现此方法的对象
-(id)forwardingTargetForSelector:(SEL)aSelector
{
    //返回能够处理消息的对象
    if(aSelector == @selector(test)) {
        
        //返回nil时，会调用methodSignatureForSelector方法
        return nil;
        //return [[Dogs alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

//接着调用methodSignatureForSelector方法，在上边forwaringTargetForSelector方法不能返回消息对象时
//最终返回方法签名，包含返回值类型，参数类型
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if(aSelector == @selector(test)){
        return [[[Dogs alloc] init] methodSignatureForSelector:aSelector];//成功返回方法签名
        //若返回方法签名失败，就会系统报错，crash。
    }
    return [super methodSignatureForSelector:aSelector];
}

//最后，在成功返回方法签名后，会调用forwardInvocation方法
/*
 forwardInvocation方法内提供一个NSInvocation类型的参数，NSInvocation封装了一个方法的调用，包括方法的调用者，方法名，以及方法参数。
 在该函数内修改方法调用对象即可。
 anInvocation.target 方法调用者
 anInvocation.selector 方法名
 [anInvocation getArgument: NULL atIndex: 0]; 获得参数
 */
-(void)forwardInvocation:(NSInvocation *)anInvocation
{
    //anInvocation中封装了methodSignatureForSelector函数中返回的方法。
    //此时anInvocation.target 还是TestObject对象，我们需要修改target为可以执行方法的方法调用者
    NSLog(@"%@",anInvocation.target);
    [anInvocation  invokeWithTarget: [[Dogs alloc] init]];
}

@synthesize cat = _cat;
-(Cats *)cat
{
    if(!_cat){
        _cat = [[Cats alloc] init];
    }
    return _cat;
}

@synthesize dog = _dog;
-(Dogs *)dog
{
    if(!_dog){
        _dog = [[Dogs alloc] init];
    }
    return _dog;
}
@end

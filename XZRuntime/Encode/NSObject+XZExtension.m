//
//  NSObject+XZExtension.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/14.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "NSObject+XZExtension.h"
#import <objc/runtime.h>
@implementation NSObject (XZExtension)
//解档
-(void)decode:(NSCoder *)aDecoder
{
     // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for(int i = 0;i< outCount;i++){
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //如果有实现该方法再去调用
            if([self respondsToSelector:@selector(ignoredNames)]){
                if([[self ignoredNames] containsObject:key]){
                    continue;
                }
            }
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

//归档
-(void)encode:(NSCoder *)aCoder
{
    // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for(int i = 0;i< outCount;i++){
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //如果有实现该方法再去调用
            if([self respondsToSelector:@selector(ignoredNames)]){
                if([[self ignoredNames] containsObject:key]){
                    continue;
                }
            }
            id value = [self valueForKey:key];
            [aCoder encodeObject:value forKey:key];//归档
        }
        free(ivars);
        c = [c superclass];
    }
}
@end

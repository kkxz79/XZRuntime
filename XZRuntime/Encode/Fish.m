//
//  Fish.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/14.
//  Copyright © 2018年 kkxz. All rights reserved.
//利用runtime获取所有属性来重写归档解档方法

#import "Fish.h"
#import <objc/runtime.h>

@interface Fish ()<NSCoding>

@end

@implementation Fish
//设置不需要归解档的属性
-(NSArray*)ignoredNames
{
    return @[@"_aaa",@"_bbb",@"_ccc"];
}

//解档方法
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        //获取所有成员变量
        unsigned int outCount = 0;
        Ivar * ivars = class_copyIvarList([self class], &outCount);
        
        for(int i=0;i<outCount;i++){
            Ivar ivar = ivars[i];
            //将每个成员变量名转换为NSString对象类型
            NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            //忽略不需要解档的属性
            if([[self ignoredNames] containsObject:key]){
                continue;
            }
            //根据变量名解档取值，无论是什么类型
            id value = [aDecoder decodeObjectForKey:key];
            //取出值再设置给属性
            [self setValue:value forKey:key];
            // 这两步就相当于以前的 self.age = [aDecoder decodeObjectForKey:@"_age"];
        }
        free(ivars);
    }
    return self;
}

//归档调用方法
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //获取所有成员变量
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for(int i = 0;i < outCount;i++){
        Ivar ivar = ivars[i];
        //将每个成员变量名转换为NSString对象类型
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //忽略不需要解档的属性
        if([[self ignoredNames] containsObject:key]){
            continue;
        }
        //通过成员变量名，取出成员变量的值
        id value = [self valueForKey:key];
        //再将值归档
        [aCoder encodeObject:value forKey:key];//归档
        // 这两步就相当于 [aCoder encodeObject:@(self.age) forKey:@"_age"];
    }
    free(ivars);
}

















@end

//
//  NSObject+XZCategory.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/14.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "NSObject+XZCategory.h"
#import <objc/runtime.h>

/*
 参数 object：给哪个对象设置属性
 参数 key：一个属性对应一个Key，将来可以通过key取出这个存储的值，key 可以是任何类型：double、int 等，建议用char 可以节省字节
 参数 value：给属性设置的值
 参数policy：存储策略 （assign 、copy 、 retain就是strong）
 */

@implementation NSObject (XZCategory)
char nameKey;
-(void)setName:(NSString *)name
{
    //将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, &nameKey, name,OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)name
{
    return objc_getAssociatedObject(self, &nameKey);
}

@end

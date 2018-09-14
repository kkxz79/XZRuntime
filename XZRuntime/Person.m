//
//  Person.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/13.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "Person.h"

@implementation Person
+(void)run
{
    NSLog(@"跑");
}
+(void)study
{
    NSLog(@"学习");
}

@synthesize sex = _sex;
@synthesize isOK = _isOK;

@end

//
//  Dog.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/14.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "Dog.h"
#import "NSObject+XZExtension.h"
#import "XZDecode.h"

@interface Dog()<NSCoding>
@end

@implementation Dog
//设置需要忽略的属性
-(NSArray*)ignoredNames
{
    return @[@"bone"];
}

//在系统方法内来调用我们的方法
//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]){
        [self decode:aDecoder];
    }
    return self;
}

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [self encode:aCoder];
}

@end

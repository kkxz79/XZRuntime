//
//  Cat.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "Cat.h"

@implementation Cat
@synthesize name = _name;
-(NSString *)name
{
    if(!_name){
        _name = @"";
    }
    return _name;
}
@synthesize fish = _fish;
-(FishTwo *)fish
{
    if(!_fish){
        _fish = [[FishTwo alloc] init];
    }
    return _fish;
}
@end

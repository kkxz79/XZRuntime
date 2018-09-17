//
//  FishTwo.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "FishTwo.h"

@implementation FishTwo
@synthesize name = _name;
-(NSString *)name
{
    if(!_name){
        _name = @"";
    }
    return _name;
}

@end

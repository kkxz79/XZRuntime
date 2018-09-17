//
//  Book.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "Book.h"

@implementation Book
#pragma mark - lazy init
@synthesize name = _name;
-(NSString *)name
{
    if(!_name){
        _name = @"";
    }
    return _name;
}

@synthesize publisher = _publisher;
-(NSString *)publisher
{
    if(!_publisher){
        _publisher = @"";
    }
    return _publisher;
}

@end

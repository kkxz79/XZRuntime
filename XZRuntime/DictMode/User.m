//
//  User.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "User.h"


@implementation User
@synthesize name = _name;
-(NSString *)name
{
    if(!_name){
        _name = @"";
    }
    return _name;
}
@synthesize cat = _cat;
-(Cat *)cat
{
    if(!_cat){
        _cat = [[Cat alloc] init];
    }
    return _cat;
}
@synthesize books = _books;
-(NSArray *)books
{
    if(!_books){
        _books = [[NSArray alloc] init];
    }
    return _books;
}

// 返回数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass
{
   return @"Book";
}

@end

//
//  TestObject.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

-(id)forwardingTargetForSelector:(SEL)aSelector
{
    if([self.cat respondsToSelector:aSelector]){
        return self.cat;
    }
    else if([self.dog respondsToSelector:aSelector]){
        return self.dog;
    }
    else{
        return self;
    }
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

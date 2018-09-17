//
//  User.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

@interface User : NSObject
@property(nonatomic,copy)NSString * name;
@property (nonatomic,assign) double height;
@property (nonatomic,assign) int age;
@property (nonatomic,strong) Cat*cat;//属性是一个对象
@property (nonatomic,strong) NSArray *books;//属性是一个数组
@end

//
//  Cat.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FishTwo.h"

@interface Cat : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) double price;
@property (nonatomic,strong) FishTwo *fish;//属性是一个对象

@end

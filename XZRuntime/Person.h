//
//  Person.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/13.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy)NSString * sex;
@property(nonatomic,assign)BOOL isOK;

+(void)run;
+(void)study;
@end

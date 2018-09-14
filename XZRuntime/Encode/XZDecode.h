//
//  XZDecode.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/14.
//  Copyright © 2018年 kkxz. All rights reserved.
//

//一句宏搞定归解档
#import "NSObject+XZExtension.h"

#define CodingImplementation \
- (instancetype)initWithCoder:(NSCoder *)aDecoder {\
if (self = [super init]) {\
[self decode:aDecoder];\
}\
return self;\
}\
\
- (void)encodeWithCoder:(NSCoder *)aCoder {\
[self encode:aCoder];\
}


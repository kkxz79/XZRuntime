//
//  NSObject+XZExtension.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/14.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XZExtension)
-(NSArray*)ignoredNames;
-(void)encode:(NSCoder*)aCoder;
-(void)decode:(NSCoder*)aDecoder;
@end

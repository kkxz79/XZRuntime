//
//  Dogs.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DogProtocol <NSObject>
-(void)eatBone;
@end

@interface Dogs : NSObject<DogProtocol>

@end

NS_ASSUME_NONNULL_END

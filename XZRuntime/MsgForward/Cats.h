//
//  Cats.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CatProtocol <NSObject>
-(void)eatFish;
@end

@interface Cats : NSObject<CatProtocol>

@end

NS_ASSUME_NONNULL_END

//
//  TestObject.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cats.h"
#import "Dogs.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestObject : NSObject<CatProtocol,DogProtocol>
@property(nonatomic,strong)Cats * cat;
@property(nonatomic,strong)Dogs * dog;
-(id)forwardingTargetForSelector:(SEL)aSelector;
@end

NS_ASSUME_NONNULL_END

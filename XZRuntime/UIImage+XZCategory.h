//
//  UIImage+XZCategory.h
//  XZRuntime
//
//  Created by kkxz on 2018/9/13.
//  Copyright © 2018年 kkxz. All rights reserved.
//
/*
 拦截系统方法案例
 比如iOS6 升级 iOS7 后需要版本适配，根据不同系统使用不同样式图片（拟物化和扁平化），如何通过不去手动一个个修改每个UIImage的imageNamed：方法就可以实现为该方法中加入版本判断语句？
 */
/*
 利用以上思路，我们还可以给 NSObject 添加分类，统计创建了多少个对象，给控制器添加分类，统计有创建了多少个控制器，特别是公司需求总变的时候，在一些原有控件或模块上添加一个功能，建议使用该方法。
 */

#import <UIKit/UIKit.h>

@interface UIImage (XZCategory)

+(UIImage*)xz_imageNamed:(NSString*)name;

@end

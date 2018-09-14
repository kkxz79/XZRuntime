//
//  UIImage+XZCategory.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/13.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "UIImage+XZCategory.h"
#import <objc/runtime.h>

@implementation UIImage (XZCategory)

+(void)load
{
    //获取两个类的类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(xz_imageNamed:));
    //开始交换实现方法
    method_exchangeImplementations(m1, m2);
}

+(UIImage*)xz_imageNamed:(NSString*)name
{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if(version >= 7.0){
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        name = [name stringByAppendingString:@"_os7"];
    }
    return [UIImage xz_imageNamed:name];
}

@end

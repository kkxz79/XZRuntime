//
//  ViewController.m
//  XZRuntime
//
//  Created by kkxz on 2018/9/13.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Person run];
    [Person study];
    
    //runtime实现方法交换
    //类方法用class_getClassMethod ，对象方法用class_getInstanceMethod
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(study));
    //开始交换方法实现
    method_exchangeImplementations(m1, m2);
    //交换后，先打印学习，后打印跑！
    [Person run];
    [Person study];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

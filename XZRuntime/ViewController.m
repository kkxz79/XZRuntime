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
#import "UIImage+XZCategory.h"
#import "NSObject+XZCategory.h"
#import "Dog.h"
#import "Fish.h"
#import "User.h"
#import "NSObject+JSONExtension.h"
#import "Book.h"
#import "TestObject.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView * imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    [self.view addSubview:self.imageView];
    
    self.imageView.image = [UIImage imageNamed:@"xz_pic"];
    
    //关联对象，给分类添加属性
    Person * person = [[Person alloc] init];
    person.name = @"小白";
    NSLog(@"name---%@",person.name);
    
    //获取Person类中所有成员变量的名字和类型
    unsigned int outCount = 0;
    Ivar * invars = class_copyIvarList([Person class], &outCount);
    //遍历所有成员变量
    for(int i=0;i<outCount;i++){
        //取出i位置对应的成员变量
        Ivar ivar = invars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    free(invars);
    
    //基于运行时的归档和解档
    [self fishArchiver];
    
    //[self archiver];
    
    //字典转模型 json串的解析
    [self json];
    
    //消息转发机制
    TestObject * testOjc = [[TestObject alloc] init];
    
    //在test方法定义了，但是没有实现的情况下，系统会抛错
    /*
     '-[TestObject test]: unrecognized selector sent to instance 0x2811702e0'
     */
    [testOjc test];
    
    //可以在动态解析方法阶段，来做处理，从而防止crash 调用resovleInstanceMethod:方法
    
    
    
}

-(void)archiver
{
     NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"temp.plist"];
    Dog *dog = [[Dog alloc] init];
    //归档
    dog.leg = @"四条腿";
    [NSKeyedArchiver archiveRootObject:dog toFile:path];
    //解档
    Dog * deDog = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"leg---%@",deDog.leg);
    NSLog(@"path---%@",path);
    
}

-(void)fishArchiver
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"fish.plist"];
    Fish *fish = [[Fish alloc] init];
    //归档
    fish.name = @"飞鱼";
    [NSKeyedArchiver archiveRootObject:fish toFile:path];
    //解档
    Fish * deFish = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"fish---%@",deFish.name);
    NSLog(@"path---%@",path);
}

//字典转模型
-(void)json
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData * jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    User * user = [User objectWithDict:json];
    NSLog(@"#username# :%@",user.name);
    
    Cat * cat = user.cat;
    NSLog(@"#catname# :%@",cat.name);
    
    FishTwo * fish = cat.fish;
    NSLog(@"#fishname#:%@",fish.name);
    
    Book * book = user.books[0];
    NSLog(@"#name# :%@",book.name);
    NSLog(@"#publisher# :%@",book.publisher);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy init
@synthesize imageView = _imageView;
-(UIImageView *)imageView
{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(10, 150, self.view.frame.size.width-20.0f, 70.0f);
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}

@end

//
//  ViewController.m
//  CustomView
//
//  Created by 韩森 on 2016/10/28.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

#import "LPActionSheet.h"
#import <CoreGraphics/CoreGraphics.h>
#import "CircleCore.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    NSLog(@"WWE");
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CustomView * customView = [[CustomView alloc]initWithFrame:self.view.frame];
//    customView.backgroundColor = [UIColor whiteColor];
//    customView.alpha = 1.0f;
//    
//    [self.view addSubview:customView];
//    
//    NSMutableArray * arr = [[NSMutableArray alloc]initWithObjects:@"张三丰",@"吴奇隆",@"林青霞",@"东方不败", nil];
//    NSMutableArray * timeArr = [[NSMutableArray alloc]initWithObjects:@"1~5小时",@"5~10小时",@"24小时内", @"48小时内",nil];
//    
//  
//    
//    customView.titlesSource =arr;
//    customView.timeSource = timeArr;
//    
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    button.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:button];
    
    
    
    
    
    
    
    
    
}

//自定义排序方法
-(NSComparisonResult)comparePerson:(Person *)person{
    //默认按年龄排序
    NSComparisonResult result = [[NSNumber numberWithInt:person.age] compare:[NSNumber numberWithInt:self.age]];//注意:基本数据类型要进行数据转换
    //如果年龄一样，就按照名字排序
    if (result == NSOrderedSame) {
        result = [self.name compare:person.name];
    }
    return result;
}
-(void)btnClick{
    
//    LPActionSheet * actionSheet = [[LPActionSheet alloc]initWithTitle:@"11" cancelButtonTitle:@"取消" destructiveButtonTitle:@"大大方方" otherButtonTitles:@[@"算了",@"OMG"] handler:^(LPActionSheet *actionSheet, NSInteger index) {
//        NSLog(@"%@    %ld",actionSheet,(long)index);
//    }];
//    [actionSheet show];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  ccAlert
//
//  Created by 陈诚 on 2018/10/9.
//  Copyright © 2018 chen cheng. All rights reserved.
//

#define Screen_height [[UIScreen mainScreen]bounds].size.height
#define Screen_width  [[UIScreen mainScreen]bounds].size.width



#import "ViewController.h"

#import "chooseLoanPeriod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSArray *titleList = @[@"3个月",@"6个月",@"12个月",@"18个月"];

    chooseLoanPeriod *chooseLoanPeriodView = [[chooseLoanPeriod alloc]initTitles:titleList andWithframe:CGRectMake(0,  120, Screen_width, Screen_height/4)];
    chooseLoanPeriodView.selectBlock = ^(NSInteger selectIndex){

        NSLog(@"%ld",selectIndex);
        
    };
    [self.view addSubview:chooseLoanPeriodView];
    
}


@end

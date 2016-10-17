//
//  ViewController.m
//  cornerRadius
//
//  Created by 刘森 on 16/8/22.
//  Copyright © 2016年 ls. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+cornerRadius.h"
#import "UIView+viewCorenRadius.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

- (void)creatUI{
    //圆角 ImageView
    UIImageView* iv = \
    [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"43_2.jpg"] circleImage]];
    iv.frame = CGRectMake(0, 0, 100, 100);
    iv.center = self.view.center;
//    iv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:iv];
    
    //圆角 View
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [view addRadiusView:[UIColor redColor]];

    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

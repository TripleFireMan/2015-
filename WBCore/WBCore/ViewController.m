//
//  ViewController.m
//  WBCore
//
//  Created by 成焱 on 15/5/19.
//  Copyright (c) 2015年 成焱. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    self.title = @"例子代码";
    [self.navigationItem startAnimationAt:WBNavigationBarLoaderPositionCenter];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationItem stopAnimation];
    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

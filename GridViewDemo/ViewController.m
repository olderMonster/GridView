//
//  ViewController.m
//  GridViewDemo
//
//  Created by kehwa on 16/7/4.
//  Copyright © 2016年 kehwa. All rights reserved.
//

#import "ViewController.h"

#import "GridView.h"

@interface ViewController ()

@property (nonatomic , strong)GridView *gridView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.gridView];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.gridView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height);
}


- (GridView *)gridView{
    if (_gridView == nil) {
        _gridView = [[GridView alloc]init];
    }
    return _gridView;
}


@end

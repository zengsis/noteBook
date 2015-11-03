//
//  ViewControllerD.m
//  1111
//
//  Created by apple on 15/9/19.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewControllerD.h"
#import "DrawBoard.h"

@interface ViewControllerD ()

@end

@implementation ViewControllerD

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"统计";
    self.tabBarItem.image = [[UIImage imageNamed:@"statistic-512.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DrawBoard *drawBoard = [[DrawBoard alloc]initWithFrame:self.view.bounds];
    drawBoard.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawBoard];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

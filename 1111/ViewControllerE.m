//
//  ViewControllerE.m
//  1111
//
//  Created by apple on 15/9/19.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewControllerE.h"

@interface ViewControllerE ()

@end

@implementation ViewControllerE

- (void)viewDidLoad {
    [super viewDidLoad];
    //标签
    self.tabBarItem.title = @"搜索";
    self.tabBarItem.image = [[UIImage imageNamed:@"search-128.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

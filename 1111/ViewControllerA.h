//
//  ViewController.h
//  1111
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerA : UIViewController//<SaveTaskRecordDelegate>
@property (nonatomic, strong,readonly) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *noteArray;
@end


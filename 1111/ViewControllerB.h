//
//  ViewControllerB.h
//  1111
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerA.h"

@interface ViewControllerB : UIViewController
@property (nonatomic,copy) NSString *titleText;
//@property (nonatomic,copy) NSString *ContentText;
@property (nonatomic,weak) ViewControllerA *firstVc;
@property (nonatomic)NSInteger row;
//@property (nonatomic,copy) void (^returnTitleBlock)(NSString *taskTitle);
@end
















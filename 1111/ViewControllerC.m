//
//  ViewControllerC.m
//  1111
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewControllerC.h"
#import "Masonry.h"
#import "ViewControllerB.h"
#import "DataManager.h"

@interface ViewControllerC()
{
    UIImageView *_taskImageView;
}
@end
@implementation ViewControllerC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    //页面导航栏文字
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0.0f,0.0f, 120.0f, 36.0f)];
    label.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    label.text=@"任务详情";
    self.navigationItem.titleView = label;


//彩条栏
   /* UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor redColor];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(50));
        make.left.equalTo(@(120));
        make.left.equalTo(MASBoxValue(CGSizeMake(100, 100)));
    }];*/

   // [self.view addSubview:greenView];
  /*
    UIView *yellowView = [[UIView alloc]init];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(50));
        make.left.equalTo(@(120));
        make.left.equalTo(MASBoxValue(CGSizeMake(100, 100)));
    }];

    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIView *purpleView = [[UIView alloc]init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];*/
   
    UILabel *rLabel = [[UILabel alloc] init];
    rLabel.numberOfLines = 0 ;
    //rLabel.text = @"娜迦喜欢充当中路小学生，切记不要跟她一块，否则坑死不偿命。";
    
    [self.view addSubview:rLabel];
    [rLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@160);
        make.right.equalTo(@20);
    }];
        UILabel *label1 = [[UILabel alloc]init];
        label1.text = @"任务一：陪娜迦打游戏";
        label1.numberOfLines = 0;
        label1.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.top.equalTo(@90);
            make.right.equalTo(@20);
                }];
 /*
  NSDictionary *taskRecordDic = [[DataManager sharedManager].taskArray firstObject];
    NSString *path = taskRecordDic[@"imageURL"];
    if (path && path.length) {
        _taskImageView.image = [UIImage imageWithContentsOfFile:path];
    }else
    {
        _taskImageView.image = [UIImage imageNamed:@"image.jpg"];
    }
  */
    _taskImageView = [[UIImageView alloc]init];
    _taskImageView.image = [UIImage imageNamed:@"5.jpg"];
    [self.view addSubview:_taskImageView];
    [_taskImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rLabel.mas_bottom).offset(40);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@160);
    }];
}

@end
    


















//
//  ViewControllerB.m
//  1111
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewControllerB.h"
#import "ViewControllerC.h"
#import "DataManager.h"
#import "ColorRadioButton.h"
#import "Masonry.h"

@interface ViewControllerB ()
{
    UITextField *inputTitle;//输入框中显示的字体
    UITextField *inputContent;
    ColorRadioButton *_radioBtn;
    UIImageView *_thumbImageView;
    UIButton *_deleteBtn;
    UIImageView *_imageSec;
    NSInteger _selectedIndex;
   }

@end

@implementation ViewControllerB

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 //转到第三张
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *nextToC = [[UIButton alloc]initWithFrame:CGRectMake(100, 60, 200, 50)];
    [nextToC setTitle:@"2.nextToC" forState:UIControlStateNormal];
    [nextToC addTarget:self action:@selector(nextToCClicked:) forControlEvents:UIControlEventTouchUpInside];
   
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0.0f,0.0f, 120.0f, 36.0f)];
    label.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    label.text=@"添加新任务";
    self.navigationItem.titleView = label;
    [self.view addSubview:nextToC];
    [self creatTitle];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didSaveClicked:)];
          [self accessoryToolBar];
    _imageSec = [[UIImageView alloc]init];
     _imageSec.image = [UIImage imageNamed:@"1.jpg"];


}

//“添加新任务” 标题,输入框
- (void)creatTitle
{
    CGSize size = self.view.frame.size;
          //输入框
    CGRect inputRect;
    inputRect.origin = CGPointMake(25, 120);
    inputRect.size = CGSizeMake(size.width - 30, 40);
    //输入框中显示的字体
    inputTitle = [[UITextField alloc]initWithFrame:inputRect];
    inputTitle.borderStyle = UITextBorderStyleNone;
    inputTitle.layer.borderWidth = 1;
    inputTitle.layer.borderColor = [UIColor yellowColor].CGColor;
    inputTitle.placeholder = @"请输入任务";
    [self.view addSubview:inputTitle];
    
    //输入框
    CGRect inputRect2;
    inputRect2.origin = CGPointMake(25, 170);
    inputRect2.size = CGSizeMake(size.width - 30, 100);
    //输入框中显示的字体
    inputContent = [[UITextField alloc]initWithFrame:inputRect2];
    inputContent.borderStyle = UITextBorderStyleNone;
    inputContent.layer.borderWidth = 1;
    inputContent.layer.borderColor = [UIColor yellowColor].CGColor;
    inputContent.placeholder = @"请输入内容";
    [self.view addSubview:inputContent];
    
}

//保存方法
- (void)didSaveClicked:(id)sender
{
    NSString *text =inputTitle.text;
    NSString *content = inputContent.text;
    NSMutableDictionary *taskDic = [NSMutableDictionary dictionary]
    ;
    taskDic[@"title"] = text;
    taskDic[@"content"] = content;
    taskDic[@"index"] = @(_selectedIndex);
    [[DataManager sharedManager]addTaskRecord:taskDic];
    

   // taskDic[@"image"] = _imageSec;
    //[[DataManager sharedManager] addTaskRecord:taskDic];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)nextToCClicked:(id)sender
{
    ViewControllerC *vctrlC = [ViewControllerC new];
    [self.navigationController pushViewController:vctrlC animated:YES];
}

//工具条
- (void)accessoryToolBar {
    UIView *bgView =[[UIView alloc]init];
    _radioBtn = [[ColorRadioButton alloc]init];
    
    bgView.backgroundColor = [UIColor colorWithRed:80.0/255 green:227.0/255 blue:194.0/255 alpha:1.0];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputContent.mas_bottom).offset(0);
        make.width.equalTo(inputContent.mas_width);
        make.left.equalTo(@25);
        make.height.equalTo(@35);
    }];
    
    [self createItem:bgView action:@selector(didMapsClicked:) x:8 image:@"Maps"];
    [self createItem:bgView action:@selector(didPhotosClicked:) x:48 image:@"Photos"];
    [self createItem:bgView action:@selector(didCameraClicked:) x:88 image:@"Camera"];
    _radioBtn = [[ColorRadioButton alloc] initWithFrame:CGRectMake(180 , 6, 120, 32)];
    //使用自动布局挂掉了
    /*[_radioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputContent.mas_bottom);
        make.height.equalTo(@15);
        make.width.equalTo(@(120));
        make.right.equalTo(@(-20));
    }];*/
    [_radioBtn addTarget:self action:@selector(didValueChanged:) forControlEvents:UIControlEventValueChanged];
    [bgView addSubview:_radioBtn];
    _radioBtn.colorArray = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
}

- (void)didMapsClicked:(UIButton *)sender {
    
}

- (void)didPhotosClicked:(UIButton *)sendr {
    
}

- (void)didCameraClicked:(UIButton *)sender {
    
}

- (void)createItem:(UIView *)view action:(SEL)action x:(CGFloat)x image:(NSString *)image {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.frame = CGRectMake(x, 6, 32, 32);
    [view addSubview:btn];
}

- (void)didValueChanged:(ColorRadioButton *)sender {
    NSLog(@"%ld", sender.selectedIndex);
    _selectedIndex = sender.selectedIndex;
}




@end








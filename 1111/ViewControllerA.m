//
//  ViewController.m
//  1111
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"
#import "DataManager.h"
#import "CustomCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface ViewControllerA ()<UITableViewDataSource,UITableViewDelegate>
{
      NSIndexPath *deleteIndexPath;
    UITableView *_tableView;
}

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
 //标签
    self.view.backgroundColor = [UIColor grayColor];
    self.tabBarItem.title = @"任务";
self.tabBarItem.image = [[UIImage imageNamed:@"12.File-128.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//导航条删除
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(didDeleteClicked:)];
    
//下一页转到B 导航条
    
    UIButton *nextToB = [[UIButton alloc]init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(nextToBClicked:)];
       [self.view addSubview:nextToB];
        [self.view addSubview:_tableView];
   
    
//首页内容显示
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0.0f,0.0f, 120.0f, 36.0f)];
    label.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    label.text=@"任务列表";
    self.navigationItem.titleView = label;

    CGSize size = self.view.frame.size;
//表格
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, size.width, size.height) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_tableView];
//给UITableViewDataSource提供数据
    _tableView.dataSource = self;
//设置UITableView的样式
    _tableView.delegate = self;
//注册cell的重用标记符，可以注册多个标志符，每个标志符对应一类cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView reloadData];
    [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"customCell"];
 //导航条跟标签栏一起用的时候
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

//新建下一个页面B
- (void)nextToBClicked:(id)sender
{
    ViewControllerB *vctlB = [ViewControllerB new];
    [self.navigationController pushViewController:vctlB animated:YES];
}


//删除按钮的方法
- (void)didDeleteClicked:(id)sender
{
    _tableView.editing = !_tableView.editing;
}

//询问表格中一共有几个Section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

 //询问某个Section中有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[DataManager sharedManager].taskArray count];
    }else{
        return 0;
    }
}

//取indexPath对应的行所要显示的Cell视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{     CustomCell *customCell = nil;
    /*if (indexPath.row%2) {
        customCell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
        customCell.coloredLine.backgroundColor = [UIColor yellowColor];
    }else{
          customCell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
        customCell.coloredLine.backgroundColor = [UIColor blueColor];
    }*/
    customCell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    //数据源搬到单例后，从单例中得到数据
    NSArray *array = [DataManager sharedManager].taskArray;
    customCell.titleLabel.text = [array[indexPath.row] objectForKey:@"title"];
    customCell.subTitleLabel.text = [array[indexPath.row] objectForKey:@"content"];
    customCell.avatorImageView.image = [UIImage imageNamed:@"1.jpg"];
    
    
    NSNumber *number = [[DataManager sharedManager].taskArray[indexPath.row] objectForKey:@"index"];
    NSLog(@"%@",number);
    if (number.integerValue == 0)
    {
        customCell.coloredLine.backgroundColor = [UIColor redColor];
    }
    else if(number.integerValue == 1)
        {
            customCell.coloredLine.backgroundColor = [UIColor greenColor];
        }
       else
        {
            customCell.coloredLine.backgroundColor = [UIColor blueColor];
        }

    
   // customCell.avatorImageView.image =
   // [array[indexPath.row]objectForKey:@"image"];
/*
[customCell.avatorImageView sd_setImageWithURL:[NSURL URLWithString:@"http://t1.27270.com/uploads/allimg/150626/7_0626164F02L9.jpg"] placeholderImage:[UIImage imageNamed:@"logo_32x32.png"]];*/
    
    return customCell;
}

//开始进行编辑操作，比如删除和插入
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        deleteIndexPath = indexPath;//删除时使用
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"提示" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定✅", nil];
        [alertView show];//弹出提示框
        
    }
}

//警告问题，创建并弹出提示框
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"消失的位置:%ld",buttonIndex);
    if (buttonIndex == 0)
    {
    //点击取消的话恢复状态
    [_tableView reloadRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else if (buttonIndex == 1)
    {
     //点击确定就删除数组里对应的数据，同时移除UI上的Cell
//        [_noteArray removeObjectAtIndex:deleteIndexPath.row];
        [[DataManager sharedManager] removeTaskAtIndex:deleteIndexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//设置高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    height = [[[[DataManager sharedManager].taskArray objectAtIndex:indexPath.row]objectForKey:@"content"]
              sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake(200, 1500) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    return height+80;
}

//用户点击任意一个Cell时调用，获取用户选择
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Section:%ld,Row:%ld",indexPath.section, indexPath.row);
    ViewControllerC *thirdVc= [[ViewControllerC alloc]init];
    [self.navigationController pushViewController:thirdVc animated:YES];

}


- (void)viewWillAppear:(BOOL)animated{
    [_tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end













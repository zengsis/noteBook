//
//  DataManager.h
//  1111
//
//  Created by apple on 15/9/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    NSIndexPath *_indexPath;
}

//一个可变数组用来装任务记录
@property (nonatomic,strong) NSMutableArray *taskArray;
@property (nonatomic)NSInteger row;
//类方法获取共享的对象
+ (instancetype) sharedManager;
//添加纪录
- (void)addTaskRecord:(NSDictionary *)task;
- (void)removeTaskAtIndex:(NSInteger)index;
- (void)exchange:(NSIndexPath *)index;
@end











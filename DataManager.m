//
//  DataManager.m
//  1111
//
//  Created by apple on 15/9/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DataManager.h"

//静态外部变量，生命周期是整个进程的生命周期
static DataManager *instance = nil;
@implementation DataManager

//此方法在该类的任意其他方法之前调用，且只会调用一次
+ (void)initialize
{
//在这个只会安全调用一次的方法中来创建这个唯一的对象
    instance = [DataManager new];
}

//这个方法由alloc方法触发自动调用，覆盖此方法可以修改行为
//实现alloc返回的对象也是共享的那唯一的对象
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    //synchronized关键字属于多线程，后面会讲，暂时记住形式
    @synchronized(instance)
    {
        if (instance) {
            return instance;
        }
    }
    return [super allocWithZone:zone];
}

+ (instancetype)sharedManager
{
    return instance;
}

- (instancetype)init
{
  if(self = [super init])
  {
     //数据源容器用最简单的plist文件存储，初始化的时候从文件恢复数据
      _taskArray = [NSMutableArray arrayWithContentsOfFile:@"/Users/apple/Desktop.task.plist"];
      if (_taskArray == nil)
      {
          //文件初始化失败时创建新的空的可变数组
          _taskArray = [NSMutableArray array];
      }

  }
    return self;
}

- (void)addTaskRecord:(NSDictionary *)task
{
    [_taskArray addObject:task];
    //添加纪录后，同时写入文件持久化保存
    [_taskArray writeToFile:[self filePath] atomically:YES];
}

- (NSString *)filePath{
    return [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/task.plist"];
}

- (void)removeTaskAtIndex:(NSInteger)index{
    [_taskArray removeObjectAtIndex:index];
    [_taskArray writeToFile:[self filePath] atomically:YES];
}

- (void)exchange:(NSIndexPath *)index
{
    _indexPath = index;
}
@end













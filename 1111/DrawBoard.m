//
//  DrawBoard.m
//  1111
//
//  Created by apple on 15/9/19.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "DrawBoard.h"
@interface DrawBoard()
{
    CGFloat _f;
}
@end
@implementation DrawBoard

- (void)drawRect:(CGRect)rect
{   CGSize size = self.frame.size;
    CGContextRef  context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(10, 120, size.width-20, 130 ));
    [[UIColor redColor] setStroke];
    [[UIColor greenColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSString *name = @"任务统计";
    NSString *number =@"每日任务数（周）";
    NSString *finish =@"任务完成率（周）";
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor],NSBackgroundColorAttributeName:[UIColor greenColor],};
    NSDictionary *dict1 = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor greenColor],NSBackgroundColorAttributeName:[UIColor whiteColor]};
    [name drawInRect:CGRectMake(150, 20, 150 , 30)withAttributes:dict];
    [number drawInRect:CGRectMake(100, 60, 160, 30)withAttributes:dict1];
    [finish drawInRect:CGRectMake(100, 260, 160, 30)withAttributes:dict1];
    
    CGContextAddRect(context, CGRectMake(25, 145,13 , 105 ));
    [[UIColor redColor] setStroke];
    [[UIColor orangeColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextAddRect(context, CGRectMake(55, 210, 13, 40 ));
    [[UIColor redColor] setStroke];
    [[UIColor orangeColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextAddRect(context, CGRectMake(85, 190, 13, 60 ));
    [[UIColor redColor] setStroke];
    [[UIColor orangeColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextAddRect(context, CGRectMake(115, 130, 13, 120 ));
    [[UIColor redColor] setStroke];
    [[UIColor orangeColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
//

     /* CGContextAddArc(context, 190, 400, 100, 0, M_PI, 0);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);*/
    //画圆
    CGContextAddEllipseInRect(context, CGRectMake(90, 300, 200, 200));
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    [[UIColor orangeColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    [self draw];
}

-(void)draw
{    CGContextRef  context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context,190, 400);//设置起点
    CGContextAddLineToPoint(context,490, 400);
    CGContextAddLineToPoint(context,90, 700);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    //设置填充色
   // CGContextDrawPath(context,kCGPathFillStroke);//绘制路径path
    CGContextClip(context);
    CGContextAddEllipseInRect(context, CGRectMake(90, 300, 200, 200));
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    [[UIColor blueColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end



















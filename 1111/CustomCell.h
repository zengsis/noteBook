//
//  CustomCell.h
//  1111
//
//  Created by apple on 15/9/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (nonatomic,strong,readonly)UIView *coloredLine;//竖杠
@property (nonatomic,strong,readonly)UILabel *titleLabel;//标题
@property (nonatomic,strong,readonly)UILabel *subTitleLabel;//昵称
@property (nonatomic,strong,readonly)UIImageView *avatorImageView;//头像
@end

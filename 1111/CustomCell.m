//
//  CustomCell.m
//  1111
//
//  Created by apple on 15/9/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        _coloredLine =[[UIView alloc]init];
        [self.contentView addSubview:_coloredLine];//杠
        
        _avatorImageView = [[UIImageView alloc]init];//头像
        [self.contentView addSubview:_avatorImageView];
        
        _titleLabel = [[UILabel alloc]init];//标题
        [self.contentView addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc]init];//内容
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.numberOfLines = 0;
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = self.frame.size;
    _coloredLine.frame = CGRectMake(2, 2, 5, size.height -15);
    CGFloat colorR = CGRectGetMaxX(_coloredLine.frame);
    _titleLabel.frame = CGRectMake(colorR, 10, size.width - colorR - 32, size.height/2);
    _subTitleLabel.frame = CGRectMake(colorR, size.height/2, size.width - colorR - 32, size.height/2);
    CGFloat cellRX = CGRectGetMaxX(self.frame);
    _avatorImageView.frame = CGRectMake(cellRX-32, (size.height-32)/2, 32, 32);
}
@end



















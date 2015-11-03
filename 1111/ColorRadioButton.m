//
//  ColorRadioButton.m
//  1111
//
//  Created by apple on 15/9/20.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ColorRadioButton.h"
@interface ColorRadioButton()
{
   UIImageView *_checkImageView;
}
@end

@implementation ColorRadioButton
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Checkmark"]];
        _checkImageView.frame = CGRectMake(0, 0, 26, 20);
        [self addSubview:_checkImageView];
    }
    
    return self;
}

- (void)setColorArray:(NSArray *)colorArray {
    _colorArray = [colorArray copy];
    
    //移除所有子视图
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //n * w + (n + 1) * s = self.frame.size.width
    //w = (width - (n + 1) * s) / n
    //s = (width - n * w) / (n + 1)
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat iWidth = (width - (_colorArray.count + 1) * 2) / _colorArray.count;
    
    //按钮大小
    CGFloat iSize = (iWidth > height)?height:iWidth;
    //间隙
    CGFloat iSp = (width - _colorArray.count * iSize) / (_colorArray.count + 1);
    //y
    CGFloat iY = (height - iSize) / 2;
    
    for (int i = 0; i < _colorArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i + 1000;
        btn.backgroundColor = _colorArray[i];
        btn.frame = CGRectMake((iSize + iSp) * i, iY, iSize, iSize);
        btn.layer.cornerRadius = iSize / 2;
        [self addSubview:btn];
    }
    
    [self bringSubviewToFront:_checkImageView];
    _checkImageView.center = CGPointMake(iSize / 2, height / 2);
    [self addSubview:_checkImageView];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    UIView *v = [self viewWithTag:selectedIndex + 1000];
    _checkImageView.center = v.center;
}

- (void)didClicked:(UIButton *)sender {
    _checkImageView.center = sender.center;
    _selectedIndex = sender.tag - 1000;
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


@end

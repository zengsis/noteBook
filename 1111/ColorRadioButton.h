//
//  ColorRadioButton.h
//  1111
//
//  Created by apple on 15/9/20.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorRadioButton : UIControl
@property (nonatomic, copy) NSArray *colorArray;
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithFrame:(CGRect)frame ;
@end

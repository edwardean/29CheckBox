//
//  ZHCustomCheckBox.m
//  ZH29UIControlTest
//
//  Created by Edward on 13-6-29.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCustomCheckBox.h"
#import <QuartzCore/QuartzCore.h>
#define CheckBoxWidth   22  //CheckBox宽度
#define CheckBoxHeight  22  //CheckBox高度
#define CheckBoxGap     10  //每两个CheckBox之间的间隔距离

/**
 简单的callback
 **/
typedef void (^CheckBoxCallback)(BOOL isSelected);
CheckBoxCallback demoBlock= ^(BOOL isSelected)
{
  if(isSelected) {
    NSLog(@"Highlighted!");
  } else {
    NSLog(@"UnHighlighted");
  }
};

@interface ZHCustomCheckBox () {
  
  /**
   根据两种（水平/竖直）排列样式决定水平/竖直能够排列多少个checkBox
   **/
  CGFloat HorizontalBoxNumber;
  CGFloat VerticalBoxNumber;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImage *normalImage;
@property (nonatomic, retain) UIImage *checkedImage;

- (void)setCheckImage:(UIImage *)image forCheckBoxState:(BOOL)isChecked;
- (void)setTitleText:(NSString *)text;

@end

@implementation ZHCustomCheckBox

- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(ZHCheckBoxStyle)style
{
  self = [super initWithFrame:frame];
  if (self) {
    
    UIImage *checkBoxNormalImage;
    UIImage *checkBoxCheckedImage;
    CGRect checkImageViewRect;
    
    switch (style) {
      case ZHCheckBoxStyleRound:
        checkBoxNormalImage = [UIImage imageNamed:@"unchecked.png"];
        checkBoxCheckedImage = [UIImage imageNamed:@"checked.png"];
        checkImageViewRect = CGRectMake(0, 0, 22, 22);
        break;
      case ZHCheckBoxStyleRect:
        checkBoxNormalImage = [UIImage imageNamed:@"checkbox2.png"];
        checkBoxCheckedImage = [UIImage imageNamed:@"checkbox.png"];
        checkImageViewRect = CGRectMake(0, 0, 16, 16);
        break;
      default:
        break;
    }
    
    CGPoint point = frame.origin;
    CGSize size = checkImageViewRect.size;
    [self setCheckImage:checkBoxCheckedImage forCheckBoxState:YES];
    [self setCheckImage:checkBoxNormalImage forCheckBoxState:NO];
    self.checkBoxImageView = [[UIImageView alloc] initWithFrame:CGRectMake(point.x,
                                                                           point.y,
                                                                           size.width,
                                                                           size.height)];
    [_checkBoxImageView setImage:checkBoxNormalImage];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(point.x + 30,
                                                                point.y,
                                                                0,
                                                                0)];
    [self addSubview:_checkBoxImageView];
    [self addSubview:_titleLabel];
    [self setTitleText:@"UnChecked"];
    [self addTarget:self action:@selector(Checked:) forControlEvents:UIControlEventTouchUpInside];
  }

  return self;
}

- (void)setTitleText:(NSString *)text
{
  [self.titleLabel setText:text];
  [self.titleLabel sizeToFit];
}

- (void)Checked:(id)sender
{
  [self setSelected:!self.selected];
  if (self.isSelected) {
    [self.checkBoxImageView setImage:_checkedImage];
    [self setTitleText:@"Checked"];
    NSLog(@"Selected");
  } else {
    [self.checkBoxImageView setImage:_normalImage];
    [self setTitleText:@"UnChecked"];
    NSLog(@"UnSelected");
  }
  demoBlock(self.isSelected);
}

- (void)setCheckImage:(UIImage *)image forCheckBoxState:(BOOL)isChecked
{
  if (isChecked) {
    self.checkedImage = image;
  } else {
    self.normalImage = image;
  }
}

@end

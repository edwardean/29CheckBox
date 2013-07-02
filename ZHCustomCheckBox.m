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
//typedef void (^CheckBoxCallback)(BOOL isHighlighted);
//CheckBoxCallback demoBlock= ^(BOOL isHighlighted)
//{
//  if(isHighlighted) {
//    NSLog(@"Is Highlighted!");
//  } else {
//    NSLog(@"Not Highlighted");
//  }
//};
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

//- (void)changeImageWithState:(UIControlState)state;
//
//- (void)addCallbackForCheckBox:(CheckBoxCallback)callback;
@end

@implementation ZHCustomCheckBox

- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(CheckBoxAlignmentStyle)style
                    numbers:(NSInteger)number
{
  self = [super initWithFrame:frame];
  if (self) {
    CGPoint point = frame.origin;
    [self setCheckImage:[UIImage imageNamed:@"checked.png"] forCheckBoxState:YES];
    [self setCheckImage:[UIImage imageNamed:@"unchecked.png"] forCheckBoxState:NO];
    self.checkBoxImageView = [[UIImageView alloc] initWithFrame:CGRectMake(point.x, point.y, 22, 22)];
    [_checkBoxImageView setImage:[UIImage imageNamed:@"unchecked.png"]];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(point.x + 30, point.y, 0, 0)];
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
  if (self.isSelected) {
    [self.checkBoxImageView setImage:_checkedImage];
    [self setTitleText:@"Checked"];
    NSLog(@"Selected");
  } else {
    [self.checkBoxImageView setImage:_normalImage];
    [self setTitleText:@"UnChecked"];
    NSLog(@"UnSelected");
  }
  [self setSelected:!self.selected];
}

- (void)setCheckImage:(UIImage *)image forCheckBoxState:(BOOL)isChecked
{
  if (isChecked) {
    self.checkedImage = image;
  } else {
    self.normalImage = image;
  }
}

- (void)setHighlighted:(BOOL)highlighted
{
  if (highlighted) {
    NSLog(@"Highlight");
  } else {
    NSLog(@"UnHighlight");
  }
}

@end

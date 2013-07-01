//
//  ZHCustomCheckBox.m
//  ZH29UIControlTest
//
//  Created by Edward on 13-6-29.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCustomCheckBox.h"

#define CheckBoxWidth   22  //CheckBox宽度
#define CheckBoxHeight  22  //CheckBox高度
#define CheckBoxGap     10  //每两个CheckBox之间的间隔距离

/**
 简单的callback
 **/
typedef void (^CheckBoxCallback)(BOOL isHighlighted);
CheckBoxCallback demoBlock= ^(BOOL isHighlighted)
{
  if(isHighlighted) {
    NSLog(@"Is Highlighted!");
  } else {
    NSLog(@"Not Highlighted");
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

- (void)changeImageWithState:(UIControlState)state;

- (void)addCallbackForCheckBox:(CheckBoxCallback)callback;
@end

@implementation ZHCustomCheckBox

- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(CheckBoxAlignmentStyle)style
                    numbers:(NSInteger)number
{
  self = [super initWithFrame:frame];
  if (self) {
//    self.normalImage = [UIImage imageNamed:@"checked"];
//    self.checkedImage = [UIImage imageNamed:@"unchecked"];
//    self.imageView = [[UIImageView alloc] initWithImage:_normalImage];
//    
//    if (style == CheckBoxAlignmentStyleHorizontal) {
//      HorizontalBoxNumber = frame.size.width / (CheckBoxWidth + CheckBoxGap / 2);
//      for (int i=0; i<HorizontalBoxNumber; i++) {
//        CGRect rect = frame;
//        rect.origin.x += i * (CheckBoxWidth + CheckBoxGap / 2);
//        CGFloat originX = rect.origin.x;
//        CGFloat originY = rect.origin.y;
//        UIImageView *imgView = [[UIImageView alloc] initWithImage:_checkedImage];
//        imgView.center = CGPointMake(originX, originY);
//        [self addSubview:imgView];
//        
//      }
//    }
//    
//    if (style == CheckBoxAlignmentStyleVertical) {
//      VerticalBoxNumber = frame.size.width / (CheckBoxHeight + CheckBoxGap / 2);
//      for (int i=0; i<VerticalBoxNumber; i++) {
//        CGRect rect = frame;
//        rect.origin.y = i * (CheckBoxWidth + CheckBoxGap / 2);
//        CGFloat originX = rect.origin.x;
//        CGFloat originY = rect.origin.y;
//        UIImageView *imgView = [[UIImageView alloc] initWithImage:_checkedImage];
//        imgView.center = CGPointMake(originX, originY);
//        [self addSubview:imgView];
//      }
//    }

    self.normalImage = [UIImage imageNamed:@"checked"];
    self.checkedImage = [UIImage imageNamed:@"unchecked"];
    self.imageView = [[UIImageView alloc] initWithFrame:frame];
    [_imageView setImage:_normalImage];
    SEL selector = NSSelectorFromString(@"Checked");
    if ([self respondsToSelector:selector]) {
      [self addTarget:self
               action:selector
     forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchDown];
     //[self addSubview:_imageView];
    }

    CGRect titleLabelRect = CGRectMake(0, 0, 50, 30);
    titleLabelRect.origin.x = frame.origin.x + 30;
    titleLabelRect.origin.y = frame.origin.y;
    UILabel *label = [[UILabel alloc] initWithFrame:titleLabelRect];
    self.titleLabel = label;
    [self addSubview:_titleLabel];
  }

  return self;
}

- (void)Checked
{
  UIControlState state = self.state;
  BOOL isNormal = (state == UIControlStateNormal) ? YES : NO;
  self.selected = !self.selected;
  self.highlighted = !self.highlighted;
  demoBlock(isNormal);
}

- (void)setSelected:(BOOL)selected
{
  [super setSelected:selected];
  if (selected) {
    NSLog(@"Selected");
    //[_imageView setImage:_checkedImage];
    [_titleLabel setText:@"Selected"];
  } else {
    NSLog(@"Not Selected");
    //[_imageView setImage:_normalImage];
    [_titleLabel setText:@"Not Selected"];
  }
  [_titleLabel sizeToFit];
}


- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  [self setNeedsDisplay];
  
//  if (highlighted) {
//    NSLog(@"Is Highlighted!");
//    [_imageView setImage:_normalImage];
//  } else {
//    NSLog(@"Not Highlighted!");
//    [_imageView setImage:_checkedImage];
//  }

}

- (void)drawRect:(CGRect)rect
{
  if (self.highlighted) {
    [_normalImage drawInRect:CGRectMake(0.0, 0.0, _normalImage.size.width, _normalImage.size.height)];
  } else if (self.selected) {
    [_checkedImage drawInRect:CGRectMake(0.0, 0.0, _normalImage.size.width, _normalImage.size.height)];
  }
//  else {
//    [_normalImage drawAtPoint:CGPointZero];
//  }
  
}


@end

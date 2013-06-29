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
@end
@implementation ZHCustomCheckBox

- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(CheckBoxAlignmentStyle)style
                    numbers:(NSInteger)number
{
  self = [super initWithFrame:frame];
  if (self) {
    self.normalImage = [UIImage imageNamed:@"checked"];
    self.checkedImage = [UIImage imageNamed:@"unchecked"];
    self.imageView = [[UIImageView alloc] initWithImage:_normalImage];
    
    if (style == CheckBoxAlignmentStyleHorizontal) {
      HorizontalBoxNumber = frame.size.width / (CheckBoxWidth + CheckBoxGap / 2);
      for (int i=0; i<HorizontalBoxNumber; i++) {
        CGRect rect = frame;
        rect.origin.x += i * (CheckBoxWidth + CheckBoxGap / 2);
        CGFloat originX = rect.origin.x;
        CGFloat originY = rect.origin.y;
        UIImageView *imgView = [[UIImageView alloc] initWithImage:_checkedImage];
        imgView.center = CGPointMake(originX, originY);
        [self addSubview:imgView];
        
      }
    }
    
    if (style == CheckBoxAlignmentStyleVertical) {
      VerticalBoxNumber = frame.size.width / (CheckBoxHeight + CheckBoxGap / 2);
      for (int i=0; i<VerticalBoxNumber; i++) {
        CGRect rect = frame;
        rect.origin.y = i * (CheckBoxWidth + CheckBoxGap / 2);
        CGFloat originX = rect.origin.x;
        CGFloat originY = rect.origin.y;
        UIImageView *imgView = [[UIImageView alloc] initWithImage:_checkedImage];
        imgView.center = CGPointMake(originX, originY);
        [self addSubview:imgView];
      }
    }

  }
  return self;
}
- (void)setHighlighted:(BOOL)highlighted
{
  
}
@end

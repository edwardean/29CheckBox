//
//  ZHCustomCheckBox.h
//  ZH29UIControlTest
//
//  Created by Edward on 13-6-29.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CheckBoxAlignmentStyle) {
  CheckBoxAlignmentStyleHorizontal,
  CheckBoxAlignmentStyleVertical
};

typedef NS_ENUM(NSInteger, CheckBoxState) {
  CheckBoxStateSelected   = 0,
  CheckBoxStateHighlight  = 1 << 0,
  CheckBoxStateNormal     = 1 << 1
};

@interface ZHCustomCheckBox : UIControl

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *checkBoxImageView;

@property (nonatomic, assign) CheckBoxState checkBoxState;


- (void)setCheckImage:(UIImage *)image forCheckBoxState:(BOOL)isChecked;

- (void)setTitleText:(NSString *)text;

- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(CheckBoxAlignmentStyle)style
                    numbers:(NSInteger)number;


@end

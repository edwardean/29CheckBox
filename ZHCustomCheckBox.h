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

typedef enum ZHCheckBoxStyle_ {
  ZHCheckBoxStyleRound,
  ZHCheckBoxStyleRect
} ZHCheckBoxStyle;

@interface ZHCustomCheckBox : UIControl

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *checkBoxImageView;

@property (nonatomic, assign) CheckBoxState checkBoxState;

/**
  CheckBox构造方法
 frame：checkBox的坐标大小
 style：checkBox的外观样式，目前有两种rect和round
 **/
- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(ZHCheckBoxStyle)style;


@end

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



@interface ZHCustomCheckBox : UIControl

@property (nonatomic, retain) UILabel *titleLabel;

- (id)initCheckBoxWithFrame:(CGRect)frame
              AligmentStyle:(CheckBoxAlignmentStyle)style
                    numbers:(NSInteger)number;
@end

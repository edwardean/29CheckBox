//
//  ZHCustomCheckBox.m
//  ZH29UIControlTest
//
//  Created by Edward on 13-6-29.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCustomCheckBox.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

static const char * BlockActionIdentifier = "BlockActionIdentifier";

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

@interface ZHCustomCheckBox ()
{
  /**
   根据两种（水平/竖直）排列样式决定水平/竖直能够排列多少个checkBox
   **/
  CGFloat HorizontalBoxNumber;
  CGFloat VerticalBoxNumber;
}

@property (nonatomic, retain) UIImageView *checkBoxImageView;
@property (nonatomic, retain) UIImage *normalImage;
@property (nonatomic, retain) UIImage *checkedImage;

- (void)setCheckImage:(UIImage *)image forCheckBoxState:(BOOL)isChecked;
- (void)setTitleText:(NSString *)text;

@end

@implementation ZHCustomCheckBox

@synthesize titleLabel = titleLabel_;
@synthesize checkBoxImageView = checkBoxImageView_;
@synthesize normalImage = normalImage_;
@synthesize checkedImage = checkedImage_;

- (id)initCheckBoxWithFrame:(CGRect)frame
						unSelectedTitle:(NSString *)unselectedTitle
							selectedTitle:(NSString *)selectedTitle
							CheckBoxStyle:(ZHCheckBoxStyle)style
											block:(void(^)(void))block
					 forControlEvents:(UIControlEvents)controlEvents
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
		[checkBoxImageView_ setImage:checkBoxNormalImage];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(point.x + 30,
																																point.y,
																																0,
																																0)];
		[self addSubview:checkBoxImageView_];
		[self addSubview:titleLabel_];
		[self.titleLabel setText:unselectedTitle];
		
		
		NSMutableArray *blockActionArray = objc_getAssociatedObject(self,
																																&BlockActionIdentifier);
		if (blockActionArray == nil) {
			blockActionArray = [NSMutableArray arrayWithCapacity:0];
			objc_setAssociatedObject(self,
															 &BlockActionIdentifier,
															 blockActionArray,
															 OBJC_ASSOCIATION_RETAIN);
		}
		
		BlockHandler *handler = [[BlockHandler alloc] init];
		[handler setBlockCallBack:block];
		[blockActionArray addObject:handler];
		
		[self addTarget:handler
						 action:@selector(invokeBlock:)
	 forControlEvents:controlEvents];
		
		[self addTarget:self
             action:@selector(changeState)
   forControlEvents:UIControlEventTouchUpInside];
		
	}
	return self;
}


- (void)setTitleText:(NSString *)text
{
  [self.titleLabel setText:text];
  [self.titleLabel sizeToFit];
}

- (void)changeState
{
  [self setSelected:!self.selected];
  if (self.isSelected) {
    [self.checkBoxImageView setImage:checkedImage_];
    [self setTitleText:@"Checked"];
    NSLog(@"Selected");
  } else {
    [self.checkBoxImageView setImage:normalImage_];
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


@implementation BlockHandler

@synthesize blockCallBack;

- (void)invokeBlock:(id)sender
{
	[self blockCallBack]();
}

- (void)dealloc
{
	[self setBlockCallBack:nil];
}

@end
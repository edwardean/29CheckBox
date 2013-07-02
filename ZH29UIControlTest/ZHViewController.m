//
//  ZHViewController.m
//  ZH29UIControlTest
//
//  Created by Edward on 13-6-29.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHCustomCheckBox.h"

@interface ZHViewController ()

@end

@implementation ZHViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
	
	ZHCustomCheckBox *checkBox = [[ZHCustomCheckBox alloc]
																initCheckBoxWithFrame:CGRectMake(10, 10, 70, 22)
																			unSelectedTitle:@"关住TA"
																				selectedTitle:@"取消关注"
																				CheckBoxStyle:ZHCheckBoxStyleRect
																								block:^{
																		[[[UIAlertView alloc] initWithTitle:@"你好" message:@"已经关注此人" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];
																	}
																		forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:checkBox];
  
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

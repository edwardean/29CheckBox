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
                                initCheckBoxWithFrame:CGRectMake(10, 10, 320, 200)
                                        AligmentStyle:CheckBoxAlignmentStyleHorizontal
                                              numbers:10];
  [self.view addSubview:checkBox];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

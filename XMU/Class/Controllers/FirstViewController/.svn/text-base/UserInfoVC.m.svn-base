//
//  UserInfoVC.m
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "UserInfoVC.h"
#import "UserInfoPhotoVC.h"

@interface UserInfoVC ()

@end

@implementation UserInfoVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"填写基本资料"];
    [self setLbtnNormal];
    [self setRBtn:nil image:@"next" imageSel:nil target:self action:@selector(nextClick)];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)nextClick {
    UserInfoPhotoVC *vc = [[UserInfoPhotoVC alloc] initWithNibName:@"UserInfoPhotoVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

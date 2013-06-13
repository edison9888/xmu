//
//  LoginViewController.m
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "UserInfoPhotoVC.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.hidesBottomBarWhenPushed = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = @"登录微商圈";
    [self setLbtnNormal];
    [self setRBtn:nil image:@"next" imageSel:nil target:self action:@selector(nextClick)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Di.hspose of any resources that can be recreated.
}

- (void)nextClick {
    UserInfoPhotoVC *vc = [[UserInfoPhotoVC alloc] initWithNibName:@"UserInfoPhotoVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userEmail) {
        [_passWord becomeFirstResponder];
    }
    else
        [textField resignFirstResponder];
    return YES;
}

- (IBAction)loginClick:(id)sender {
}

- (IBAction)regClick:(id)sender {
    RegistViewController *vc = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end

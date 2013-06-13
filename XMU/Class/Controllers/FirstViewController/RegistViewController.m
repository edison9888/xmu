//
//  RegistViewController.m
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "RegistViewController.h"
#import "UserInfoVC.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

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
    self.title = @"注册帐号";
    [self setLbtnNormal];
    [self setRBtn:nil image:@"next" imageSel:nil target:self action:@selector(nextClick)];
    
    [_userEmail becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextClick {
    UserInfoVC *vc = [[UserInfoVC alloc] initWithNibName:@"UserInfoVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userEmail) {
        [_passWord becomeFirstResponder];
    }
    else if (textField == _passWord) {
        [_passWord2 becomeFirstResponder];
    }
    else
        [textField resignFirstResponder];
    return YES;
}

- (IBAction)userXieYiClick:(id)sender {
}
@end

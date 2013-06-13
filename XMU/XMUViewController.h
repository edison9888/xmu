//
//  XMUViewController.h
//  XMU
//
//  Created by 林小果 on 13-6-2.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseVC.h"
#import "LoginViewController.h"

#import "LeveyTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface XMUViewController : BaseVC <UINavigationControllerDelegate>
{
    LeveyTabBarController *leveyTabBarController;
    
    IBOutlet UITextField *_userEmail;
    IBOutlet UITextField *_passWord;
}

- (IBAction)loginClick:(id)sender;
- (IBAction)regClick:(id)sender;

- (IBAction)enter:(id)sender;

@end

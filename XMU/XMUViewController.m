//
//  XMUViewController.m
//  XMU
//
//  Created by 林小果 on 13-6-2.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "XMUViewController.h"
#import "XMUAppDelegate.h"

#import "RegistViewController.h"
#import "UserInfoPhotoVC.h"


@interface XMUViewController ()

@end

@implementation XMUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //self.hidesBottomBarWhenPushed = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = @"登录微商圈";
    [self setLbtnNormal];
    [self setRBtn:nil image:@"next" imageSel:nil target:self action:@selector(nextClick)];
    
    NSString *myJID = [[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyJID];
	NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyPassword];
    
    if (myJID)
        _userEmail.text = myJID;
    if (myPassword)
        _passWord.text = myPassword;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController.hidesBottomBarWhenPushed)
    {
        [leveyTabBarController hidesTabBar:YES animated:YES];
    }
    else
    {
        [leveyTabBarController hidesTabBar:NO animated:YES];
    }
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
    
    NSString *myJID = _userEmail.text;
    NSString *myPassword = _passWord.text;
    
    if ([myJID rangeOfString:@"s1.weicircle.com"].length > 0)
    {
    
    }
    else
    {
        myJID = [NSString stringWithFormat:@"%@@s1.weicircle.com", myJID];
    }
    [[NSUserDefaults standardUserDefaults] setValue:myJID forKey:kXMPPmyJID];
    [[NSUserDefaults standardUserDefaults] setValue:myPassword forKey:kXMPPmyPassword];
    
    XMUAppDelegate *delegate = (XMUAppDelegate *)[[UIApplication sharedApplication] delegate];
    if (![delegate connect])
	{//登陆失败
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.0 * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
		});
	}
    else
    {//登陆成功
        NSLog(@"登陆成功");
        
        [self enter:nil];
    }
}

- (IBAction)regClick:(id)sender {
    RegistViewController *vc = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)enter:(id)sender
{
    FirstViewController *firstVC = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    FourthViewController *fourthVC = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
    FifthViewController *fifthVC = [[FifthViewController alloc] initWithNibName:@"FifthViewController" bundle:nil];
    
    UINavigationController *nc0 = [[UINavigationController alloc] initWithRootViewController:firstVC];
    nc0.delegate = self;
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    nc1.delegate = self;
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    nc2.delegate = self;
    UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    nc3.delegate = self;
    UINavigationController *nc4 = [[UINavigationController alloc] initWithRootViewController:fifthVC];
    nc4.delegate = self;
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:nc0, nc1, nc2, nc3, nc4, nil];
    
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic setObject:[UIImage imageNamed:@"tabbar_item0.png"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"tabbar_item0_selected.png"] forKey:@"Highlighted"];
    [imgDic setObject:[UIImage imageNamed:@"tabbar_item0_selected.png"] forKey:@"Selected"];
    
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"tabbar_item1.png"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"tabbar_item1_selected.png"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"tabbar_item1_selected.png"] forKey:@"Selected"];
    
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"tabbar_item2.png"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"tabbar_item2_selected.png"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"tabbar_item2_selected.png"] forKey:@"Selected"];
    
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic4 setObject:[UIImage imageNamed:@"tabbar_item3.png"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"tabbar_item3_selected.png"] forKey:@"Highlighted"];
    [imgDic4 setObject:[UIImage imageNamed:@"tabbar_item3_selected.png"] forKey:@"Selected"];
    
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic5 setObject:[UIImage imageNamed:@"tabbar_item4.png"] forKey:@"Default"];
    [imgDic5 setObject:[UIImage imageNamed:@"tabbar_item4_selected"] forKey:@"Highlighted"];
    [imgDic5 setObject:[UIImage imageNamed:@"tabbar_item4_selected"] forKey:@"Selected"];
    
    NSArray *imgArr = [NSArray arrayWithObjects:imgDic, imgDic2, imgDic3, imgDic4, imgDic5, nil];
    
    leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
    [leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg.png"]];
    [leveyTabBarController setTabBarTransparent:YES];
    
    XMUAppDelegate *delegate = (XMUAppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.window.rootViewController = leveyTabBarController;
}

@end

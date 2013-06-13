//
//  LoginVC.m
//  XMU
//
//  Created by 林小果 on 13-6-2.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "LoginVC.h"


#import "XMUAppDelegate.h"
#import "MainVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

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
    
    
    NSString *myJID = [[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyJID];
	NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyPassword];
    
    if (myJID)
        _tfuser.text = myJID;
    if (myPassword)
        _tfpswd.text = myPassword;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(id)sender
{
    NSString *myJID = _tfuser.text;
    NSString *myPassword = _tfpswd.text;
    
    [[NSUserDefaults standardUserDefaults] setValue:myJID forKey:kXMPPmyJID];
	[[NSUserDefaults standardUserDefaults] setValue:myPassword forKey:kXMPPmyPassword];
    
    XMUAppDelegate *delegate = (XMUAppDelegate *)[[UIApplication sharedApplication] delegate];
    if (![delegate connect])
	{
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.0 * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
		});
	}
    else
    {
        MainVC *vc = [[MainVC alloc] initWithNibName:@"MainVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end

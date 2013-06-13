//
//  MainVC.m
//  XMU
//
//  Created by 林小果 on 13-6-2.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "MainVC.h"
#import "XMUAppDelegate.h"

@interface MainVC ()

@end

@implementation MainVC

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)friendAction:(id)sender
{
    
}

- (IBAction)classAction:(id)sender
{

}

- (IBAction)commAction:(id)sender
{

}

- (IBAction)settingAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addBuddy:(id)sender
{
    [_tfName resignFirstResponder];
    NSString *buddy = _tfName.text;
    
    XMUAppDelegate *delegate = (XMUAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    XMPPJID *jid = [XMPPJID jidWithString:buddy];
    
    XMPPRoster *xmppRoster = [delegate xmppRoster];
    [xmppRoster subscribePresenceToUser:jid];

}
@end

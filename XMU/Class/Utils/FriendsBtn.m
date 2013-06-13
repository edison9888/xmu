//
//  FriendsBtn.m
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "FriendsBtn.h"

@interface FriendsBtn ()

@end

@implementation FriendsBtn

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
    [_headImg setImageURL:[NSURL URLWithString:self.image]];
    _name.text = self.nameTxt;
    _work.text = self.workTxt;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    _headImg = nil;
    _name = nil;
    _work = nil;
    [super viewDidUnload];
}

@end

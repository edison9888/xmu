//
//  BottomToolBar.m
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "BottomToolBar.h"

@interface BottomToolBar ()

@end

@implementation BottomToolBar

@synthesize index = _index;

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
    _index = 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectIndex:(id)sender {
    UIButton *btn0 = (UIButton *)[self.view viewWithTag:_index];
    btn0.selected = NO;
    
    UIButton *btn = sender;
    int tag = btn.tag;
    _index = tag;
    btn.selected = YES;
    
    if (self.selectBlock) {
        self.selectBlock(tag);
    }
}

@end

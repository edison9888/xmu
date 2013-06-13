//
//  FifthViewController.m
//  XMU
//
//  Created by lihj on 13-6-6.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "FifthViewController.h"
#import "ChatViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

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
//    ChatViewController *vc = [[ChatViewController alloc] initWithNibName:@"ChatViewController" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    float t_h = __MainScreen_Height-49.0-198.0;
    [_scrollViewBig SetFrameHeight:t_h];
    [_scrollViewBig setContentSize:CGSizeMake(__MainScreen_Width, 305)];
    
    _roundImageBtn.imageURL = [NSURL URLWithString:@"http://b.hiphotos.baidu.com/album/w%3D230/sign=03e72a99f3d3572c66e29bdfba136352/d62a6059252dd42a21027cdb023b5bb5c9eab8b2.jpg"];
    _roundImageBtn.backimageName=@"meb_img_bg.png";
    _roundImageBtn.radius=40;
    [_roundImageBtn drawLayerArc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    _scrollViewBig = nil;
    _roundImageBtn = nil;
    [super viewDidUnload];
}
@end

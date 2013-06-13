//
//  BaseVC.m
//  BaseVC
//
//  Created by linxg on 12-11-13.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseVC.h"


@implementation BaseVC

@synthesize h_menu = _h_menu;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		_h_menu = 49;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	_h_menu = 49;
	self.view.backgroundColor = [UIColor clearColor];
}


- (void)dealloc {
	[_backgroud release];
	_backgroud = nil;
	
	[super dealloc];
}

- (IBAction) backAction
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) backAction:(BOOL)animated;
{
	[self.navigationController popViewControllerAnimated:animated];
}

- (IBAction) backToRootVC
{	
	[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) setTitleHidden:(BOOL)isHidden
{
	self.navigationController.navigationBar.hidden = isHidden;
}

- (void) setLBtnHidden:(BOOL)isHidden
{
	self.navigationItem.leftBarButtonItem.customView.hidden = isHidden;
}

- (void) setRBtnHidden:(BOOL)isHidden
{
	self.navigationItem.rightBarButtonItem.customView.hidden = isHidden;
}
//
//- (void) setTitle:(NSString *)t_title
//{
//	[super setTitle:t_title];
//}

-(void) setTitle:(NSString *)t_title withTitleFont:(UIFont *)t_font{
	UILabel *t_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 44)];
	[t_label setBackgroundColor:[UIColor clearColor]];
	[t_label setTextAlignment:NSTextAlignmentCenter];
	[t_label setAdjustsFontSizeToFitWidth:YES];
	[t_label setFont:t_font];
	[t_label setText:t_title];
	[t_label setTextColor:[UIColor whiteColor]];
	self.navigationItem.titleView = t_label;
}

- (NSString *) getTitle
{
	UIButton *btn = (UIButton *)self.navigationItem.titleView;
	if (btn != nil)
		return btn.titleLabel.text;
	else
		return nil;
}

- (void)setLbtnNormal {
    UIButton *t_buttonL = [[UIButton alloc] initWithFrame:CGRectMake(0, 8, 28, 28)];
	[t_buttonL setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
	[t_buttonL setBackgroundImage:[UIImage imageNamed:@"back_bg.png"] forState:UIControlStateNormal];
	[t_buttonL setBackgroundColor:[UIColor clearColor]];
	[t_buttonL addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
	[t_buttonL setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
	[t_buttonL setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	UIBarButtonItem *t_barButtonL = [[[UIBarButtonItem alloc] initWithCustomView:t_buttonL] autorelease];
	[t_buttonL release];
	self.navigationItem.leftBarButtonItem = t_barButtonL;
}

- (void) setLBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action
{
	UIButton *t_buttonL = [[UIButton alloc] initWithFrame:CGRectMake(0, 8, 28, 28)];
	[t_buttonL setTitle:t_str forState:UIControlStateNormal];
	[t_buttonL setBackgroundImage:[UIImage imageNamed:t_img] forState:UIControlStateNormal];
	[t_buttonL setBackgroundImage:[UIImage imageNamed:t_imgSel] forState:UIControlStateHighlighted];
	[t_buttonL setBackgroundColor:[UIColor clearColor]];
	[t_buttonL.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
	[t_buttonL addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	[t_buttonL setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
	[t_buttonL setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	UIBarButtonItem *t_barButtonL = [[[UIBarButtonItem alloc] initWithCustomView:t_buttonL] autorelease];
	[t_buttonL release];
	self.navigationItem.leftBarButtonItem = t_barButtonL;
}

- (void) setRBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action
{
	UIButton *t_buttonR = [[UIButton alloc] initWithFrame:CGRectMake(0, 8, 28, 28)];
	[t_buttonR setTitle:t_str forState:UIControlStateNormal];
	[t_buttonR setImage:[UIImage imageNamed:t_img] forState:UIControlStateNormal];
	[t_buttonR setBackgroundImage:[UIImage imageNamed:t_imgSel] forState:UIControlStateNormal];
	[t_buttonR setBackgroundColor:[UIColor clearColor]];
	[t_buttonR.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
	[t_buttonR addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
	[t_buttonR setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
	[t_buttonR setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	UIBarButtonItem *t_barButtonR = [[[UIBarButtonItem alloc] initWithCustomView:t_buttonR] autorelease];
	[t_buttonR release];
	self.navigationItem.rightBarButtonItem = t_barButtonR;
}

- (void) setBackgroud:(NSString *)t_image
{
	if (_backgroud == nil)
	{
		_backgroud = [[UIImageView alloc] initWithFrame:self.view.frame];
		[self.view addSubview:_backgroud];
		[_backgroud release];
		[self.view sendSubviewToBack:_backgroud];
	}
	
	[_backgroud setImage:[UIImage imageNamed:t_image]];
}

- (NSInteger) widthOfContent
{
	NSInteger w_c = [BaseVC getMainScreenWidth];
	return w_c;
}

- (NSInteger) heightOfStatusBar
{
	NSInteger h_s = 0;
	if (![[UIApplication sharedApplication] isStatusBarHidden])
		h_s = 20;
	
	return h_s;
}

- (NSInteger) heightOfTitle
{
	NSInteger h_t = 0;
	if (![self.navigationController.navigationBar isHidden])
		h_t = 44;
	
	return h_t;
}

- (NSInteger) heightOfMenu
{
	NSInteger h_m = _h_menu;
	return h_m;
}

- (NSInteger) heightOfContent
{
	NSInteger h = [BaseVC getMainScreenHeght];
	NSInteger h_s = [self heightOfStatusBar];
	NSInteger h_t = [self heightOfTitle];
	NSInteger h_m = [self heightOfMenu];
	NSInteger h_c = h - h_s - h_t - h_m;
	
	return h_c;
}

- (NSInteger) heightOfContentWithOutMenu
{
	NSInteger h = [BaseVC getMainScreenHeght];
	NSInteger h_s = [self heightOfStatusBar];
	NSInteger h_t = [self heightOfTitle];
	NSInteger h_c = h - h_t - h_s;
	
	return h_c;
}

+ (NSInteger) getMainScreenHeght
{
	NSInteger h = [[UIScreen mainScreen] bounds].size.height;
	return h;
}

+ (NSInteger) getMainScreenWidth
{
	NSInteger w = [[UIScreen mainScreen] bounds].size.width;
	return w;
}

@end

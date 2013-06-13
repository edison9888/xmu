//
//  BaseVC.h
//  BaseVC
//
//  Created by linxg on 12-11-13.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseVC : UIViewController {
	UIImageView *_backgroud;
	NSInteger _h_menu;//底部菜单高度，缺省=49
}

@property (nonatomic)NSInteger h_menu;

//返回action
- (IBAction) backAction;
- (IBAction) backAction:(BOOL)animated;
//返回导航根视图控制器
- (IBAction) backToRootVC;

//是否显示title
- (void) setTitleHidden:(BOOL)isHidden;
//是否显示左侧按钮
- (void) setLBtnHidden:(BOOL)isHidden;
//是否显示右侧按钮
- (void) setRBtnHidden:(BOOL)isHidden;

//设置标题
//- (void) setTitle:(NSString *)t_title;
//设置标题及设置字体
-(void) setTitle:(NSString *)t_title withTitleFont:(UIFont *)t_font;
//获取标题
- (NSString *) getTitle;

//文本+按钮背景+按钮高亮背景+目标指针+点击action
- (void) setLBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action;
- (void) setRBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action;
- (void)setLbtnNormal;

//设置背景
- (void) setBackgroud:(NSString *)t_image;

//显示内容，高度、宽度
- (NSInteger) widthOfContent;
- (NSInteger) heightOfStatusBar;
- (NSInteger) heightOfTitle;
- (NSInteger) heightOfMenu;
- (NSInteger) heightOfContent;
- (NSInteger) heightOfContentWithOutMenu;

//获取主屏幕高度
+ (NSInteger) getMainScreenHeght;
//获取主屏幕宽度
+ (NSInteger) getMainScreenWidth;

@end

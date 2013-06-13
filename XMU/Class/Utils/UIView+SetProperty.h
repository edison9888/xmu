//
//  UIView+SetProperty.h
//  shoppublic
//
//  Created by apple on 13-1-6.
//  Copyright (c) 2013年 liyunfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SetProperty)

//设置视图的位置
-(void)SetFrameY:(float)num;

//设置视图的位置
-(void)SetFrameX:(float)num;

//设置视图的位置
-(void)SetFrameXY:(float)numx numy:(float)numy;


//设置视图的宽
-(void)SetFrameWidth:(float)num;

//设置视图的高
-(void)SetFrameHeight:(float)num;

//设置视图的宽
-(void)SetFrameWidthAndHeight:(float)numW numH:(float)numH;


//设置视图的相对顶部位置
-(void)marginTop:(float)num view:(UIView*)view;

//设置视图的相对左边位置
-(void)marginLeft:(float)num view:(UIView*)view;


//设置视图的相对左边和顶部位置
-(void)marginLeft:(float)numLeft numTop:(float)numtop view:(UIView*)view;
@end

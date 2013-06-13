//
//  UIView+SetProperty.m
//  shoppublic
//
//  Created by apple on 13-1-6.
//  Copyright (c) 2013年 liyunfei. All rights reserved.
//

#import "UIView+SetProperty.h"

@implementation UIView (SetProperty)
//设置视图的位置
-(void)SetFrameY:(float)num{
    [self setFrame:CGRectMake(self.frame.origin.x, num, self.frame.size.width, self.frame.size.height)];
    
}

//设置视图的位置
-(void)SetFrameX:(float)num{
[self setFrame:CGRectMake(num, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

//设置视图的位置
-(void)SetFrameXY:(float)numx numy:(float)numy{
[self setFrame:CGRectMake(numx, numy, self.frame.size.width, self.frame.size.height)];

}


//设置视图的宽
-(void)SetFrameWidth:(float)num{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, num, self.frame.size.height)];
}

//设置视图的高
-(void)SetFrameHeight:(float)num{
[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, num)];
}

//设置视图的宽
-(void)SetFrameWidthAndHeight:(float)numW numH:(float)numH{
[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, numW, numH)];
}


//设置视图的相对顶部位置
-(void)marginTop:(float)num view:(UIView*)view{
   [self setFrame:CGRectMake(self.frame.origin.x, view.frame.origin.y+view.frame.size.height+ num, self.frame.size.width, self.frame.size.height)];
}

//设置视图的相对左边位置
-(void)marginLeft:(float)num view:(UIView*)view{
   [self setFrame:CGRectMake(view.frame.origin.x+view.frame.size.width+num, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

//设置视图的相对左边和顶部位置
-(void)marginLeft:(float)numLeft numTop:(float)numtop view:(UIView*)view{
 [self setFrame:CGRectMake(view.frame.origin.x+view.frame.size.width+numLeft, view.frame.origin.y+view.frame.size.height+ numtop, self.frame.size.width, self.frame.size.height)];
}

@end

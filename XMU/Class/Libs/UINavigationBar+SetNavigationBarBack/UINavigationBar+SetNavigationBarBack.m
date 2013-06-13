//
//  UINavigationBar+SetNavigationBarBack.m
//  shoppublic
//
//  Created by liu jingya on 12-10-3.
//  Copyright (c) 2012年 liyunfei. All rights reserved.
//

#import "UINavigationBar+SetNavigationBarBack.h"

@implementation UINavigationBar (SetNavigationBarBack)

- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageNamed:@"navigation_bg.png"];
    [image drawInRect:rect];
}

-(void)willMoveToSuperview:(UIView*)newSuperview{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(version >= 5.0){
        [self setBackgroundImage:[UIImage imageNamed:@"navigation_bg.png"] forBarMetrics:UIBarMetricsDefault];
    }
}

@end

//
//  RoundImageBtn.m
//  靠谱
//
//  Created by shifang on 13-4-8.
//  Copyright (c) 2013年 shifang. All rights reserved.
//

#import "RoundImageBtn.h"

@implementation RoundImageBtn
@synthesize backimageName,radius;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//绘制圆形按钮
-(void)drawLayerArc{
    
    
    UIImage *balloon = [UIImage imageNamed:backimageName];
    [[self layer] setContents:(id)[balloon CGImage]];
    
    CGPoint arcCenter=CGPointMake(radius, radius);
    UIBezierPath *arcpath=[UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius-2 startAngle:0*M_PI/180 endAngle:360*M_PI/180 clockwise:YES];
    
    [arcpath closePath];
    CAShapeLayer *shapelayer=[CAShapeLayer layer];
    shapelayer.path=arcpath.CGPath;
    //shapelayer.fillColor=[UIColor blueColor].CGColor;
    //[shapelayer setStrokeColor:[UIColor blueColor].CGColor];
    self.layer.mask=shapelayer;
}

@end

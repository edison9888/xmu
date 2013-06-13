//
//  ClubCell.m
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "ClubCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ClubCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (_type == 1) {
        _memberType.text = @"班级成员";
        [_addType setTitle:@"加入班级" forState:UIControlStateNormal];
    }
    
    _image.layer.masksToBounds = YES; //没这句话它圆不起来
    _image.layer.cornerRadius = 6.0;
    [_image setImageURL:[NSURL URLWithString:@"http://v1.qzone.cc/avatar/201303/18/15/12/5146be5350599773.jpg!200x200.jpg"]];
}

//设置列信息
- (void)setCellContent:(NSDictionary*)obj index:(NSInteger)index{
    
}

@end

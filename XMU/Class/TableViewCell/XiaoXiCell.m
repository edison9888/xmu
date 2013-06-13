//
//  XiaoXiCell.m
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "XiaoXiCell.h"

@implementation XiaoXiCell
@synthesize _headUrl;
@synthesize _userName;
@synthesize _time;
@synthesize _content;


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
    [_headUrl setImageURL:[NSURL URLWithString:@"http://v1.qzone.cc/avatar/201303/18/15/12/5146be5350599773.jpg!200x200.jpg"]];
}

//设置列信息
- (void)setCellContent:(NSDictionary*)obj index:(NSInteger)index{
    
}

@end

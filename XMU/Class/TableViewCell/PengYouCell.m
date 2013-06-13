//
//  PengYouCell.m
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "PengYouCell.h"

@implementation PengYouCell

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
    
    [_head setImageURL:[NSURL URLWithString:@"http://c.hiphotos.baidu.com/album/w%3D2048/sign=b95dbbdffd039245a1b5e60fb3aca5c2/5bafa40f4bfbfbedd1f77b6d79f0f736afc31f71.jpg"]];
    [_image setImageURL:[NSURL URLWithString:@"http://file2.desktx.com/pc/wallpaper/objects/20100802/lunchuan_desktx_1.jpg"]];
}

- (void)setCellContent:(NSDictionary*)obj index:(NSInteger)index {
    
}

@end

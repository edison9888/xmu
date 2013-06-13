//
//  UserCell.m
//  XMU
//
//  Created by 林小果 on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell
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
}

@end

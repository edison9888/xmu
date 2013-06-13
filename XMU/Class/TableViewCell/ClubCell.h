//
//  ClubCell.h
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface ClubCell : UITableViewCell {
    
    IBOutlet EGOImageView *_image;
    IBOutlet UILabel *_name;
    IBOutlet UILabel *_clubMember;
    IBOutlet UILabel *ico1;
    IBOutlet UILabel *ico2;
    
    
    IBOutlet UILabel *_memberType;
    IBOutlet UIButton *_addType;
}

@property (nonatomic, assign)int type;

- (void)setCellContent:(NSDictionary*)obj index:(NSInteger)index;

@end

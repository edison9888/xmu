//
//  XiaoXiCell.h
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface XiaoXiCell : UITableViewCell {
    
    IBOutlet EGOImageView *_headUrl;
    IBOutlet UILabel *_userName;
    IBOutlet UILabel *_time;
    IBOutlet UILabel *_content;
}

@property (nonatomic, retain)IBOutlet EGOImageView *_headUrl;
@property (nonatomic, retain)IBOutlet UILabel *_userName;
@property (nonatomic, retain)IBOutlet UILabel *_time;
@property (nonatomic, retain)IBOutlet UILabel *_content;

- (void)setCellContent:(NSDictionary*)obj index:(NSInteger)index;

@end

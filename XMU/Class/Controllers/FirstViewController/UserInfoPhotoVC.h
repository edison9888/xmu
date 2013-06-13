//
//  UserInfoPhotoVC.h
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoPhotoVC : BaseViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    IBOutlet UIImageView *_userPhoto;
}

- (IBAction)getPhotoClick:(id)sender;
- (IBAction)takePhotoClick:(id)sender;


@end

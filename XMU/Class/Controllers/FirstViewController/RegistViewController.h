//
//  RegistViewController.h
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : BaseViewController {
    
    IBOutlet UITextField *_userEmail;
    IBOutlet UITextField *_passWord;
    IBOutlet UITextField *_passWord2;
    IBOutlet BaseViewController *_userInfoVC;
}


- (IBAction)userXieYiClick:(id)sender;

@end

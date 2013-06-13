//
//  MainVC.h
//  XMU
//
//  Created by 林小果 on 13-6-2.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController
{
    IBOutlet UITableView *_tableView;
    NSMutableArray *_tableData;
    
    IBOutlet UITextField *_tfName;
    IBOutlet UIButton *_btnAddBuddy;
    IBOutlet UIButton *_btnRelogin;
}



- (IBAction)friendAction:(id)sender;
- (IBAction)classAction:(id)sender;
- (IBAction)commAction:(id)sender;
- (IBAction)settingAction:(id)sender;

- (IBAction)addBuddy:(id)sender;
@end

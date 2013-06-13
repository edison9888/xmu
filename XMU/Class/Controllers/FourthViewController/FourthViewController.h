//
//  FourthViewController.h
//  XMU
//
//  Created by lihj on 13-6-6.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
#import "BottomToolBar.h"
#import <CoreData/CoreData.h>
#import "XMPPFramework.h"

@interface FourthViewController : BaseViewController <NSFetchedResultsControllerDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UITableView *_tableViewMore;
    IBOutlet UITableView *_tableViewAddress;
    IBOutlet UITableView *_tableViewFriend;
    
    BottomToolBar *vc;
    NSMutableArray *_arrayData;
    
    
    NSFetchedResultsController *fetchedResultsController;
}

@end

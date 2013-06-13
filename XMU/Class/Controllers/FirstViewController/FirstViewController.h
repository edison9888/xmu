//
//  FirstViewController.h
//  XMU
//
//  Created by lihj on 13-6-6.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "XMPPFramework.h"

@interface FirstViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>{
    
    IBOutlet UIScrollView *_scrollViewTop;
    IBOutlet UIScrollView *_scrollViewBottom;
    IBOutlet UIPageControl *_pageControl;
    
    IBOutlet UITableView *_tableView;
    
    NSFetchedResultsController *fetchedResultsController;
}


@end

//
//  FourthViewController.m
//  XMU
//
//  Created by lihj on 13-6-6.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "FourthViewController.h"
#import "XiaoXiCell.h"

#import "XMUAppDelegate.h"
#import "DDLog.h"
#import "UserCell.h"
#import "ChatViewController.h"
#import "PengYouCell.h"

#if DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_INFO;
#endif


@interface FourthViewController ()
- (XMUAppDelegate *)appDelegate;

@end

@implementation FourthViewController

- (XMUAppDelegate *)appDelegate
{
	return (XMUAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.leveyTabBarController setSelectBlock:^(int selectBlock){
        FourthViewController *view = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
        [self refashSelfView:(UIView*)view];
    }];
    
    _arrayData = [[NSMutableArray alloc] init];
    self.title = @"微聊";
    [self setLbtnNormal];
    [self setRBtn:nil image:@"ico-右边更多" imageSel:@"back_bg" target:self action:@selector(rightClick)];
    
    [_tableView SetFrameHeight:__MainScreen_Height - 49 - 44];
    [self.view addSubview:_tableView];
    
    [_tableViewAddress SetFrameHeight:__MainScreen_Height - 49 - 44];
    _tableViewAddress.hidden = YES;
    [self.view addSubview:_tableViewAddress];
    
    [_tableViewMore SetFrameHeight:__MainScreen_Height - 49 - 44];
    _tableViewMore.hidden = YES;
    [self.view addSubview:_tableViewMore];
    
    [_tableViewFriend SetFrameHeight:__MainScreen_Height - 49 - 44];
    _tableViewFriend.hidden = YES;
    [self.view addSubview:_tableViewFriend];
    
    [self addBottomBtn];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(friendsChnage) name:@"didReceivePresence" object:nil];
    //[self.view SetFrameHeight:__MainScreen_Height-44+80];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void) friendsChnage
{
    [_tableViewAddress reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    _tableView = nil;
    _tableViewMore = nil;
    _tableViewAddress = nil;
    _tableViewFriend = nil;
    [super viewDidUnload];
}

- (void) backAction {
    self.leveyTabBarController.selectedIndex = 0;
}

- (void)rightClick {
    
}

- (void)addBottomBtn {
    vc = [[BottomToolBar alloc] initWithNibName:@"BottomToolBar" bundle:nil];
    [vc.view SetFrameY:__MainScreen_Height - 44 - 49];
    [vc setSelectBlock:^(int index){
        if (index == 10) {
            _tableView.hidden = NO;
            _tableViewFriend.hidden = YES;
            _tableViewAddress.hidden = YES;
            _tableViewMore.hidden = YES;
        }
        else if (index == 11) {
            _tableView.hidden = YES;
            _tableViewAddress.hidden = NO;
            _tableViewMore.hidden = YES;
            _tableViewFriend.hidden = YES;
        }
        else if (index == 12) {
            _tableViewFriend.hidden = NO;
            _tableView.hidden = YES;
            _tableViewAddress.hidden = YES;
            _tableViewMore.hidden = YES;
        }
        else if (index == 13) {
            _tableView.hidden = YES;
            _tableViewAddress.hidden = YES;
            _tableViewMore.hidden = NO;
            _tableViewFriend.hidden = YES;
        }
    }];
    [self.view addSubview:vc.view];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark NSFetchedResultsController
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSFetchedResultsController *)fetchedResultsController
{
	if (fetchedResultsController == nil)
	{
		NSManagedObjectContext *moc = [[self appDelegate] managedObjectContext_roster];
		
		NSEntityDescription *entity = [NSEntityDescription entityForName:@"XMPPUserCoreDataStorageObject"
		                                          inManagedObjectContext:moc];
		
		NSSortDescriptor *sd1 = [[NSSortDescriptor alloc] initWithKey:@"sectionNum" ascending:YES];
		NSSortDescriptor *sd2 = [[NSSortDescriptor alloc] initWithKey:@"displayName" ascending:YES];
		
		NSArray *sortDescriptors = [NSArray arrayWithObjects:sd1, sd2, nil];
		
		NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
		[fetchRequest setEntity:entity];
		[fetchRequest setSortDescriptors:sortDescriptors];
		[fetchRequest setFetchBatchSize:100];
        
        NSString *currentJid = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyJID]];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"streamBareJidStr == %@ ",
                                  currentJid];
        [fetchRequest setPredicate:predicate];
		
		fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
		                                                               managedObjectContext:moc
		                                                                 sectionNameKeyPath:@"sectionNum"
		                                                                          cacheName:nil];
		[fetchedResultsController setDelegate:self];
		
		
		NSError *error = nil;
		if (![fetchedResultsController performFetch:&error])
		{
			DDLogError(@"Error performing fetch: %@", error);
		}
        
	}
	
	return fetchedResultsController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
	[_tableViewAddress reloadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _tableViewMore) {
        return 2;
    }
    else if (tableView == _tableViewAddress) {
        return [[[self fetchedResultsController] sections] count];
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView)
        return 80;
    else if (tableView == _tableViewAddress)
        return 80;
    else if (tableView == _tableViewFriend)
        return 180;
    else
        return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tableView)
        return 10;
    else if (tableView == _tableViewMore) {
        if (section == 0) {
            return 1;
        }
        else
            return 6;
    }
    else if (tableView == _tableViewAddress) {
        NSArray *sections = [[self fetchedResultsController] sections];
        
        if (section < [sections count])
        {
            id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
            return sectionInfo.numberOfObjects;
        }
        
        return 0;
    }
    else if (tableView == _tableViewFriend) {
        return 5;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)sender titleForHeaderInSection:(NSInteger)sectionIndex
{
    if (sender == _tableViewAddress)
    {
        NSArray *sections = [[self fetchedResultsController] sections];
        
        if (sectionIndex < [sections count])
        {
            id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:sectionIndex];
            
            int section = [sectionInfo.name intValue];
            switch (section)
            {
                case 0  : return @"在线";
                case 1  : return @"离开";
                default : return @"离线";
            }
        }
        
        return @"";
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSUInteger section = indexPath.section;
    
    if (tableView == _tableView) {
        NSString *Identifity=[NSString stringWithFormat:@"Identifity%d",row];
        
        XiaoXiCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifity];
        if(cell==nil){
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"XiaoXiCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            //        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
            //        cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
            //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.autoresizingMask=UIViewAutoresizingFlexibleHeight;
            if(_arrayData.count > 0) {
                NSDictionary *obj=[_arrayData objectAtIndex:row];
                [cell setCellContent:obj index:row];
            }
        }
        return cell;
    }
    else if (tableView == _tableViewMore) {
        NSString *CellIdentifier = [NSString stringWithFormat:@"More%d_%d", section,row];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (section == 0) {
                cell.textLabel.text = @"设置";
            }
            else {
                NSArray *t_arr = [NSArray arrayWithObjects:@"打招呼", @"附近的人", @"握手", @"碰碰聊", @"扫描二维码", @"应用中心", nil];
                cell.textLabel.text = [t_arr objectAtIndex:row];
            }
        }
        //config the cell
        return cell;
    }
    else if (tableView == _tableViewFriend) {
        NSString *CellIdentifier = [NSString stringWithFormat:@"Friend%d_%d", section,row];
        PengYouCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell==nil){
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"PengYouCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            //        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
            //        cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
            //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.autoresizingMask=UIViewAutoresizingFlexibleHeight;
            if(_arrayData.count > 0) {
                NSDictionary *obj=[_arrayData objectAtIndex:row];
                [cell setCellContent:obj index:row];
            }
        }
        //config the cell
        return cell;
    }
    else if (tableView == _tableViewFriend) {
        NSString *CellIdentifier = [NSString stringWithFormat:@"Friend%d_%d", section,row];
        PengYouCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell==nil){
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"PengYouCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            //        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
            //        cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
            //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.autoresizingMask=UIViewAutoresizingFlexibleHeight;
            if(_arrayData.count > 0) {
                NSDictionary *obj=[_arrayData objectAtIndex:row];
                [cell setCellContent:obj index:row];
            }
        }
        //config the cell
        return cell;
    }
    else if (tableView == _tableViewAddress) {
        NSString *CellIdentifier = [NSString stringWithFormat:@"Address%d_%d", section,row];
        UserCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell != nil) {
            [cell removeFromSuperview];
        }
        
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"UserCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        XMPPUserCoreDataStorageObject *user = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        
        cell._userName.text = user.displayName;
        //config the cell
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (tableView == _tableViewAddress)
    {//发起聊天
//        XMPPUserCoreDataStorageObject *user = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//        
//        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
//        [body setStringValue:@"temp"];
//        
//        XMPPMessage *mesa = [XMPPMessage messageWithType:@"chat" to:[user jid] elementID:[[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyJID]];
//        [mesa addChild:body];
//        
//        //发送消息
//        [[[self appDelegate] xmppStream] sendElement:mesa];
        
        
        XMPPUserCoreDataStorageObject *user = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        
        ChatViewController *vc = [[ChatViewController alloc] initWithNibName:@"ChatViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        [vc setTojid:[user jid]];
    }
}

@end

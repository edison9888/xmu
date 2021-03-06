//
//  FirstViewController.m
//  XMU
//
//  Created by lihj on 13-6-6.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "FirstViewController.h"
#import "EGOImageView.h"
#import "WelcomeVC.h"

#import "ClubCell.h"
#import "XMUAppDelegate.h"
#import "DDLog.h"
#import "FriendsBtn.h"


#if DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_INFO;
#endif


@interface FirstViewController ()
- (XMUAppDelegate *)appDelegate;
@end

@implementation FirstViewController
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
    
//    if (USERINFO.isLogin == YES) {
//        self.hidesBottomBarWhenPushed = YES;
//        
//        WelcomeVC *vc = [[WelcomeVC alloc] initWithNibName:@"WelcomeVC" bundle:nil];
//        self.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//        
//        return;
//    }
    self.title = @"推荐校友";
    [self setLBtn:nil image:@"顶部按钮-左边策划" imageSel:@"back_bg" target:self action:@selector(leftClick)];
    [self setRBtn:nil image:@"ico-右边更多" imageSel:@"back_bg" target:self action:@selector(rightClick)];
    
    _pageControl.numberOfPages = 4;
    [self addImage];
    [self addFridens];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    _scrollViewTop = nil;
    _pageControl = nil;
    _scrollViewBottom = nil;
    [super viewDidUnload];
}

- (void)leftClick {
    
}

- (void)rightClick {
    
}

- (void)addImage {
    for (int i=0; i<4; i++) {
        EGOImageView *banner = [[EGOImageView alloc] initWithFrame:CGRectMake(_scrollViewTop.frame.size.width * i, 0, _scrollViewTop.frame.size.width, _scrollViewTop.frame.size.height)];
        [banner setImageURL:[NSURL URLWithString:@"http://file2.desktx.com/pc/wallpaper/objects/20100802/lunchuan_desktx_1.jpg"]];
        [_scrollViewTop addSubview:banner];
    }
    [_scrollViewTop setContentSize:CGSizeMake(_scrollViewTop.frame.size.width * 4, _scrollViewTop.frame.size.height)];
}

- (void)addFridens {
    int t_X = 5;
    int t_Y = 0;
    for (int i=0; i<9; i++) {
        t_Y = i/3;
        FriendsBtn *friend = [[FriendsBtn alloc] initWithNibName:@"FriendsBtn" bundle:nil];
        [friend setImage:@"http://c.hiphotos.baidu.com/album/w%3D2048/sign=b95dbbdffd039245a1b5e60fb3aca5c2/5bafa40f4bfbfbedd1f77b6d79f0f736afc31f71.jpg"];
        [friend setNameTxt:@"罗伯特"];
        [friend setWorkTxt:@"腾讯CEO"];
        [friend.view SetFrameX:t_X*(i%3+1) + i%3*100];
        [friend.view SetFrameY:5*(t_Y+1) + t_Y*130];
        DLog(@"%d", 5*(t_Y+1) + t_Y*130);
        [_scrollViewBottom addSubview:friend.view];
    }
    [_scrollViewBottom SetFrameHeight:__MainScreen_Height - 120 - 44 - 49];
    [_scrollViewBottom setContentSize:CGSizeMake(_scrollViewBottom.frame.size.width, 135*3)];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)t_scrollView {
    if (t_scrollView == _scrollViewTop) {
        int currentPage = floor((t_scrollView.contentOffset.x - t_scrollView.frame.size.width / 2) /  t_scrollView.frame.size.width) + 1;
        _pageControl.currentPage = currentPage;
    }
    else {
        
    }

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
	[_tableView reloadData];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark UITableViewCell helpers
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)configurePhotoForCell:(UITableViewCell *)cell user:(XMPPUserCoreDataStorageObject *)user
{
	// Our xmppRosterStorage will cache photos as they arrive from the xmppvCardAvatarModule.
	// We only need to ask the avatar module for a photo, if the roster doesn't have it.
	
	if (user.photo != nil)
	{
		cell.imageView.image = user.photo;
	}
	else
	{
		NSData *photoData = [[[self appDelegate] xmppvCardAvatarModule] photoDataForJID:user.jid];
        
		if (photoData != nil)
			cell.imageView.image = [UIImage imageWithData:photoData];
		else
			cell.imageView.image = [UIImage imageNamed:@"defaultPerson"];
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark UITableView
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [[[self fetchedResultsController] sections] count];
}

- (NSString *)tableView:(UITableView *)sender titleForHeaderInSection:(NSInteger)sectionIndex
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
	NSArray *sections = [[self fetchedResultsController] sections];
	
	if (sectionIndex < [sections count])
	{
		id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:sectionIndex];
		return sectionInfo.numberOfObjects;
	}
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
	}
	
	XMPPUserCoreDataStorageObject *user = [[self fetchedResultsController] objectAtIndexPath:indexPath];
	
	cell.textLabel.text = user.displayName;
	[self configurePhotoForCell:cell user:user];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XMPPUserCoreDataStorageObject *user = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    
    //XMPPFramework主要是通过KissXML来生成XML文件
    //生成<body>文档
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:@"temp"];
    
    //    //生成XML消息文档
    //    NSXMLElement *mes = [NSXMLElement elementWithName:@"message"];
    //    //消息类型
    //    [mes addAttributeWithName:@"type" stringValue:@"chat"];
    //    //发送给谁
    //    [mes addAttributeWithName:@"to" stringValue:[[user jid] bare]];
    //    //由谁发送
    //    [mes addAttributeWithName:@"from" stringValue:[[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyJID]];
    //    //组合
    //    //[mes addChild:body];
    
    XMPPMessage *mesa = [XMPPMessage messageWithType:@"chat" to:[user jid] elementID:[[NSUserDefaults standardUserDefaults] stringForKey:kXMPPmyJID]];
    [mesa addChild:body];
    
    //发送消息
    [[[self appDelegate] xmppStream] sendElement:mesa];
}
@end

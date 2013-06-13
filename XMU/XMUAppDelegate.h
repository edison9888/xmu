//
//  XMUAppDelegate.h
//  XMU
//
//  Created by 林小果 on 13-6-2.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPFramework.h"


#define kXMPPmyJID @"kXMPPmyJID"
#define kXMPPmyPassword @"kXMPPmyPassword"

@class RosterController;
@class XMUViewController;
@class LeveyTabBarController;

@interface XMUAppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>
{
	XMPPStream *xmppStream;
	XMPPReconnect *xmppReconnect;
	XMPPRoster *xmppRoster;
	XMPPRosterCoreDataStorage *xmppRosterStorage;
    XMPPvCardCoreDataStorage *xmppvCardStorage;
	XMPPvCardTempModule *xmppvCardTempModule;
	XMPPvCardAvatarModule *xmppvCardAvatarModule;
	XMPPCapabilities *xmppCapabilities;
	XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;
    
    XMPPMessageArchivingCoreDataStorage *xmppMessageArchivingStorage;
    XMPPMessageArchiving *xmppMessageArchivingModule;
	XMPPPing *xmppPing;
	XMPPTime *xmppTime;
    
    NSMutableArray *turnSockets;
    
    NSString *password;
	
	BOOL allowSelfSignedCertificates;
	BOOL allowSSLHostNameMismatch;
	
	BOOL isXmppConnected;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) IBOutlet LeveyTabBarController *leveyTabBarController;
@property (strong, nonatomic) XMUViewController *viewController;

@property (nonatomic, strong, readonly) XMPPStream *xmppStream;
@property (nonatomic, strong, readonly) XMPPReconnect *xmppReconnect;
@property (nonatomic, strong, readonly) XMPPRoster *xmppRoster;
@property (nonatomic, strong, readonly) XMPPRosterCoreDataStorage *xmppRosterStorage;
@property (nonatomic, strong, readonly) XMPPvCardTempModule *xmppvCardTempModule;
@property (nonatomic, strong, readonly) XMPPvCardAvatarModule *xmppvCardAvatarModule;
@property (nonatomic, strong, readonly) XMPPCapabilities *xmppCapabilities;
@property (nonatomic, strong, readonly) XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;
@property (nonatomic, strong, readonly) XMPPMessageArchivingCoreDataStorage *xmppMessageArchivingStorage;
@property (nonatomic, strong, readonly) XMPPMessageArchiving *xmppMessageArchivingModule;
@property (nonatomic, strong, readonly) XMPPPing *xmppPing;


- (void)connectViaXEP65:(XMPPJID *)jid;

- (NSManagedObjectContext *)managedObjectContext_roster;
- (NSManagedObjectContext *)managedObjectContext_capabilities;
- (NSManagedObjectContext *)managedObjectContext_message;

- (BOOL)connect;
- (void)disconnect;

@end

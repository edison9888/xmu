//
//  UserInfoModel.m
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "UserInfoModel.h"
#import "SynthesizeSingleton.h"

@implementation UserInfoModel

SYNTHESIZE_SINGLETON_FOR_CLASS(UserInfoModel)

- (id)init {
    self = [super init];
	if (self) {
		NSUserDefaults *sud = [NSUserDefaults standardUserDefaults];

        _isLogin = [sud boolForKey:@"USER_isLogin"];
	}
	return self;
}

- (void)setIsLogin:(BOOL)isLogin {
    _isLogin = isLogin;
    
    NSUserDefaults *sud = [NSUserDefaults standardUserDefaults];
	[sud setBool:_isLogin forKey:@"USER_isLogin"];
}

@end

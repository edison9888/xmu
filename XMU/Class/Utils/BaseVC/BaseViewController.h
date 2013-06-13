//
//  baseViewController.h
//  tempPrj
//
//  Created by lihj on 13-4-9.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"
#import "MBProgressHUD.h"

@interface BaseViewController : BaseVC <MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
}

- (void)hudShow;
- (void)hudShowWithText:(NSString *)text;
- (void)refashSelfView:(UIView*)view;

@end

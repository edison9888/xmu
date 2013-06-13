//
//  BottomToolBar.h
//  XMU
//
//  Created by lihj on 13-6-9.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BottomBlock)(int select);

@interface BottomToolBar : UIViewController {
    int _index;
}

@property (copy)BottomBlock selectBlock;
@property (nonatomic, assign)int index;

- (IBAction)selectIndex:(id)sender;


@end

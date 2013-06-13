//
//  ViewFactory.h
//  
//
//  Created by linxg on 12-11-14.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


///=========================================================
//	注意：本控件工厂，主要负责控件的便利生成。
//	控件缺省frame = CGRectMake(0, 0, 100, 30)
//	控件缺省autorelease
///=========================================================

@interface ViewFactory : NSObject {

}

//生产label
+ (UILabel *) label:(NSString *)text;

//生产自动排版lable
+ (UILabel *) labelAuto:(NSString *)text width:(NSInteger)w;
+ (UILabel *) labelAuto:(NSString *)text width:(NSInteger)w fontSize:(NSInteger)fontSize;

//生产textView
+ (UITextView *) textView:(NSString *)text;

//生产button
+ (UIButton *) button:(NSString *)title imgNormal:(NSString *)imgNormal imgHightlight:(NSString *)imgHightlight imgSelected:(NSString *)imgSelected;

//生产imageView
+ (UIImageView *) imageView:(NSString *)imgName;

//生产textField
+ (UITextField *) textField:(id)delegate text:(NSString *)text placeHolder:(NSString *)placeHolder;

//生产tableView
+ (UITableView *) tableView:(id)delegate;

//生产scrollView
+ (UIScrollView *) scrollView:(id)delegate;

//生产segmengt
+ (UISegmentedControl *) segmentedControl:(id)target action:(SEL)action options:(NSArray *)options;

@end

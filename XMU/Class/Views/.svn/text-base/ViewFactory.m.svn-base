//
//  ViewFactory.m
//  
//
//  Created by linxg on 12-11-14.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewFactory.h"


@implementation ViewFactory

+ (UILabel *) label:(NSString *)text
{
	UILabel *t_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	[t_label setText:text];
	
	//透明背景色
	[t_label setBackgroundColor:[UIColor clearColor]];
	
	//文本水平居中
	//[t_label setTextAlignment:UITextAlignmentCenter];
	
	return [t_label autorelease];
}

+ (UILabel *) labelAuto:(NSString *)text width:(NSInteger)w
{	
	UIFont *font = [UIFont systemFontOfSize:14];
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(w, 10000.0f) lineBreakMode:  UILineBreakModeWordWrap];
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, size.width - 10, size.height + 10)];
	label.backgroundColor = [UIColor clearColor];
	label.font = font;
	label.numberOfLines = 0;
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.text = text;
	label.frame = CGRectMake(5.0f, 0.0f, size.width - 10, size.height + 10.0f);
	
	return [label autorelease];
}

+ (UILabel *) labelAuto:(NSString *)text width:(NSInteger)w fontSize:(NSInteger)fontSize
{
	UIFont *font = [UIFont systemFontOfSize:fontSize];
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(w, 10000.0f) lineBreakMode:  UILineBreakModeWordWrap];
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, size.width - 10, size.height + 10)];
	label.backgroundColor = [UIColor clearColor];
	label.font = font;
	label.numberOfLines = 0;
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.text = text;
	label.frame = CGRectMake(5.0f, 0.0f, size.width - 10, size.height + 10.0f);
	
	return [label autorelease];
}


+ (UITextView *) textView:(NSString *)text
{
	UITextView *tv = [[[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)] autorelease];
	[tv setBackgroundColor:[UIColor clearColor]];
	[tv setText:text];
	[tv setFont:[UIFont systemFontOfSize:16]];
	[tv setTextColor:[UIColor blackColor]];
	[tv setEditable:NO];
	[tv setShowsVerticalScrollIndicator:NO];
	
	return tv;
}

+ (UIButton *) button:(NSString *)title imgNormal:(NSString *)imgNormal imgHightlight:(NSString *)imgHightlight imgSelected:(NSString *)imgSelected
{
	UIButton *t_button = [UIButton buttonWithType:UIButtonTypeCustom];
	[t_button setFrame:CGRectMake(0, 0, 100, 30)];
	[t_button.titleLabel setFont:[UIFont systemFontOfSize:16]];
	
	//标题
	[t_button setTitle:title forState:UIControlStateNormal];
	
	//缺省图片
	[t_button setBackgroundImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
	
	//高亮图片
	[t_button setBackgroundImage:[UIImage imageNamed:imgHightlight] forState:UIControlStateHighlighted];
	
	//选中图片
	[t_button setBackgroundImage:[UIImage imageNamed:imgSelected] forState:UIControlStateSelected];
	
	//内容水平居中
	[t_button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
	
	//内容竖直居中
	[t_button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	
	return t_button;
}

+ (UIImageView *) imageView:(NSString *)imgName
{
	UIImageView *t_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	
	//设置背景图
	[t_imageView setImage:[UIImage imageNamed:imgName]];
	
	return [t_imageView autorelease];
}

+ (UITextField *) textField:(id)delegate text:(NSString *)text placeHolder:(NSString *)placeHolder;
{
	UITextField *t_textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	
	//观察者
	[t_textField setDelegate:delegate];
	
	//缺省文字
	[t_textField setText:text];
	
	//提示文字
	[t_textField setPlaceholder:placeHolder];
	
	return [t_textField autorelease];
}

+ (UITableView *) tableView:(id)delegate
{
	UITableView *t_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 300) style:UITableViewStylePlain];
	
	//确保delegate传参，否则可能异常
	t_tableView.dataSource = delegate;
	t_tableView.delegate = delegate;
	
	//透明背景色
	t_tableView.backgroundColor = [UIColor clearColor];
	
	//不显示分割线
	t_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	//自动排版
	t_tableView.autoresizesSubviews = YES;	
	
	//不显示水平滚动条
	t_tableView.showsHorizontalScrollIndicator = NO;
	
	//显示垂直滚动条
	t_tableView.showsVerticalScrollIndicator = YES;
	
	return [t_tableView autorelease];
}

+ (UIScrollView *) scrollView:(id)delegate
{
	CGRect frame = CGRectMake(10, 0, 300, 200);
	UIScrollView *t_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];

	//确保delegate传参，否则可能异常
	t_scrollView.delegate = delegate;
	
	//透明背景色
	t_scrollView.backgroundColor = [UIColor clearColor];
	
	//滚动内容大小，外部调整
	t_scrollView.contentSize = frame.size;
		
	//是否分页
	//t_scrollView.pagingEnabled = YES;
	t_scrollView.bounces = YES;
	
	//是否允许交互
	t_scrollView.userInteractionEnabled = YES;
	
	//不显示水平滚动条
	t_scrollView.showsHorizontalScrollIndicator = NO;
	
	//不显示垂直滚动条
	t_scrollView.showsVerticalScrollIndicator = NO;
	
	return [t_scrollView autorelease];
}

+ (UISegmentedControl *) segmentedControl:(id)target action:(SEL)action options:(NSArray *)options
{
	UISegmentedControl *t_segmentedControl = [[UISegmentedControl alloc] initWithItems:options];
	[t_segmentedControl setFrame:CGRectMake(0, 0, 100, 30)];
	
	//绑定点击事件
	[t_segmentedControl addTarget:target action:action forControlEvents:UIControlEventValueChanged];
	
	return [t_segmentedControl autorelease];
}

@end

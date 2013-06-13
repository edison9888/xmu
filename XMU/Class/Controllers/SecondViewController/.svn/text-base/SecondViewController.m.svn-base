//
//  SecondViewController.m
//  XMU
//
//  Created by lihj on 13-6-6.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "SecondViewController.h"
#import "ClubCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    [_tableView SetFrameHeight: __MainScreen_Height-49.0-44.0];
    self.title = @"班级";
    [self setLBtn:nil image:@"顶部按钮-左边策划" imageSel:@"back_bg" target:self action:@selector(leftClick)];
    [self setRBtn:nil image:@"ico-右边更多" imageSel:@"back_bg" target:self action:@selector(rightClick)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    _tableView = nil;
    [super viewDidUnload];
}

- (void)leftClick {
    
}

- (void)rightClick {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 108;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    
    NSString *Identifity=[NSString stringWithFormat:@"Identifity%d",row];
    
    ClubCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifity];
    if(cell==nil){
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ClubCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
        //        cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        cell.type = 1;
        if(_arrayData.count > 0) {
            NSDictionary *obj=[_arrayData objectAtIndex:row];
            [cell setCellContent:obj index:row];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

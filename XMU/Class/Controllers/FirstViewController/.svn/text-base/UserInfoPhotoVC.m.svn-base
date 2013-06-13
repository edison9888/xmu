//
//  UserInfoPhotoVC.m
//  XMU
//
//  Created by lihj on 13-6-7.
//  Copyright (c) 2013年 林小果. All rights reserved.
//

#import "UserInfoPhotoVC.h"
#import "MainViewController.h"

@interface UserInfoPhotoVC ()

@end

@implementation UserInfoPhotoVC

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
    [self setTitle:@"填写基本资料"];
    [self setLbtnNormal];
    [self setRBtn:nil image:@"next" imageSel:nil target:self action:@selector(nextClick)];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)nextClick {
    MainViewController *vc = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getPhotoClick:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:^(){
    }];
}

- (IBAction)takePhotoClick:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^(){
        }];
    }
    else {
        [shareFun showAlert:@"您的设备没有摄像头"];
    }
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
    UIImage * image=[info objectForKey:UIImagePickerControllerEditedImage];
    [self performSelector:@selector(selectPic:) withObject:image afterDelay:0.1];
}

- (void)selectPic:(UIImage*)image {
    [_userPhoto setImage:image];
}

-(void)imagePickerControllerDIdCancel:(UIImagePickerController*)picker {
    [picker presentViewController:picker animated:YES completion:^(){
    }];
}
@end

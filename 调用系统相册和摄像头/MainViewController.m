//
//  MainViewController.m
//  调用系统相册和摄像头
//
//  Created by 李自杨 on 17/2/13.
//  Copyright © 2017年 View. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Main";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createButton];
    
    
}

-(void)createButton{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((KWidth - 100) / 2, (KHeight - 100 - 64) / 2, 100, 100);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"上传头像" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake((KWidth - 100) / 2, (KHeight - 100 - 64) / 2 + 130, 100, 100)];
    [self.view addSubview:image];
    image.tag = 100;
    image.backgroundColor = [UIColor blackColor];
    
}

-(void)onClick{
    
    NSLog(@"调用系统相册");
    
    UIImagePickerController *pc = [[UIImagePickerController alloc]init];
    //    pc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;//相册的另一种视图形式
    //    pc.sourceType = UIImagePickerControllerSourceTypeCamera这时候是照相使用的，使用的时候先判断能不能使用相机，模拟机不能拍照，调用相册不会用到
    pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //是否允许被编辑
    pc.allowsEditing = YES;
    //代理
    pc.delegate = self;
    
    //是否需要动画
    [self presentViewController:pc animated:YES completion:^{
        
    }];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //把得到的相册传递为标记的imageView
    UIImageView *image = (UIImageView*)[self.view viewWithTag:100];
    
    image.image = info[UIImagePickerControllerEditedImage];
    //退出
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}





@end

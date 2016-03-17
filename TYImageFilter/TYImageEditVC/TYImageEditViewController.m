//
//  TYImageEditViewController.m
//  TYImageFilter
//
//  Created by TianYang on 16/3/17.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "TYImageEditViewController.h"
#import "ChooseFilterView.h"
#import "InstaFilters.h"
#import "UIImage+IF.h"


@interface TYImageEditViewController ()<IFVideoCameraDelegate>
{
    UIImageView * _EditImageView;

}
@property (nonatomic, strong) IFVideoCamera *videoCamera;
@property (nonatomic, unsafe_unretained) IFFilterType currentType;

@end



@implementation TYImageEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * SuperView = self.view;
    self.navigationItem.title = @"选择滤镜";
    
     _EditImageView = ({
        _EditImageView = [[UIImageView alloc] init];
        SuperView.backgroundColor = [UIColor lightGrayColor];
        _EditImageView.image = _EditImage;
        [SuperView addSubview:_EditImageView];
        [_EditImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top       . equalTo (SuperView.mas_top).offset(64);
            make.centerX   . equalTo (SuperView.mas_centerX);
            make.width     . equalTo (@(SCREEN_WIDTH));
            make.height    . equalTo (@(SCREEN_WIDTH));
        }];
        _EditImageView;
    });
    
    ChooseFilterView * _ChooseFV = ({
        _ChooseFV = [[ChooseFilterView alloc] init];
        [SuperView addSubview:_ChooseFV];
//        通过block 返回点击的是哪一个滤镜效果
        [_ChooseFV returnFilterid:^(NSString *Filterid) {
            self.currentType = [Filterid intValue];
            [self.videoCamera switchFilter:[Filterid intValue]];
            
        }];
        
        [_ChooseFV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left     . equalTo (SuperView.mas_left);
            make.top      . equalTo (_EditImageView.mas_bottom).offset(10);
            make.width    . equalTo (@(SCREEN_WIDTH));
            make.height   . equalTo (@(120));
        }];
        _ChooseFV;
    });
//    实时画布的渲染
    dispatch_async(dispatch_get_main_queue(), ^{
        self.videoCamera = [[IFVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPresetPhoto cameraPosition:AVCaptureDevicePositionBack highVideoQuality:NO];
        self.videoCamera.rawImage =self.EditImage;
        self.videoCamera.delegate = self;
    });
    
}
//两个代理
//视频
- (void)IFVideoCameraDidFinishCaptureStillImage:(IFVideoCamera *)videoCamera {
}

//图片的渲染结果
- (void) IFSwitchFilterFinishToImage:(UIImage *)images {
//    为滤镜添加转场效果 （渐变）
    [_EditImageView setImage:images];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.35;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"fade";
    transition.delegate = self;
    [_EditImageView.layer addAnimation:transition forKey:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

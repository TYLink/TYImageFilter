//
//  TYImageEditViewController.m
//  TYImageFilter
//
//  Created by TianYang on 16/3/17.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "TYImageEditViewController.h"
#import "ChooseFilterView.h"

@interface TYImageEditViewController ()

@end

@implementation TYImageEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * SuperView = self.view;
    self.navigationItem.title = @"选择滤镜";
    
    UIImageView * _EditImageView = ({
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
        [_ChooseFV returnFilterid:^(NSString *Filterid) {
            NSLog(@"你当前选择的是第%@个滤镜",Filterid);
        }];
        
        [_ChooseFV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left     . equalTo (SuperView.mas_left);
            make.top      . equalTo (_EditImageView.mas_bottom).offset(10);
            make.width    . equalTo (@(SCREEN_WIDTH));
            make.height   . equalTo (@(120));
        }];
        _ChooseFV;
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

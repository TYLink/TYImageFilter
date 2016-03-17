//
//  ViewController.m
//  TYImageFilter
//
//  Created by TianYang on 16/3/17.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "ViewController.h"
#import "TYImageEditViewController.h"
@interface ViewController (){
    UIImageView * _TYImageView;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"妹子";
     _TYImageView = ({
        _TYImageView = [[UIImageView alloc] init];
        [self.view addSubview:_TYImageView];
        [_TYImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX    . equalTo (self.view.mas_centerX);
            make.centerY    . equalTo (self.view.mas_centerY).offset(-30);
            make.width      . equalTo (@(SCREEN_WIDTH));
            make.height     . equalTo (@(SCREEN_WIDTH));
        }];
        _TYImageView.image = [UIImage imageNamed:@"RuanMeiZi"];
        _TYImageView;
    });
    
    UIButton * _NextBtn = ({
        _NextBtn = [[UIButton alloc] init];
        [_NextBtn setTitle:@"添加滤镜" forState:UIControlStateNormal];
        [SettingLabel SetBtnText:_NextBtn andTextSize:17.0 andColor:[UIColor grayColor] and:NO];
        _NextBtn.backgroundColor = [UIColor redColor];
        [_NextBtn addTarget:self action:@selector(NextClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_NextBtn];
        [_NextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX   . equalTo (self.view.mas_centerX);
            make.top       . equalTo (_TYImageView.mas_bottom).offset(30);
            make.width     . equalTo (@(SCREEN_WIDTH/2));
            make.height    . equalTo (@(40));
        }];
        _NextBtn;
    });
    

}

- (void) NextClick:(UIButton *) sender{
    NSLog(@"下一步对图片进行滤镜处理");
    
    TYImageEditViewController * _TYimageEditVC = [[TYImageEditViewController alloc] init];
    _TYimageEditVC.EditImage = _TYImageView.image;
   [self.navigationController pushViewController:_TYimageEditVC animated:YES];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

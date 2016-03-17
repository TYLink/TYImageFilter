//
//  ChooseFilterView.m
//  TYImageFilter
//
//  Created by TianYang on 16/3/17.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import "ChooseFilterView.h"


@interface ChooseFilterView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView * _FilterCollectionView;
    NSArray          * FilterNameArr;
}


@end

//
@implementation ChooseFilterView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self initView];
    }
    return self;
}

-(void) initView{
    self.backgroundColor = [UIColor lightGrayColor];
       FilterNameArr = [[NSArray alloc]initWithObjects:@"YuanTu",@"amaro",@"rise",@"hudson",@"xpro",@"Sierra",@"lomo",@"earlybird",@"sutro",@"toaster",@"brannan",@"inkwell",@"walden",@"hefe",@"Valencia",@"Nashville",@"1977",@"lordkelvin", nil];
    
    [self addcollectionView];

}

- (void)returnFilterid:(TYFilterEditBlock)block {
    self.returnFilteridBlock = block;
}

-(void) addcollectionView{

//    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _FilterCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 120) collectionViewLayout:flowLayout];
    _FilterCollectionView.dataSource=self;
    _FilterCollectionView.delegate=self;
    _FilterCollectionView.showsHorizontalScrollIndicator = NO;
    [_FilterCollectionView setBackgroundColor:[UIColor clearColor]];
    //注册Cell，必须要有
    [_FilterCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self addSubview:_FilterCollectionView];

}

# pragma mark   UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [FilterNameArr count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    UIImageView * FilterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 95, 95)];
    FilterImageView.image = [UIImage imageNamed:[FilterNameArr objectAtIndex:indexPath.row]];

    UILabel * TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 95, 20)];
    [TitleLabel setTextAlignment:NSTextAlignmentCenter];
    [SettingLabel setLabel:TitleLabel andSize:17.0 andColor:[UIColor blackColor] andIsBold:NO];
    TitleLabel.text = [FilterNameArr objectAtIndex:indexPath.row];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:TitleLabel];
    [cell.contentView addSubview:FilterImageView];
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(95, 120);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;

}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.returnFilteridBlock != nil) {
        self.returnFilteridBlock ([NSString stringWithFormat:@"%ld",indexPath.row]);
    }
}

//返回这个UICollectionView是否可以被选择
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}


@end

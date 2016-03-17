//
//  ChooseFilterView.h
//  TYImageFilter
//
//  Created by TianYang on 16/3/17.
//  Copyright © 2016年 Tianyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseFilterView : UIView



typedef void (^TYFilterEditBlock)(NSString * Filterid);

@property (nonatomic, copy) TYFilterEditBlock returnFilteridBlock;

- (void)returnFilterid:(TYFilterEditBlock)block;


@end

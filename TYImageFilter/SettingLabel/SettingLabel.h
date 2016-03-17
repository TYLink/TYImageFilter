//
//  SettingLabel.h
//  FunApplication
//
//  Created by TianYang on 15/7/14.
//  Copyright (c) 2015年 Fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SettingLabel : NSObject

//设置Label的基本属性 （定义字体的）
+(void)setLabel:(UILabel *)label andSize:(float)size andColor:(UIColor*)labelColor andIsBold:(BOOL)isBold;


+(void)SetBtnText:(UIButton*)Btn andTextSize:(float)Size andColor:(UIColor*)TextColor and:(BOOL)isBold;


@end

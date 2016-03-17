//
//  SettingLabel.m
//  FunApplication
//
//  Created by TianYang on 15/7/14.
//  Copyright (c) 2015年 Fun. All rights reserved.
//

#import "SettingLabel.h"

@implementation SettingLabel


+(void)setLabel:(UILabel *)label andSize:(float)size andColor:(UIColor*)labelColor andIsBold:(BOOL)isBold
{
    if (isBold) {
        label.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:size];
    } else{
        label.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:size];
    }
    
    label.textColor = labelColor;
    label.backgroundColor = [UIColor clearColor];
}

+(void)SetBtnText:(UIButton*)Btn andTextSize:(float)Size andColor:(UIColor*)TextColor and:(BOOL)isBold
{
    if (isBold) {
        Btn.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:Size];
    } else{
        Btn.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:Size];
    }
    [Btn setTitleColor:TextColor forState:UIControlStateNormal];
    
}



/**
 "AvenirNextCondensed-HeavyItalic",
 "AvenirNextCondensed-DemiBold",
 "AvenirNextCondensed-Italic",
 "AvenirNextCondensed-Heavy",
 "AvenirNextCondensed-DemiBoldItalic",
 "AvenirNextCondensed-Medium",
 "AvenirNextCondensed-BoldItalic",
 "AvenirNextCondensed-Bold",
 "AvenirNextCondensed-UltraLightItalic",
 "AvenirNextCondensed-UltraLight",
 "AvenirNextCondensed-MediumItalic",
 "AvenirNextCondensed-Regular"
 
 */
/**
 NSArray * fontArray = [[NSArray alloc]initWithObjects:
 @"AvenirNextCondensed-HeavyItalic",
 @"AvenirNextCondensed-DemiBold",
 @"AvenirNextCondensed-Italic",
 @"AvenirNextCondensed-Heavy",
 @"AvenirNextCondensed-DemiBoldItalic",
 @"AvenirNextCondensed-Medium",
 @"AvenirNextCondensed-BoldItalic",
 @"AvenirNextCondensed-Bold",
 @"AvenirNextCondensed-UltraLightItalic",
 @"AvenirNextCondensed-UltraLight",
 @"AvenirNextCondensed-MediumItalic",
 @"AvenirNextCondensed-Regular", nil];
 
 for (int i = 0; i<12; i ++) {
 UILabel * label = [[UILabel alloc]init];
 label.text = [fontArray objectAtIndex:i];
 label.font = [UIFont fontWithName:[fontArray objectAtIndex:i] size:15];
 [self.view addSubview:label];
 [label mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.equalTo (self.view.mas_left);
 make.top.equalTo (self.view.mas_top).offset(30*i);
 make.width.equalTo (@(SCREEN_WIDTH));
 make.height. equalTo (@(SCREEN_HEIGHT/12));
 
 }];
 
 }
 
 */

@end

//
//  MCColorPickerLayer.h
//  MCColorPicker
//
//  Created by Vinícius Rodrigues on 30/01/2014.
//  Copyright (c) 2014 MyAppControls. All rights reserved.
//

#import <MCCore/MCCore.h>

@interface MCColorPickerLayer : MCNewCustomLayer

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *selectedBorderColor;

@end

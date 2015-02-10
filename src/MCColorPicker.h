//
//  MCColorPicker.h
//  MCColorPicker
//
//  Created by Vinícius Rodrigues on 30/01/2014.
//  Copyright (c) 2014 MyAppControls. All rights reserved.
//

#import <MCCore/MCCore.h>

@class MCColorPicker;

@protocol MCColorPickerDelegate <NSObject>

@optional

/*
 Callback method fired after the selection of a color
 */
- (void)colorPicker:(MCColorPicker*)colorPicker didSelectColor:(UIColor*)color;

@end

@interface MCColorPicker : MCNewCustomLayeredView

/*
 Array that must contain the colors that will be displayed on the control
 */
@property (nonatomic, strong) NSMutableArray *colors;

/*
 The current selected color. Starts nil
 */
@property (nonatomic, strong, readonly) UIColor *currentColor;

/*
 The current selected color. Starts nil
 */
@property (nonatomic, assign) id<MCColorPickerDelegate>delegate;

@end

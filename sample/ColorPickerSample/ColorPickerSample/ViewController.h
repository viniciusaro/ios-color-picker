//
//  ViewController.h
//  ColorPickerSample
//
//  Created by Vinícius Rodrigues on 28/05/2014.
//  Copyright (c) 2014 MyAppControls. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MCColorPicker.h"

@interface ViewController : UIViewController <MCColorPickerDelegate>

@property (weak, nonatomic) IBOutlet MCColorPicker *colorPicker;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

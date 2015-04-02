//
//  ViewController.m
//  ColorPickerSample
//
//  Created by Vinícius Rodrigues on 28/05/2014.
//  Copyright (c) 2014 MyAppControls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colorPicker.colors = [[NSMutableArray alloc] initWithObjects:
                               [UIColor redColor],
                               [UIColor yellowColor],
                               [UIColor greenColor],
                               [UIColor blueColor],
                               [UIColor grayColor],
                               nil];

    
    // uncomment to use se the usage of images
    /*
    self.colorPicker.images = [[NSMutableArray alloc] initWithObjects:
                               [UIImage imageNamed:@"square"],
                               [UIImage imageNamed:@"square"],
                               [NSNull null],
                               [UIImage imageNamed:@"square"],
                               [UIImage imageNamed:@"square"],
                               nil];
    //*/
    
    self.colorPicker.delegate = self;
    [self.colorPicker selectItemAtIndex:2];
}

- (void)colorPicker:(MCColorPicker *)colorPicker didSelectColor:(UIColor *)color
{
    self.label.textColor = color;
}

@end

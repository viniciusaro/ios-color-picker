//
//  MCColorPickerLayer.m
//  MCColorPicker
//
//  Created by Vinícius Rodrigues on 30/01/2014.
//  Copyright (c) 2014 MyAppControls. All rights reserved.
//

#import "MCColorPickerLayer.h"

@implementation MCColorPickerLayer

@dynamic x;

- (id)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    
    if (self) {
        MCColorPickerLayer *other = (MCColorPickerLayer*)layer;
        self.x      = other.x;
        self.y      = other.y;
        self.width  = other.width;
        self.height = other.height;
        self.color  = other.color;
    }
    
    return self;
}

+ (NSArray*)animatableKeys {
    return [[NSArray alloc] initWithObjects:@"x", nil];
}

- (void)setDefaults
{
    [super setDefaults];
    
    self.selectedBorderColor = [UIColor yellowColor];
}

- (void)customDrawInContext:(CGContextRef)context
{
    [super customDrawInContext:context];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    CGFloat smallestDimension = MIN(self.width, self.height);
    
    CGFloat borderPercentage = 0.06;
    CGFloat borderSize = smallestDimension*borderPercentage;
    
    CGPoint center = CGPointMake(self.x + self.width/2, self.y + self.height/2);
    
    CGPathAddArc(self.mainPath, &transform, center.x, center.y, (smallestDimension/2)-borderSize*3, DEG2RAD(0), DEG2RAD(D_360), 0);
    
    if (self.selectionStatus == MCNewCustomLayerSelectionStatusNotSelected) {
        CGContextSetLineWidth(context, 1);
        CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    }
    else {
        CGContextSetLineWidth(context, borderSize);
        CGContextSetStrokeColorWithColor(context, [self.color colorWithAlphaComponent:0.7].CGColor);
        
        CGContextAddArc(context, center.x, center.y, (smallestDimension/2)-borderSize, DEG2RAD(0), DEG2RAD(D_360), 0);
        CGContextDrawPath(context, kCGPathStroke);
    }
    
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    
    CGContextAddPath(context, self.mainPath);
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)setSelectionStatus:(MCNewCustomLayerSelectionStatus)selectionStatus {
    [super setSelectionStatus:selectionStatus];
    
    switch (selectionStatus) {
        case MCNewCustomLayerSelectionStatusSelected:
            self.zPosition = 1;
            break;
        case MCNewCustomLayerSelectionStatusNotSelected:
            self.zPosition = 0;
            break;
    }
    
    [self setNeedsDisplay];
}

@end

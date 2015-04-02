//
//  MCColorPicker.m
//  MCColorPicker
//
//  Created by Vinícius Rodrigues on 30/01/2014.
//  Copyright (c) 2014 MyAppControls. All rights reserved.
//

#import "MCColorPicker.h"
#import "MCColorPickerLayer.h"
#import "MCNewCustomLayeredView+MCCustomLayeredViewSubclass.h"

@implementation MCColorPicker {
    CGFloat pickerWidth;
    CGFloat interPickerSpace;
    CGFloat x;
}

- (void)setDefaults
{
    [super setDefaults];
    
    self.colors = [[NSMutableArray alloc] init];
    
    interPickerSpace = 0;
    x = 0;
}

- (NSInteger)dataSourceNumberOfItemsInView:(MCNewCustomLayeredView *)view {
    return self.colors.count;
}

- (Class)classForSublayers {
    return [MCColorPickerLayer class];
}

- (void)willDrawSublayers
{
    [super willDrawSublayers];
    
    NSInteger numberOfPickers = self.colors.count;
    
    pickerWidth = (self.frame.size.width-interPickerSpace*numberOfPickers)/numberOfPickers;
}

- (MCNewCustomLayer*)itemForIndex:(NSInteger)index withReuseItem:(MCNewCustomLayer *)reuseItem
{
    MCColorPickerLayer *picker = (MCColorPickerLayer*)[super itemForIndex:index withReuseItem:reuseItem];
    
    picker.width    = pickerWidth;
    picker.height   = self.frame.size.height;
    picker.y        = 0;
    picker.x        = x;
    picker.color    = [self.colors objectAtIndex:index];
    
    if (self.images && index < self.images.count)
    {
        if ([self.images objectAtIndex:index] != [NSNull null])
        {
            picker.mainPathImage = [self.images objectAtIndex:index];
        }
    }
    
    picker.imageBoundsStyle = MCNewCustomLayerImageBoundsItemRect;
    
    x += pickerWidth+interPickerSpace;
    
    return picker;
}

- (void)didDrawSublayers
{
    [super didDrawSublayers];
    x = 0;
}

- (void)customLayeredView:(MCNewCustomLayeredView *)customLayeredView didTouchMainPathOnLayer:(MCNewCustomLayer *)layer
{
    NSInteger index = [customLayeredView.containerLayer.sublayers indexOfObject:layer];
    [self selectItemAtIndex:index];
    
    _currentColor = [self.colors objectAtIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(colorPicker:didSelectColor:)])
    {
        [self.delegate colorPicker:self didSelectColor:[self.colors objectAtIndex:index]];
    }
}

- (void)selectItemAtIndex:(NSUInteger)index
{
    [super selectItemAtIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(colorPicker:didSelectColor:)])
    {
        [self.delegate colorPicker:self didSelectColor:[self.colors objectAtIndex:index]];
    }
}

@end

# iOS Simple Color Picker
The iOS Color Picker is a simple tool to that shows a list of colors and allows the users to select one of them, sending the feedback to your application. The default appearance has a beautiful flat design, It has built in animation features for presenting actions. 

Demo video: https://www.youtube.com/watch?v=J_ftiilogLs

More info at: http://myappcontrols.binpress.com/product/ios-color-picker/2066

![alt tag](http://myappcontrols.binpress.com/images/stores/store30934/color-picker.png)

## Installation

Add all files from the src folder to your project
Import as usual: #import "MCColorPicker.h"
Add QuartzCore.framework to your project

## Setup

MCColorPicker can be added to your view either from the Interface Builder or through code.

### Interface Builder (Xcode 5):

* Open the Storyboard or Xib file you want to add the pie chart to.
* Drag a new UIView from the Object Library into your view controller.
* Resize and position your new UIView as you wish (the pie chart will be drawn on the center of the new UIView).
* Make sure the new UIView is selected and choose the Identity Inspector tab on Xcode's the Utilities view (on the right).
* Change the class from UIView to MCColorPicker.
* On the view controller's header file create an IBOutlet property of the type MCColorPicker and link it to the object you created on the Interface Builder.

### Through Code:
```
CGRect frame = CGRectMake(x, y, width, height);
MCColorPicker *colorPicker = [[MCColorPicker alloc] initWithFrame:frame];
[self.view addSubview:colorPicker];
```

## Example Usage
```
self.colorPicker.colors = [[NSMutableArray alloc] initWithObjects:
                               [UIColor redColor],
                               [UIColor yellowColor],
                               [UIColor greenColor],
                               [UIColor blueColor],
                               [UIColor grayColor],
                               nil];

self.colorPicker.delegate = self;
```

## Documentation

Most of the properties are mnemonic and pretty straightforward to be used. Custom types can be easily explored on the interface files provided. 

**Properties**    

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

    /*
     Causes the control to redraw it self, calling all the data source methods
     to apply the new data.
     */
    - (void)reloadData;
    
    /*
     Animates the control
     */
    - (void)animate;

**Delegate (optional)**

    @protocol MCColorPickerDelegate <NSObject>
    
    @optional
    
    /*
     Callback method fired after the selection of a color
     */
    - (void)colorPicker:(MCColorPicker*)colorPicker didSelectColor:(UIColor*)color;
    
    @end

## Credits
Brought to you by [MyAppControls](http://www.binpress.com/profile/myappcontrols/30934) team.

## Similar Projects

[iOS Bar Chart](https://github.com/vinicius-a-ro/ios-bar-chart-view)

[iOS Circular Progress Bar](https://github.com/vinicius-a-ro/ios-circular-progress-bar)

[iOS Pie Chart](https://github.com/vinicius-a-ro/ios-pie-chart-view)

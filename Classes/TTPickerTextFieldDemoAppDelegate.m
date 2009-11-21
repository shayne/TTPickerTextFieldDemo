#import "TTPickerTextFieldDemoAppDelegate.h"
#import "PickerController.h"

@implementation TTPickerTextFieldDemoAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    TTNavigator *navigator = [TTNavigator navigator];
    
    TTURLMap *map = navigator.URLMap;
    
    [map from:@"tt://test" toViewController:[PickerController class]];
    
    [navigator openURL:@"tt://test" animated:NO];
}


- (void)dealloc {
    [super dealloc];
}


@end

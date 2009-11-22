#import "TTPickerTextFieldDemoAppDelegate.h"
#import "PickerController.h"

@implementation TTPickerTextFieldDemoAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    TTNavigator *navigator = [TTNavigator navigator];
    
    TTURLMap *map = navigator.URLMap;
    
    [map from:@"tt://picker" toViewController:[PickerController class]];
    
    [navigator openURL:@"tt://picker" animated:NO];
}


- (void)dealloc {
    [super dealloc];
}


@end

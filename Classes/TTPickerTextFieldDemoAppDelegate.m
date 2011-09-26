#import "TTPickerTextFieldDemoAppDelegate.h"
#import "PickerController.h"

@implementation TTPickerTextFieldDemoAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    TTNavigator *navigator = [TTNavigator navigator];
    
    TTURLMap *map = navigator.URLMap;
    
    [map from:@"tt://picker" toViewController:[PickerController class]];
    
    [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://picker"]];
}


- (void)dealloc {
    [super dealloc];
}


@end

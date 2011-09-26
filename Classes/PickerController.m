#import "PickerController.h"
#import "PickerDataSource.h"

@implementation PickerController

- (id)init {
    if (self = [super init]) {
        self.title = @"State Picker";
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = TTSTYLEVAR(backgroundColor);
    
    UIScrollView *scrollView = [[[UIScrollView alloc] initWithFrame:TTNavigationFrame()] autorelease];
    scrollView.backgroundColor = TTSTYLEVAR(backgroundColor);
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    scrollView.canCancelContentTouches = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    TTPickerTextField *textField = [[[TTPickerTextField alloc] init] autorelease];
    textField.dataSource = [[[PickerDataSource alloc] init] autorelease];;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.rightViewMode = UITextFieldViewModeAlways;
    textField.delegate = self;
    textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [textField sizeToFit];
    
    UILabel *label = [[[UILabel alloc] init] autorelease];
    label.text = @"States:";
    label.font = TTSTYLEVAR(messageFont);
    label.textColor = TTSTYLEVAR(messageFieldTextColor);
    [label sizeToFit];
    label.frame = CGRectInset(label.frame, -2, 0);
    textField.leftView = label;
    textField.leftViewMode = UITextFieldViewModeAlways;
    [textField becomeFirstResponder];
    
    [scrollView addSubview:textField];
    
    CGFloat y = 0;
    
    for (UIView *view in scrollView.subviews) {
        view.frame = CGRectMake(0, y, self.view.frame.size.width, view.frame.size.height);
        y += view.frame.size.height;
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, y);
}

@end

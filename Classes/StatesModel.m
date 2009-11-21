#import "StatesModel.h"

@implementation StatesModel

@synthesize names = _names;

+ (NSMutableArray *)theNames {
    return [NSMutableArray arrayWithObjects:
            @"Alabama",
            @"Alaska",
            @"American Samoa",
            @"Arizona",
            @"Arkansas",
            @"California",
            @"Colorado",
            @"Connecticut",
            @"Delaware",
            @"District of Columbia",
            @"Federated States of Micronesia",
            @"Florida",
            @"Georgia",
            @"Guam",
            @"Hawaii",
            @"Idaho",
            @"Illinois",
            @"Indiana",
            @"Iowa",
            @"Kansas",
            @"Kentucky",
            @"Louisiana",
            @"Maine",
            @"Marshall Islands",
            @"Maryland",
            @"Massachusetts",
            @"Michigan",
            @"Minnesota",
            @"Mississippi",
            @"Missouri",
            @"Montana",
            @"Nebraska",
            @"Nevada",
            @"New Hampshire",
            @"New Jersey",
            @"New Mexico",
            @"New York",
            @"North Carolina",
            @"North Dakota",
            @"Northern Mariana Islands",
            @"Ohio",
            @"Oklahoma",
            @"Oregon",
            @"Palau",
            @"Pennsylvania",
            @"Puerto Rico",
            @"Rhode Island",
            @"South Carolina",
            @"South Dakota",
            @"Tennessee",
            @"Texas",
            @"Utah",
            @"Vermont",
            @"Virgin Islands",
            @"Virginia",
            @"Washington",
            @"West Virginia",
            @"Wisconsin",
            @"Wyoming",          
            nil];
}

- (id)initWithNames:(NSArray *)names {
    if (self = [super init]) {
        _delegates = nil;
        _allNames = [names copy];
        _names = nil;
    }
    return self;
}

- (void)dealloc {
    TT_RELEASE_SAFELY(_delegates);
    TT_RELEASE_SAFELY(_allNames);
    TT_RELEASE_SAFELY(_names);
    [super dealloc];
}


- (void)loadNames {
    TT_RELEASE_SAFELY(_names);
    _names = [_allNames mutableCopy];
}

- (void)search:(NSString*)text {
    [self cancel];
    
    self.names = [NSMutableArray array];
    
    [_delegates perform:@selector(modelDidStartLoad:) withObject:self];
    
    if (text.length) {
        text = [text lowercaseString];
        for (NSString *state in _allNames) {
            if ([[state lowercaseString] rangeOfString:text].location == 0) {
                [_names addObject:state];
            }
        }    
    }
    
    [_delegates perform:@selector(modelDidFinishLoad:) withObject:self];
}

#pragma mark -
#pragma mark TTModel methods

- (NSMutableArray*)delegates {
    if (!_delegates) {
        _delegates = TTCreateNonRetainingArray();
    }
    return _delegates;
}

- (BOOL)isLoadingMore {
    return NO;
}

- (BOOL)isOutdated {
    return NO;
}

- (BOOL)isLoaded {
    return !!_names;
}

- (BOOL)isLoading {
    return NO;
}

- (BOOL)isEmpty {
    return !_names.count;
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
}

- (void)invalidate:(BOOL)erase {
}

- (void)cancel {
}

@end

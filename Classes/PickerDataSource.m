#import "PickerDataSource.h"
#import "StatesModel.h"

@implementation PickerDataSource

- (id)init {
    if (self = [super init]) {
        _states = [[StatesModel alloc] initWithNames:[StatesModel theNames]];
        [_states loadNames];
        self.model = _states;
    }
    return self;
}

- (void)dealloc {
    TT_RELEASE_SAFELY(_states);
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSArray *)sectionIndexTitlesForTableView:(UITableView*)tableView {
    return [TTTableViewDataSource lettersForSectionsWithSearch:YES summary:NO];
}

#pragma mark -
#pragma mark TTTableViewDataSource methods

- (void)tableViewDidLoadModel:(UITableView*)tableView {
    self.items = [NSMutableArray array];
    self.sections = [NSMutableArray array];
    
    NSMutableDictionary *groups = [NSMutableDictionary dictionary];
    for (NSString *name in _states.names) {
        NSString *letter = [NSString stringWithFormat:@"%c", [name characterAtIndex:0]];
        NSMutableArray *section = [groups objectForKey:letter];
        if (!section) {
            section = [NSMutableArray array];
            [groups setObject:section forKey:letter];
        }
        
        TTTableItem *item = [TTTableTextItem itemWithText:name URL:nil];
        [section addObject:item];
    }
    
    NSArray *letters = [groups.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    for (NSString *letter in letters) {
        NSArray *items = [groups objectForKey:letter];
        [_sections addObject:letter];
        [_items addObject:items];
    }
}

- (void)search:(NSString*)text {
    [_states search:text];
}

@end

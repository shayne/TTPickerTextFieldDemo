#import "Three20/Three20.h"

@interface StatesModel: NSObject <TTModel> {
    NSMutableArray *_delegates;
    NSMutableArray *_names;
    NSMutableArray *_allNames;
}

@property (nonatomic, retain) NSMutableArray *names;

+ (NSMutableArray *)theNames;
- (id)initWithNames:(NSArray *)names;
- (void)loadNames;
- (void)search:(NSString *)text;

@end

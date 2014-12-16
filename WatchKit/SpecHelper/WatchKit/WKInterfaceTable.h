#import "WKInterfaceObject.h"


@interface WKInterfaceTable : WKInterfaceObject

- (void)setRowTypes:(NSArray *)rowTypes;
- (void)setNumberOfRows:(NSInteger)numberOfRows withRowType:(NSString *)rowType;

- (void)insertRowsAtIndexes:(NSIndexSet *)rows withRowType:(NSString *)rowType;
- (void)removeRowsAtIndexes:(NSIndexSet *)rows;

- (void)scrollToRowAtIndex:(NSInteger)index;

@end

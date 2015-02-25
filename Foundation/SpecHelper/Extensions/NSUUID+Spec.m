#import "NSUUID+Spec.h"
#import "PCKMethodRedirector.h"

@interface NSUUID (Spec_Private)
+(NSUUID *)UUIDWithoutLogging;
+(NSUUID *)UUIDWithLogging;
@end

static NSMutableArray *uuids;
@implementation NSUUID (Spec)
+(NSArray *)generatedUUIDs {
    return uuids;
}

+(void)beforeEach {
    [self reset];
}

+(void)load {
    [PCKMethodRedirector redirectClassSelector:@selector(UUID)
                                      forClass:self
                                            to:@selector(UUIDWithLogging)
                                 andRenameItTo:@selector(UUIDWithoutLogging)];

    uuids = [[NSMutableArray alloc] init];
}

+(NSUUID *)UUIDWithLogging {
    NSUUID *uuid = [self UUIDWithoutLogging];
    [uuids addObject:uuid];

    return uuid;
}

+(void)reset {
    uuids = [[NSMutableArray alloc] init];
}

@end

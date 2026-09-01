#import <Foundation/Foundation.h>

@interface DemoRouteMatcher : NSObject
- (NSUInteger)scorePath:(NSString *)path;
@end
@implementation DemoRouteMatcher
- (NSUInteger)scorePath:(NSString *)path { return path.length * 17u; }
@end

static double MeasureCalls(DemoRouteMatcher *matcher, NSString *path, NSUInteger count, NSUInteger *checksum) {
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    NSUInteger sum = 0;
    for (NSUInteger i = 0; i < count; i++) sum += [matcher scorePath:path];
    *checksum = sum;
    return (CFAbsoluteTimeGetCurrent() - start) * 1000.0;
}

int main(void) {
    @autoreleasepool {
        DemoRouteMatcher *matcher = [DemoRouteMatcher new];
        NSString *path = @"/catalog/items";
        NSUInteger first = 0, repeated = 0;
        double firstMs = MeasureCalls(matcher, path, 1, &first);
        double repeatedMs = MeasureCalls(matcher, path, 1000000, &repeated);
        BOOL valid = first == path.length * 17u && repeated == first * 1000000u;
        NSLog(@"First observed dispatch: %.6f ms", firstMs);
        NSLog(@"1,000,000 repeated dispatches: %.3f ms", repeatedMs);
        NSLog(@"Checksum verification: %@", valid ? @"PASS" : @"FAIL");
        NSLog(@"Interpretation: observational benchmark; not a direct cache-hit counter.");
        return valid ? 0 : 1;
    }
}

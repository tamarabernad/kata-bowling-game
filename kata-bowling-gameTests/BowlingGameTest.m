#import "BowlingGameTest.h"
#import "MBXGame.h"

@interface BowlingGameTest(){
    MBXGame *game;
}

@end
@implementation BowlingGameTest
- (void)setUp
{
    [super setUp];
    game = [[MBXGame alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}
- (void)rollNumberOfBalls:(NSInteger)n WithPins:(NSInteger)pins{
    for (int i=0; i<n; i++) {
        [game roll:[NSNumber numberWithInt:pins]];
    }
}
- (void)rollStrike{
    [game roll:[NSNumber numberWithInt:10]];
}
- (void)rollSpare{
    [game roll:[NSNumber numberWithInt:5]];
    [game roll:[NSNumber numberWithInt:5]];
}



- (void) testGutterGame{
    [self rollNumberOfBalls:20 WithPins:0];
    assert([game score] == 0);
}
- (void) testAllOnes{
    [self rollNumberOfBalls:20 WithPins:1];
    assert([game score] == 20);
}
- (void)testOneSpare{
    [self rollSpare];
    [game roll:[NSNumber numberWithInt:3]];
    [self rollNumberOfBalls:17 WithPins:0];
    assert([game score] == 16);
}
- (void)testOneStrike{
    [self rollStrike];
    [game roll:[NSNumber numberWithInt:3]];
    [game roll:[NSNumber numberWithInt:4]];
    [self rollNumberOfBalls:16 WithPins:0];
    assert([game score] == 24);
}
- (void)testPerfectGame{
    [self rollNumberOfBalls:12 WithPins:10];
    assert([game score] == 300);
}

@end

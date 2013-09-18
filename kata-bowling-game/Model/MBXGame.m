#import "MBXGame.h"


@interface MBXGame(){
    NSMutableArray *rolls;
    NSInteger currentRoll;
}
@end

@implementation MBXGame
- (id)init
{
    if (self = [super init]) {
        rolls = [NSMutableArray arrayWithCapacity:21];
        currentRoll = 0;
    }
    return self;
}
-(void) roll:(NSNumber *)pins{
    [rolls setObject:pins atIndexedSubscript:currentRoll++];
}
- (NSInteger)score{
    int score =0;
    int frameIndex=0;
    for (int frame =0; frame < 10; frame++) {
        
        if ([self isStrikeFrame:frameIndex]) {//strike
            score += 10 + [self strikeBonus:frameIndex];
            frameIndex ++;
        }else if ([self isSpareFrame:frameIndex]) {
            score += 10 + [self spareBonus:frameIndex];
            frameIndex+=2;
        }else{
            score += [self sumOfBallsInFrame:frameIndex];
            frameIndex+=2;
        }
    }
    return score;
}
- (NSInteger) sumOfBallsInFrame:(NSInteger)frameIndex{
    return [[rolls objectAtIndex:frameIndex] intValue] + [[rolls objectAtIndex:frameIndex+1] intValue];
}
- (NSInteger) spareBonus:(NSInteger)frameIndex{
    return [[rolls objectAtIndex:frameIndex+2] intValue];
}
- (NSInteger) strikeBonus:(NSInteger)frameIndex{
    return [[rolls objectAtIndex:frameIndex+1] intValue] + [[rolls objectAtIndex:frameIndex+2] intValue];
}
- (BOOL)isStrikeFrame:(NSInteger)frameIndex{
    return [[rolls objectAtIndex:frameIndex] intValue] == 10;
}
- (BOOL)isSpareFrame:(NSInteger)frameIndex{
    return [[rolls objectAtIndex:frameIndex] intValue] + [[rolls objectAtIndex:frameIndex+1] intValue] == 10;
}

@end

//
//  CustomLayer.m
//  Leaves
//
//  Created by sergio on 6/4/12.
//  Copyright 2012 Tom Brow. All rights reserved.
//

#import "CustomLayer.h"


/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
@implementation CustomLayer

/////////////////////////////////////////////////////////////////////////
+ (NSArray*)actionInSequence {
    
    static short subcounter = 0;
    static short counter = 0;
    
    NSMutableArray* res = [NSMutableArray array];
    
    short mod = counter % 4;
    short submod = subcounter % 4;
    
    if (mod == 0) {
        [res addObject:kCATransitionFade];
    } else if (mod == 1) {
        [res addObject:kCATransitionMoveIn];
    } else if (mod == 2) {
        [res addObject:kCATransitionPush];
    } else if (mod == 3) {
        [res addObject:kCATransitionReveal];
    }
    
    if (submod == 0) {
        [res addObject:kCATransitionFromRight];
    } else if (submod == 1) {
        [res addObject:kCATransitionFromLeft];
    } else if (submod == 2) {
        [res addObject:kCATransitionFromTop];
    } else if (submod == 3) {
        [res addObject:kCATransitionFromBottom];
        ++counter;
    }
    ++subcounter;
    
    return res;
}

/////////////////////////////////////////////////////////////////////////
static float _defaultActionDuration = 2.5;

/////////////////////////////////////////////////////////////////////////
+ (void)setDefaultActionDuration:(float)duration {
    _defaultActionDuration = duration;
}

/////////////////////////////////////////////////////////////////////////
+ (float)defaultActionDuration {
    return _defaultActionDuration;
}

/////////////////////////////////////////////////////////////////////////
+ (id<CAAction>)defaultActionForKey:(NSString*)event {
    if ([event isEqualToString:@"contents"]) {
        NSArray* pars = [self actionInSequence];
        CATransition* basicAnimation = [CATransition animation];
        //        basicAnimation.type = [pars objectAtIndex:0];
        basicAnimation.type = kCATransitionFade;
        basicAnimation.subtype = [pars objectAtIndex:1];
        basicAnimation.duration = _defaultActionDuration;
        //        NSLog(@"Created default action with duration: %f", _defaultActionDuration);
        return basicAnimation;
    } else {
        return nil;
    }
}

@end


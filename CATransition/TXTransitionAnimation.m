//
//  TXTransitionAnimation.m
//  CATransition
//
//  Created by tianXin on 16/3/10.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "TXTransitionAnimation.h"

@implementation TXTransitionAnimation
+ (void)transitionForView:(UIView *)aView
                     type:(TXTransitionType)type
                  subtype:(HYBTransitionSubtype)subtype
                 duration:(NSTimeInterval)duration {
    NSString *animationType = nil;
    NSString *animationSubtype = nil;
    
    switch (subtype) {
        case kHYBTransitionSubtypeFromLeft:
            animationSubtype = kCATransitionFromLeft;
            break;
        case kHYBTransitionSubtypeFromRight:
            animationSubtype = kCATransitionFromRight;
            break;
        case kHYBTransitionSubtypeFromTop:
            animationSubtype = kCATransitionFromTop;
            break;
        case kHYBTransitionSubtypeFromBottom:
            animationSubtype = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    
    switch (type) {
        case kHYBTransitionFade: {
            animationType = kCATransitionFade;
            break;
        }
        case kHYBTransitionPush: {
            animationType = kCATransitionPush;
            break;
        }
        case kHYBTransitionReveal: {
            animationType = kCATransitionReveal;
            break;
        }
        case kHYBTransitionMoveIn: {
            animationType = kCATransitionMoveIn;
            break;
        }
        case kHYBTransitionCube: {
            animationType = @"cube";
            break;
        }
        case kHYBTransitionSuckEffect: {
            animationType = @"suckEffect";
            break;
        }
        case kHYBTransitionRippleEffect: {
            animationType = @"rippleEffect";
            break;
        }
        case kHYBTransitionPageCurl: {
            animationType = @"pageCurl";
            break;
        }
        case kHYBTransitionPageUnCurl: {
            animationType = @"pageUnCurl";
            break;
        }
        case kHYBTransitionCameraOpen: {
            animationType = @"cameraIrisHollowOpen";
            break;
        }
        case kHYBTransitionCameraClose: {
            animationType = @"cameraIrisHollowClose";
            break;
        }
        case kHYBTransitionCurlDown: {
            [self animationForView:aView type:UIViewAnimationTransitionCurlDown duration:duration];
            break;
        }
        case kHYBTransitionCurlUp: {
            [self animationForView:aView type:UIViewAnimationTransitionCurlUp duration:duration];
            break;
        }
        case kHYBTransitionFlipFromLeft: {
            [self animationForView:aView type:UIViewAnimationTransitionFlipFromLeft duration:duration];
            break;
        }
        case kHYBTransitionFlipFromRight: {
            [self animationForView:aView type:UIViewAnimationTransitionFlipFromRight duration:duration];
            break;
        }
        case kHYBTransitionOglFlip:
            animationType = @"oglFlip";
            break;
        default: {
            break;
        }
    }
    
    if (animationType != nil) {
        CATransition *animation = [CATransition animation];
        animation.duration = duration;
        animation.type = animationType;
        
        if (animationSubtype != nil) {
            animation.subtype = animationSubtype;
        }
        
        animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
        
        [aView.layer addAnimation:animation forKey:@"animation"];
    }
}

+ (void)animationForView:(UIView *)aView
                    type:(UIViewAnimationTransition)type
                duration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:type forView:aView cache:YES];
    }];
}
@end

//
//  ViewController.m
//  CATransition
//
//  Created by tianXin on 16/3/10.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "ViewController.h"
#import "TXTransitionAnimation.h"

@interface ViewController ()
@property (nonatomic, assign) int subtype;
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) UIImage *img1;
@property (nonatomic, strong) UIImage *img2;
@property (nonatomic, assign) BOOL isImg1;
@property (nonatomic, assign) NSUInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@(kHYBTransitionFade),
                   @(kHYBTransitionPush),
                   @(kHYBTransitionReveal),
                   @(kHYBTransitionMoveIn),
                   @(kHYBTransitionCube),
                   @(kHYBTransitionSuckEffect),
                   @(kHYBTransitionRippleEffect),
                   @(kHYBTransitionPageCurl),
                   @(kHYBTransitionPageUnCurl),
                   @(kHYBTransitionCameraOpen),
                   @(kHYBTransitionCameraClose),
                   @(kHYBTransitionCurlDown),
                   @(kHYBTransitionCurlUp),
                   @(kHYBTransitionFlipFromLeft),
                   @(kHYBTransitionFlipFromRight),
                   @(kHYBTransitionOglFlip)];
    self.img1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMG_0348" ofType:@"JPG"]];
    self.img2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMG_0349" ofType:@"JPG"]];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:self.img1];
    self.isImg1 = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateAnimation)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)updateAnimation {
    
    if (self.index >= self.array.count) {
        self.index = 0;
    }
    
    TXTransitionType type = [[self.array objectAtIndex:self.index++] intValue];
    static int s_subtypeValue = 0;
    HYBTransitionSubtype subtype = kHYBTransitionSubtypeFromTop;
    s_subtypeValue++;
    if (s_subtypeValue >= 4) {
        s_subtypeValue = 1;
    }
    
    subtype = (HYBTransitionSubtype)s_subtypeValue;
    
    [TXTransitionAnimation transitionForView:self.view
                                         type:type
                                      subtype:subtype
                                     duration:1.0];
    
    if (self.isImg1) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:self.img1];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:self.img2];
    }
    
    self.isImg1 = !self.isImg1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

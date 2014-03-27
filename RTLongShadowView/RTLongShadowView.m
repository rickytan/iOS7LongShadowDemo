//
//  RTLongShadowView.m
//  iOS7LongShadowDemo
//
//  Created by ricky on 14-3-28.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import "RTLongShadowView.h"
#import <QuartzCore/QuartzCore.h>

@interface RTLongShadowViewInterner : UIView
@property (nonatomic, assign, getter = isShadowOn) BOOL shadowOn;
@end

@implementation RTLongShadowViewInterner

+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

- (void)setShadowOn:(BOOL)shadowOn
{
    if (_shadowOn != shadowOn) {
        _shadowOn = shadowOn;
        if (_shadowOn) {
            CAReplicatorLayer *r = (CAReplicatorLayer *)self.layer;
            r.instanceCount = 50 * [UIScreen mainScreen].scale;
            r.instanceColor = [UIColor colorWithWhite:0.4 alpha:0.2].CGColor;
            r.preservesDepth = YES;
            r.instanceTransform = CATransform3DMakeTranslation(1.0 / [UIScreen mainScreen].scale, 1.0 / [UIScreen mainScreen].scale, -1);
            r.instanceAlphaOffset = -0.002;
        }
        else {
            CAReplicatorLayer *r = (CAReplicatorLayer *)self.layer;
            r.instanceCount = 0;
        }
    }
}

@end

@interface RTLongShadowView ()
@property (nonatomic, strong) RTLongShadowViewInterner *interner;
@end
@implementation RTLongShadowView

- (RTLongShadowViewInterner *)interner
{
    if (!_interner) {
        _interner = [[RTLongShadowViewInterner alloc] initWithFrame:self.bounds];
        [self addSubview:_interner];
        [self sendSubviewToBack:_interner];
    }
    return _interner;
}

- (void)addSubview:(UIView *)view
{
    [super addSubview:view];

    [self.interner addSubview:[NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:view]]];
}

- (void)setShadowOn:(BOOL)shadowOn
{
    self.interner.shadowOn = shadowOn;
}

- (BOOL)isShadowOn
{
    return self.interner.isShadowOn;
}

@end
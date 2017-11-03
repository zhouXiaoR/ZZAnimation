//
//  ZZProgressView.m
//  ZZAnimationDemo
//
//  Created by 周晓瑞 on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZZProgressView.h"

@interface ZZProgressView()<CAAnimationDelegate>
@property(nonatomic,weak)CAShapeLayer *shapeLayer;
@property(nonatomic,weak)CAGradientLayer *gLayer;
@end


@implementation ZZProgressView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self defaultConfig];
}
- (void)defaultConfig{
    self.progressType = ZZProgressTypeLine;
}
- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self dpath];
    [self animtion];
}
- (void)animtion{
    [self startAnimation];
}
- (CAGradientLayer *)gLayer{
    if (_gLayer == nil) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.locations = @[[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.75]];
        gradientLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor orangeColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor blueColor].CGColor];
        gradientLayer.startPoint    = CGPointMake(0, 0.5);
        gradientLayer.endPoint      = CGPointMake(1.0, 0.5);
        [self.layer addSublayer:gradientLayer];
        gradientLayer.mask = self.shapeLayer;
        _gLayer = gradientLayer;
    }
    return _gLayer;
}

- (CAShapeLayer *)shapeLayer{
    if (_shapeLayer == nil) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        
        //这句代码666
       shapeLayer.strokeColor = [UIColor redColor].CGColor;
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 5.0f;
        shapeLayer.lineCap = kCALineCapRound;
        [self.layer addSublayer:shapeLayer];
        _shapeLayer = shapeLayer;
    }
    return _shapeLayer;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.shapeLayer.frame = self.bounds; 
    self.gLayer.frame = self.bounds;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)setProgressType:(ZZProgressType)progressType{
    _progressType = progressType;
}
- (void)dpath{
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    UIBezierPath * bezierPath = nil;
    
    if (self.progressType == ZZProgressTypeLine) {
        CGFloat  moveMinDisRate = 0.1f;
        bezierPath =  [UIBezierPath bezierPath];
        CGPoint  startPoint = CGPointMake(moveMinDisRate * w, w/2.0);
        CGPoint  endPoint = CGPointMake((w - 2 * moveMinDisRate * w)*self.progress, w/2.0);
        [bezierPath moveToPoint:startPoint];
        [bezierPath addLineToPoint:endPoint];
    }else if(self.progressType == ZZProgressTypeCircle){
        CGFloat startAngle = 0;
        CGFloat endAngle = M_PI * 2*self.progress + startAngle;
        bezierPath =  [UIBezierPath bezierPathWithArcCenter:CGPointMake(w/2.0, h/2.0) radius:(w-10)/2.0 startAngle:startAngle endAngle:endAngle clockwise:YES];
    }else{
        //custom more type...
    }
   
    self.shapeLayer.path = bezierPath.CGPath;
}
- (void)startAnimation{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.duration = 1.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate =self;
    [self.shapeLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //NSLog(@"animationDidStop");
}


@end

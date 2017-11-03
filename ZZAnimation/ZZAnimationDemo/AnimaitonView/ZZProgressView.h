//
//  ZZProgressView.h
//  ZZAnimationDemo
//
//  Created by 周晓瑞 on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZZProgressType) {
    ZZProgressTypeLine = 0,
    ZZProgressTypeCircle = 1,
};

@interface ZZProgressView : UIView

@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,assign)ZZProgressType progressType;

@end

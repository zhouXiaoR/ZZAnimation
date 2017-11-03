//
//  ZZTableViewCell.m
//  ZZAnimationDemo
//
//  Created by 周晓瑞 on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZZTableViewCell.h"
#import "ZZProgressView.h"

 NSString * ZZChangeProgressTypeNotification = @"ZZChangeProgressTypeNotification";

@interface ZZTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *favoLab;
@property (weak, nonatomic) IBOutlet ZZProgressView *z_progressView;
@end


@implementation ZZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.z_progressView.progressType = ZZProgressTypeLine;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeType) name:ZZChangeProgressTypeNotification object:nil];
}

- (void)changeType{
    if (self.z_progressView.progressType == ZZProgressTypeLine) {
        self.z_progressView.progressType = ZZProgressTypeCircle;
    }else{
        self.z_progressView.progressType = ZZProgressTypeLine;
    }
}

- (void)setPercent:(CGFloat)percent{
    _percent = percent;
    [self updateGoodObject];
}
- (void)updateGoodObject{
    self.z_progressView.progress = self.percent ;
    self.favoLab.text = [NSString stringWithFormat:@"%%%.f",self.percent * 100];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end

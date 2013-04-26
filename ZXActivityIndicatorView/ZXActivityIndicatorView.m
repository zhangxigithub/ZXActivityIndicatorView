//
//  ZXActivityIndicatorView.m
//  ZXActivityIndicatorView
//
//  Created by 张 玺 on 13-4-25.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "ZXActivityIndicatorView.h"

@implementation ZXActivityIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        lastSpeed = -1;
        loading = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
        loading.image = [UIImage imageNamed:@"loading"];
        [self addSubview:loading];
        
    }
    return self;
}

-(void)move
{
    if(self.speed != lastSpeed)
    {
        lastSpeed = (_speed+lastSpeed)/2;
    }
    loading.transform = CGAffineTransformRotate(loading.transform, lastSpeed);
}

-(void)setSpeed:(float)speed
{
    _speed = speed;
    
    if(speed == 0)
    {
        [load invalidate];
        return;
    }
    
    if(lastSpeed == -1)
        lastSpeed = speed;
    
    [load invalidate];
    load = [NSTimer scheduledTimerWithTimeInterval:1.0f/30.0f
                                            target:self
                                          selector:@selector(move)
                                          userInfo:nil
                                           repeats:YES];
    
}


@end

//
//  ZXActivityIndicatorView.h
//  ZXActivityIndicatorView
//
//  Created by 张 玺 on 13-4-25.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXActivityIndicatorView : UIView
{
    UIImageView *loading;
    NSTimer     *load;
    float        lastSpeed;
}
@property(nonatomic,assign) float speed;

@end

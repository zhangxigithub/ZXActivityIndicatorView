//
//  ViewController.m
//  ZXActivityIndicatorView
//
//  Created by 张 玺 on 13-4-25.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

}

-(void)speed:(float)speed
{
    [self performSelector:@selector(set:)
               withObject:[NSNumber numberWithFloat:speed]
               afterDelay:0.5];
}
-(void)set:(NSNumber *)speed
{
    loading.speed = [speed floatValue];
}
-(void)show
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                         bg.frame = CGRectMake(0, 0, 320, 44);
                     }
     completion:^(BOOL finished) {
         [self speed:0.2];
     }];
}
-(void)high
{
    loading.speed = 0.4;
}
-(void)low
{
    loading.speed = 0.1;
}
-(void)hide
{
    loading.speed = 0;
    [UIView animateWithDuration:0.2
                     animations:^{
                         [NSThread sleepForTimeInterval:0.5];
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                         bg.frame = CGRectMake(0, -44, 320, 44);
                     } completion:^(BOOL finished) {
                         
                     }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [bg removeFromSuperview];
    bg = [[UIView alloc] initWithFrame:CGRectMake(0, -44, 320, 44)];
    bg.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:bg];
    
    
    loading = [[ZXActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [bg addSubview:loading];
    
    
    
    loading.center = CGPointMake(160, bg.frame.size.height/2);
    
    [self show];
    
    [self performSelector:@selector(high)
               withObject:nil
               afterDelay:2];
    
    [self performSelector:@selector(low)
               withObject:nil
               afterDelay:4];
    [self performSelector:@selector(hide)
               withObject:nil
               afterDelay:6];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

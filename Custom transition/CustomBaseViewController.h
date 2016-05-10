//
//  CustomBaseViewController.h
//  Custom transition
//
//  Created by  易述宏 on 16/5/10.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNetWorkLoadingViewController.h"

@interface CustomBaseViewController : UIViewController

@property(strong,nonatomic)MyNetWorkLoadingViewController * LoadingViewController;


-(void)showLoadingViewSelector:(SEL)aSelector;

-(void)showLoadingContView;

-(void)showNoDateContView;

-(void)showNoNetWorkContView;

- (void)showNoContentViewBelow:(UIView *)view;

-(void)showContView;

@end

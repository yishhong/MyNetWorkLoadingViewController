//
//  MyNetWorkLoadingViewController.h
//  Custom transition
//
//  Created by  易述宏 on 16/5/9.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyNetWorkLoadingViewControllerDelegate <NSObject>

/**
 *  重新加载数据
 */
-(void)retryRequest;

@end

@interface MyNetWorkLoadingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityindicatorView;
@property (strong, nonatomic) IBOutlet UIView *showLoadingView;
@property (strong, nonatomic) IBOutlet UIView *showNoDateView;
@property (strong, nonatomic) IBOutlet UIView *showNetWorkView;

@property(strong,nonatomic)id<MyNetWorkLoadingViewControllerDelegate> delegate;

/**
 *  加载数据
 */
-(void)showLoadingContView;

/**
 *  暂无数据
 */
-(void)showNoDateContView;

/**
 *  没有网络
 */
-(void)showNoNetWorkContView;

@end

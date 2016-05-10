//
//  CustomBaseViewController.m
//  Custom transition
//
//  Created by  易述宏 on 16/5/10.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "CustomBaseViewController.h"

@interface CustomBaseViewController ()<MyNetWorkLoadingViewControllerDelegate>

@property(assign,nonatomic)SEL  retrySlector;

@end

@implementation CustomBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)showLoadingViewSelector:(SEL)aSelector{

    [self showLoadingContView];
    self.retrySlector =aSelector;
}

-(void)showLoadingContView{
    
    self.LoadingViewController.view.hidden =NO;
    [self.view bringSubviewToFront:self.LoadingViewController.view];
    [self.LoadingViewController showLoadingContView];
}

- (void)showNoContentViewBelow:(UIView *)view
{
    self.LoadingViewController.view.hidden = NO;
    [self.view insertSubview:self.LoadingViewController.view belowSubview:view];
    [self.LoadingViewController showNoDateContView];
}

-(void)showNoDateContView{

    self.LoadingViewController.view.hidden=NO;
    [self.view bringSubviewToFront:self.LoadingViewController.view];
    [self.LoadingViewController showNoDateContView];
}

-(void)showNoNetWorkContView{

    self.LoadingViewController.view.hidden=NO;
    [self.view bringSubviewToFront:self.LoadingViewController.view];
    [self.LoadingViewController showNoNetWorkContView];
}

-(void)showContView{

    if (!_LoadingViewController) {
        return;
    }
    
    [UIView transitionWithView:self.view duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void) {
        
        [self.LoadingViewController.view removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
        [self.LoadingViewController removeFromParentViewController];
        self.LoadingViewController = nil;
        
    }];

}

-(MyNetWorkLoadingViewController *)LoadingViewController{

    if (!_LoadingViewController) {
        _LoadingViewController =[[MyNetWorkLoadingViewController alloc]initWithNibName:NSStringFromClass([MyNetWorkLoadingViewController class]) bundle:nil];
        _LoadingViewController.view.frame =self.view.bounds;
        [self.view addSubview:_LoadingViewController.view];
        [self addChildViewController:_LoadingViewController];
        _LoadingViewController.delegate =self;
        _LoadingViewController.view.hidden =YES;
    }
    return _LoadingViewController;
}

#pragma mark -MyNetWorkLoadingViewControllerDelegate
/**
 *  重新加载数据
 */
-(void)retryRequest{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

    if ([self respondsToSelector:self.retrySlector]) {
        [self performSelector:self.retrySlector];
    }
#pragma clang diagnostic pop
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

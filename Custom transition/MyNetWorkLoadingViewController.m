//
//  MyNetWorkLoadingViewController.m
//  Custom transition
//
//  Created by  易述宏 on 16/5/9.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "MyNetWorkLoadingViewController.h"

@interface MyNetWorkLoadingViewController ()

@end

@implementation MyNetWorkLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showNoDateView.hidden =YES;
    self.showNetWorkView.hidden =YES;
}

#pragma mark -method
-(void)showLoadingContView{

    [self.activityindicatorView startAnimating];
    self.showLoadingView.hidden =NO;
    self.showNoDateView.hidden =YES;
    self.showNetWorkView.hidden =YES;
}

-(void)showNoDateContView{

    [self.activityindicatorView stopAnimating];
    self.showNoDateView.hidden =NO;
    self.showLoadingView.hidden =YES;
    self.showNetWorkView.hidden =YES;
}

-(void)showNoNetWorkContView{

    [self.activityindicatorView stopAnimating];
    self.showNetWorkView.hidden =NO;
    self.showLoadingView.hidden =YES;
    self.showNoDateView.hidden =YES;
}

- (IBAction)requestButton:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(retryRequest)]) {
        
        [self.delegate retryRequest];
        [self showLoadingContView];
    }
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

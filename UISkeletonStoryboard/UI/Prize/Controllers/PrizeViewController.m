//
//  PrizeViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "PrizeViewController.h"
#import "ShowInfoViewController.h"
#import "ShowInfoTransitioning.h"

@interface PrizeViewController ()

- (IBAction)doPresentShowInfoVC:(id)sender;
@end

@implementation PrizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"奖励";
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

#pragma mark -
#pragma mark Button functions

- (IBAction)doPresentShowInfoVC:(id)sender {
    
    ShowInfoViewController *showInfoVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ShowInfoViewControllerSBID"];
    // 必须设置为UIModalPresentationCustom才能自定义
    showInfoVC.modalPresentationStyle = UIModalPresentationCustom;
    // 实现代理
    //ShowInfoTransitioning *showInfoTransitioning = [[ShowInfoTransitioning alloc] init];
    showInfoVC.transitioningDelegate = [ShowInfoTransitioning sharedInstance];
    
    [self presentViewController:showInfoVC animated:YES completion:nil];
    //[self performSegueWithIdentifier:@"gotoShowInfoViewController" sender:self];
}

@end

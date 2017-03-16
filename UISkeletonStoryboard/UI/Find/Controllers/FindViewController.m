//
//  FindViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "FindViewController.h"
#import "NewsViewModels.h"
#import "NewsTableViewCell.h"
#import "DetailViewController.h"

@interface FindViewController ()

@property (nonatomic, weak) IBOutlet UITableView *newsTBView;
@property (nonatomic, strong) NSArray *newsArray;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发现";
    
    NewsViewModels *newsVM = [[NewsViewModels alloc] init];
    __weak FindViewController *weakSelf = self;
    newsVM.newsVMReturnDataBlock = ^(id returnData) {
        
        weakSelf.newsArray = (NSArray *)returnData;
        __weak FindViewController *secondWeakSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            [secondWeakSelf.newsTBView reloadData];
        });
    };
    newsVM.newsVMErrorCodeBlock = ^(id errorCode) {
        
    };
    [newsVM getNewsData];
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

#pragma mark
#pragma mark - UITableViewDataSource and UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifierStr = @"NewsTableViewCellIdentifier";
    NewsTableViewCell *newsTableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierStr forIndexPath:indexPath];
    newsTableViewCell.newsModel = self.newsArray[indexPath.row];
    
    return newsTableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"gotoDetailViewController" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark
#pragma mark - Data Transmit

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //DetailViewController *detailVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"gotoDetailViewController"]) {
        
    }
}

@end

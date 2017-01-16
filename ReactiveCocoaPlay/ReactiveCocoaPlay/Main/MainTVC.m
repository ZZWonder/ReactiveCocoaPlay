//
//  MainTVC.m
//  ReactiveCocoaPlay
//
//  Created by _ on 2016/12/22.
//  Copyright © 2016年 vint. All rights reserved.
//

#import "MainTVC.h"
#import "ViewController.h"
#import "UIImage+wonder.h"

@interface MainTVC ()

@property (nonatomic, copy) NSArray *tableData;
@property (nonatomic, copy) NSArray *tableDetailTextData;

@end

@implementation MainTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableViewData];
    [self setNavigationBarOpquary];
}

- (void)tableViewData {
    self.tableData = @[@"merge", @"subject"];
    self.tableDetailTextData = @[@"", @"ZZSubjectVC"];
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.tableView setContentInset:UIEdgeInsetsMake(-(CGRectGetMaxY(self.navigationController.navigationBar.frame)), 0, 0, 0)];
}

- (void)setNavigationBarOpquary {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage zz_imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage zz_imageWithColor:[UIColor clearColor]];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellId"];
    cell.textLabel.text = self.tableData[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.text = self.tableDetailTextData[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ViewController *vc;
    if (indexPath.row == 0) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        vc = [sb instantiateInitialViewController];        
    } else {
        Class vv = NSClassFromString(cell.detailTextLabel.text);
        vc = [[vv alloc] init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat"] highlightedImage:nil];
}

@end
























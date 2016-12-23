//
//  MainTVC.m
//  ReactiveCocoaPlay
//
//  Created by 王震 on 2016/12/22.
//  Copyright © 2016年 vint. All rights reserved.
//

#import "MainTVC.h"
#import "ViewController.h"

@interface MainTVC ()

@property (nonatomic, copy) NSArray *tableData;

@end

@implementation MainTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableViewData];
}

- (void)tableViewData {
    self.tableData = @[@"merge"];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.textLabel.text = self.tableData[indexPath.row];
    
    cell.textLabel.textColor = [UIColor redColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [sb instantiateInitialViewController];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
























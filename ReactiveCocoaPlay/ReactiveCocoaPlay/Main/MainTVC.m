//
//  MainTVC.m
//  ReactiveCocoaPlay
//
//  Created by 王震 on 2016/12/22.
//  Copyright © 2016年 vint. All rights reserved.
//

#import "MainTVC.h"

@interface MainTVC ()

@property (nonatomic, copy) NSArray *tableData;

@end

@implementation MainTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableData];
}

- (void)tableViewData {
    self.tableData = @[@"merge"];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.detailTextLabel.text = self.tableData[indexPath.row];
    cell.detailTextLabel.textColor = [UIColor redColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
























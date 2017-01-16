//
//  ZZSubjectVC.m
//  ReactiveCocoaPlay
//
//  Created by vinsent on 2017/1/16.
//  Copyright © 2017年 vint. All rights reserved.
//

#import "ZZSubjectVC.h"
#import "ZZSubjectNextVC.h"

@interface ZZSubjectVC ()

@end

@implementation ZZSubjectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)creatView {
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    pushBtn.center = self.view.center;
    [pushBtn setTitle:@"nesxtVC" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(modalToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)modalToNextVC:(UIButton *)sender {
    ZZSubjectNextVC *vc = [[ZZSubjectNextVC alloc] init];
    vc.delegateSignal = [RACSubject subject];
    [vc.delegateSignal subscribeNext:^(id x) {
        [sender setTitle:x forState:UIControlStateNormal];
    }];
    [self presentViewController:vc animated:YES completion:nil];
}

@end

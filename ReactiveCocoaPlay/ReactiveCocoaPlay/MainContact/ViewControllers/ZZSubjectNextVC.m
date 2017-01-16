//
//  ZZSubjectNextVC.m
//  ReactiveCocoaPlay
//
//  Created by vinsent on 2017/1/16.
//  Copyright © 2017年 vint. All rights reserved.
//

#import "ZZSubjectNextVC.h"

@interface ZZSubjectNextVC ()

@end

@implementation ZZSubjectNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"subject";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatView];
}

- (void)creatView {
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    pushBtn.center = self.view.center;
    [pushBtn setTitle:@"lastVC" forState:UIControlStateNormal];
    [pushBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)dismissSelf {
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:self.title];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

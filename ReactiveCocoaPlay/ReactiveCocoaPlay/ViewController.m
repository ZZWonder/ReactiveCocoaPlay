//
//  ViewController.m
//  ReactiveCocoaPlay
//
//  Created by 王震 on 2016/12/21.
//  Copyright © 2016年 vint. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *completSwitch;
@property (nonatomic, strong) id leftSubscriber;
@property (nonatomic, strong) id rightSubscriber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"merge";
    [self reactiveCocoaMerge];
}

- (void)reactiveCocoaMerge {
    RACSignal *leftSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        self.leftSubscriber = subscriber;
        return nil;
    }];
    
    RACSignal *rightSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        self.rightSubscriber = subscriber;
        return nil;
    }];
    
    [[RACSignal merge:@[leftSignal,rightSignal]] subscribeCompleted:^{
        [self.completSwitch setOn:YES animated:YES];
        [self performSelector:@selector(dismissSelf) withObject:nil afterDelay:1];
    }];
}


- (IBAction)leftSwitchChanged:(id)sender {
    [_leftSubscriber sendCompleted];
}

- (IBAction)rightSwitchChanged:(id)sender {
    [_rightSubscriber sendCompleted];
}

- (void)dismissSelf {
    [self.navigationController popViewControllerAnimated:YES];
}

@end





















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
@property (nonatomic,strong) RACSignal *left;
@property (nonatomic,strong) RACSignal *right;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self reactiveCocoaMerge];
}

- (void)reactiveCocoaMerge {
    RACSignal *leftSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        self.leftSubscriber = subscriber;
        return nil;
    }];
    _left = leftSignal;
    
    RACSignal *rightSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        self.rightSubscriber = subscriber;
        return nil;
    }];
    _right = rightSignal;
    
    [[RACSignal merge:@[leftSignal,rightSignal]] subscribeCompleted:^{
        [self.completSwitch setOn:YES animated:YES];
        [self performSelector:@selector(dismissSelf) withObject:nil afterDelay:1];
    }];
    
}

- (void)dismissSelf {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)leftSwitchChanged:(id)sender {
    [_leftSubscriber sendCompleted];
}

- (IBAction)rightSwitchChanged:(id)sender {
    [_rightSubscriber sendCompleted];
}


@end





















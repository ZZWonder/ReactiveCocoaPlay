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
    }];
    
    [_completSwitch addTarget:self action:@selector(midSwitchChanged:) forControlEvents:UIControlEventValueChanged];
}
- (IBAction)bottomSwitchChanged:(id)sender {
    [[RACSignal merge:@[_left,_right]] subscribeCompleted:^{
        self.completSwitch.on = !self.completSwitch.isOn;
    }];
}

- (void)midSwitchChanged:(UISwitch *)sender {
    
}

- (IBAction)leftSwitchChanged:(id)sender {
    [_leftSubscriber sendCompleted];
}

- (IBAction)rightSwitchChanged:(id)sender {
    [_rightSubscriber sendCompleted];
}


@end





















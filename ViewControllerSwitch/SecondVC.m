//
//  SecondVC.m
//  ViewControllerSwitch
//
//  Created by S on 15/11/27.
//  Copyright © 2015年 S. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"2";
    self.view.backgroundColor = [UIColor cyanColor];
    
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    NSLog(@"second did move to parent");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"second view will apper");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"second view will disapper");
}

- (void)dealloc {
    NSLog(@"second");
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

@end

//
//  FourthVC.m
//  ViewControllerSwitch
//
//  Created by S on 15/11/27.
//  Copyright © 2015年 S. All rights reserved.
//

#import "FourthVC.h"

@interface FourthVC ()

@end

@implementation FourthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"4";
    self.view.backgroundColor = [UIColor blueColor];
    
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    NSLog(@"four did move to parent");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"four view will apper");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"four view will disapper");
}

- (void)dealloc {
    NSLog(@"four");
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

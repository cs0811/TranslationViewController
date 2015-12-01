//
//  ThirdVC.m
//  ViewControllerSwitch
//
//  Created by S on 15/11/27.
//  Copyright © 2015年 S. All rights reserved.
//

#import "ThirdVC.h"

@interface ThirdVC ()

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"3";
    self.view.backgroundColor = [UIColor redColor];
    

}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    NSLog(@"third did move to parent");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"third view will apper");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"tird view will disapper");
}

- (void)dealloc {
    NSLog(@"tird");
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

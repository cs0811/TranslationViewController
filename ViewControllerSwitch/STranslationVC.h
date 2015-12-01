//
//  STranslationVC.h
//  ViewControllerSwitch
//
//  Created by S on 15/12/1.
//  Copyright © 2015年 S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STranslationVC : UIViewController

/**
 传入要管理的视图控制器
 */
@property (nonatomic,strong) NSArray * translationViewControllers;
/**
 首先要显示的视图控制器
 */
@property (nonatomic,strong) UIViewController * firstViewController;
/**
 切换视图控制器时间  默认 0.25s
 */
@property (nonatomic,assign) NSTimeInterval intervalTime;
/**
 顶部标题数组
 */
@property (nonatomic,strong) NSArray * titleArray;
/**
 顶部标题滚动条高度  默认 40
 */
@property (nonatomic,assign) CGFloat topTitleScrollHeight;

@end

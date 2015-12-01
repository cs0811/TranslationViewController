//
//  STranslationVC.m
//  ViewControllerSwitch
//
//  Created by S on 15/12/1.
//  Copyright © 2015年 S. All rights reserved.
//

#import "STranslationVC.h"
#import <objc/runtime.h>
#import "Masonry.h"


typedef enum{
    TranslationWorkFree =0 ,
    TranslationWorking ,
}TranslationWorkStatus;

static char TranslationVCKey;

@interface STranslationVC ()

@property (nonatomic,strong) UIViewController * currentVC;
@property (nonatomic,strong) UIViewController * nextVC;
@property (nonatomic,assign) TranslationWorkStatus translationStatus;

@property (nonatomic,strong) UIScrollView * topTitleScrollview;

@end

@implementation STranslationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self loadUI];
}

#pragma mark - 添加 childVC
- (void)setTranslationViewControllers:(NSArray *)translationViewControllers {
    for (UIViewController * translationVC in translationViewControllers) {
        [self addChildViewController:translationVC];
    }
    objc_setAssociatedObject(self, &TranslationVCKey, translationViewControllers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)translationViewControllers {
    return objc_getAssociatedObject(self, &TranslationVCKey);
}

#pragma mark - 设置第一个 VC
- (void)setFirstViewController:(UIViewController *)firstViewController {
    [firstViewController didMoveToParentViewController:self];
    [self.view addSubview:firstViewController.view];
    
    _currentVC = firstViewController;
}

- (void)loadUI {
    
    // 标题滚动条
    _topTitleScrollview = [UIScrollView new];
    _topTitleScrollview.showsHorizontalScrollIndicator = NO;
    _topTitleScrollview.showsVerticalScrollIndicator = NO;
    _topTitleScrollview.backgroundColor = [UIColor grayColor];
    [self.navigationController.view addSubview:_topTitleScrollview];
    
    __weak typeof(self) wself = self;
    [_topTitleScrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(wself.navigationController.navigationBar.mas_bottom);
        make.left.right.equalTo(wself.navigationController.view);
        make.height.mas_equalTo(wself.topTitleScrollHeight? :40);
    }];
    
    // 标题按钮
    UIView * nextView = nil;
    for (NSString * title in _titleArray) {
        UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleBtn setTitle:title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        titleBtn.tag = 50+[_titleArray indexOfObject:title];
        CGFloat fontSize;
        if (titleBtn.tag == 50) {
            fontSize = 20;
        }else {
            fontSize = 16;
        }
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        [_topTitleScrollview addSubview:titleBtn];
        
        [titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nextView?nextView.mas_right:@0).offset(nextView?20:10);
            make.top.equalTo(wself.topTitleScrollview);
            make.height.equalTo(wself.topTitleScrollview);
        }];
        nextView = titleBtn;
    }
    
    // 更新顶部scrollView约束
    [_topTitleScrollview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nextView);
    }];
    
}

#pragma mark - 标题按钮
- (void)titleClick:(UIButton *)sender {
    /**
     tag 50,51,52....
     */
    for (int tag = 50; tag<_titleArray.count+50; tag++) {
        UIButton * titleBtn = [_topTitleScrollview viewWithTag:tag];
        if (sender.tag == tag) {
            sender.titleLabel.font = [UIFont systemFontOfSize:20];
        }else {
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        }
    }
    
    [self translationVcWithTag:sender.tag-50.0];
}

#pragma mark - 切换视图
- (void)translationVcWithTag:(int)tag {
    
    if (_translationStatus == TranslationWorking) {
        return;
    }
    
    NSInteger index = [self.translationViewControllers indexOfObject:_currentVC];
    if (index == tag) {
        return;
    }
    if (tag > self.translationViewControllers.count-1) {
        return;
    }
    
    _nextVC = [self.translationViewControllers objectAtIndex:tag];
    
    _translationStatus = TranslationWorking;
    [self transitionFromViewController:_currentVC toViewController:_nextVC duration:self.intervalTime? :0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
    } completion:^(BOOL finished) {
        _translationStatus = TranslationWorkFree;
        [_nextVC didMoveToParentViewController:self];
        _currentVC = _nextVC;
    }];
    
}

- (void)dealloc {
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC removeFromParentViewController];
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

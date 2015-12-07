# TranslationViewController
仿今日头条切换视图

## 接入
  STranslationVC * translation = [[STranslationVC alloc] init];
    // 配置属性
    translation.titleArray = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个",@"第六个",@"第七个"];    // 当标题数多于视图数时，多余的标题不会被响应
    translation.translationViewControllers = @[_second,_third,_fourth];
    translation.firstViewController = _second;

![image](https://github.com/cs0811/SRefresh/blob/master/SRefreshGif.gif) 

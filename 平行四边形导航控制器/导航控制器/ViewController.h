//
//  ViewController.h
//  导航控制器
//
//  Created by Smile on 2018/2/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController1;

@interface ViewController : UIViewController<UITabBarDelegate,UITabBarControllerDelegate>
{
    //用于装所有视图VC
    NSMutableArray *marr;
    
    //替换tabBar的自定义按钮
    UIButton *specialBut;
    
    
    ViewController1 *VC1;
}

@property(nonnull,nonatomic,strong)UITabBarController *mainTabbarController;


@end


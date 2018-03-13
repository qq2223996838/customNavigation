//
//  ViewController.m
//  导航控制器
//
//  Created by Smile on 2018/2/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "GraphicsView.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<GraphicsViewDelegate,UIScrollViewDelegate>
{
    int page;
}
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) GraphicsView *onNavView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    VC1=[[ViewController1 alloc]init];
    
    ViewController2 *VC2=[[ViewController2 alloc]init];
    
    ViewController3 *VC3=[[ViewController3 alloc]init];
    
    marr=[[NSMutableArray alloc]initWithObjects:VC1,VC2,VC3,nil];
    
    NSArray *titleName = @[@"PREAMP",@"CAB",@"BYPASS"];
    
    GraphicsView *onNavView = [[GraphicsView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    onNavView.name = titleName;
    onNavView.delegate = self;
    onNavView.chooseBgColor = [UIColor grayColor];
    onNavView.notBgColor = [UIColor yellowColor];
    onNavView.chooseTextBgColor = [UIColor blackColor];
    onNavView.notTextBgColor = [UIColor greenColor];
    [self.view addSubview:onNavView];
    self.onNavView = onNavView;
    
    // 1.创建一个scrollView：显示所有的新特性图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 50, ScreenWidth, ScreenHeight-50);
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.frame.size.width;
    CGFloat scrollH = scrollView.frame.size.height;
    for (int i = 0; i<marr.count; i++) {
        
        UIViewController *temporary = [[UIViewController alloc]init];
        temporary = marr[i];
        temporary.view.tag = 104+i;
        
        UIView *v = [[UIView alloc]init];
        v = temporary.view;
        v.frame = CGRectMake(i*scrollW, 0, scrollW, scrollH);
        v.tag = 104+i;
        [scrollView addSubview:v];
        
    }
    scrollView.contentSize = CGSizeMake(marr.count * scrollW, 1);
    scrollView.bounces = YES; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    
    //默认界面
    [self defaultVC];
    
}

//滚动时
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double pagex = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    page =(int)(pagex + 0.5);
}

//滚动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    double pagex = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    page =(int)(pagex + 0.5);
    
    self.onNavView.tagVC = page;
    
}

-(void)defaultVC
{
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    page = 0;
    
    self.onNavView.tagVC = page;
    
    CGRect nextRect = CGRectMake(page *scrollW,0,scrollW,scrollH);
    [self.scrollView scrollRectToVisible:nextRect animated:YES];
    
    return;
}

#pragma mark - GraphicsViewDelegate
- (void)composeToolGraphicsView:(GraphicsView *)pagingView moduleId:(int )moduleId;
{
    CGRect nextRect;
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    switch (moduleId) {
        case 0: //
            NSLog(@"我是跳转PREAMP");
            page = 0;
            nextRect = CGRectMake(page *scrollW,0,scrollW,scrollH);
            [self.scrollView scrollRectToVisible:nextRect animated:YES];
            break;
        case 1:
            NSLog(@"我是跳转CAB");
            page = 1;
            nextRect = CGRectMake(page *scrollW,0,scrollW,scrollH);
            [self.scrollView scrollRectToVisible:nextRect animated:YES];
            break;
        case 2:
            NSLog(@"我是跳转BYPASS");
            page = 2;
            nextRect = CGRectMake(page *scrollW,0,scrollW,scrollH);
            [self.scrollView scrollRectToVisible:nextRect animated:YES];
            break;
            
    }
}
@end

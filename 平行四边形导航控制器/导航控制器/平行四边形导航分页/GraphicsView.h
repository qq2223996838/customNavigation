//
//  GraphicsView.h
//  mooer
//
//  Created by Smile on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GraphicsView;

@protocol GraphicsViewDelegate <NSObject>
@optional
//回调告诉VC 用户选择的模块
- (void)composeToolGraphicsView:(GraphicsView *)pagingView moduleId:(int )moduleId;
@end


@interface GraphicsView : UIView

//需要改特定title的颜色
@property (nonatomic) int tagVC;

//未选择时背景色
@property (nonatomic,strong) UIColor *notBgColor;

//已选择时背景色
@property (nonatomic,strong) UIColor *chooseBgColor;

//未选择时标题字体颜色
@property (nonatomic,strong) UIColor *notTextBgColor;

//已选择时时标题字体颜色
@property (nonatomic,strong) UIColor *chooseTextBgColor;

//功能模块名字数组
@property (nonatomic, strong) NSArray *name;

//默认不做事，如要清除点击后颜色 设置等于NO
@property (nonatomic) BOOL EliminateClickColore;

@property (nonatomic, weak) id<GraphicsViewDelegate> delegate;

@end

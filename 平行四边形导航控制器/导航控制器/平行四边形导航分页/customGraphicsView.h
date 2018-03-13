//
//  testView.h
//  mooer
//
//  Created by Smile on 2018/3/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    customGraphicsViewTypetrapezoid,//梯形
    customGraphicsViewTypeRhombus,//平行四边形
    customGraphicsViewTyFallenPetrapezoid//倒梯形
} customGraphicsViewType;

@interface customGraphicsView : UIView

@property (nonatomic,strong) UIColor *bgColor;//我需要变的色

@property (nonatomic, assign) customGraphicsViewType graphicsType;//我需要画的图形

@property (nonatomic) CGFloat Angle;//设置空余距离  空余越大角度越大 为0是正方形

@end

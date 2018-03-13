//
//  testView.m
//  mooer
//
//  Created by Smile on 2018/3/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "customGraphicsView.h"

//透明背景色
#define transparentColor [UIColor colorWithRed:1/123 green:1/23 blue:1/233 alpha:0.]

@implementation customGraphicsView
{
    CGContextRef context;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = transparentColor;//背景色透明
        _bgColor = [UIColor whiteColor];//默认颜色白色
        _graphicsType = customGraphicsViewTypeRhombus;//默认平行四边形
        _Angle = 30;//
    }
    return self;
}

-(void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    [self setNeedsDisplay];
}

-(void)setAngle:(CGFloat )Angle
{
    _Angle = Angle;
    [self layoutSubviews];
}

-(void)setGraphicsType:(customGraphicsViewType )graphicsType
{
    _graphicsType = graphicsType;
    [self layoutSubviews];
}


- (void)drawRect:(CGRect)rect
{
    context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, self.frame.size.width/2,0);
    
    CGFloat Ax2 ;
    CGFloat Wx2 ;
    CGFloat Wx1 ;
    CGFloat Ax1 ;
    CGFloat Hy1 ;
    CGFloat Hy2 ;
    
    switch (_graphicsType) {
        case customGraphicsViewTypeRhombus: //
             Ax2 = 0;//上 x轴 起点
             Wx2 = self.frame.size.width-_Angle;//上 x轴 尾点
             Wx1 = _Angle;//下 x轴 起点
             Ax1 = self.frame.size.width;//下 x轴 尾点
             Hy1 = 0;//高度  上面横线
             Hy2 = self.frame.size.height;//高度  下面横线
            
            CGContextAddLineToPoint(context, Wx2, Hy1);//   ---点（上横线）
            CGContextAddLineToPoint(context, Ax1, Hy2);//   ---点（下横线）
            CGContextAddLineToPoint(context, Wx1, Hy2);//  点--- （下横线）
            CGContextAddLineToPoint(context, Ax2, Hy1);//  点--- （上横线）
        break;
            
        case customGraphicsViewTypetrapezoid:
             Ax2 = 0;//上 x轴 起点
             Wx2 = self.frame.size.width-_Angle;//上 x轴 尾点
             Wx1 = 0;//下 x轴 起点
             Ax1 = self.frame.size.width;//下 x轴 尾点
             Hy1 = 0;//高度  上面横线
             Hy2 = self.frame.size.height;//高度  下面横线
            
            CGContextAddLineToPoint(context, Wx2, Hy1);//   ---点（上横线）
            CGContextAddLineToPoint(context, Ax1, Hy2);//   ---点（下横线）
            CGContextAddLineToPoint(context, Wx1, Hy2);//  点--- （下横线）
            CGContextAddLineToPoint(context, Ax2, Hy1);//  点--- （上横线）
            break;
        case customGraphicsViewTyFallenPetrapezoid:
             Ax2 = 0;//上 x轴 起点
             Wx2 = self.frame.size.width;//上 x轴 尾点
             Wx1 = _Angle;//下 x轴 起点
             Ax1 = self.frame.size.width;//下 x轴 尾点
             Hy1 = 0;//高度  上面横线
             Hy2 = self.frame.size.height;//高度  下面横线
            
            CGContextAddLineToPoint(context, Wx2, Hy1);//   ---点（上横线）
            CGContextAddLineToPoint(context, Ax1, Hy2);//   ---点（下横线）
            CGContextAddLineToPoint(context, Wx1, Hy2);//  点--- （下横线）
            CGContextAddLineToPoint(context, Ax2, Hy1);//  点--- （上横线）
            break;
    }
    
    
    if (_bgColor != [UIColor whiteColor]) {
        
        CGContextSetFillColorWithColor(context, _bgColor.CGColor);//填充颜色
    }else{
        //默认颜色白色
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);//填充颜色
        
    }
    CGContextSetStrokeColorWithColor(context, transparentColor.CGColor);//设置连接线的颜色默认透明
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径加填充
}

@end

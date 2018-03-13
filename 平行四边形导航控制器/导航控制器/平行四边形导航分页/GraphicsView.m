//
//  GraphicsView.m
//  mooer
//
//  Created by Smile on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GraphicsView.h"
#import "customGraphicsView.h"

#define transparentColor [UIColor colorWithRed:1/123 green:1/23 blue:1/233 alpha:0.]

@implementation GraphicsView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setName:(NSArray *)name
{
    _name = name;
    
    customGraphicsView * bgView;
    CGFloat W = self.frame.size.width/3;
    
    for (int i=0; i<name.count; i++) {
        if (i == 1) {
            bgView  = [[customGraphicsView alloc] initWithFrame:CGRectMake(i * W-20, 0, W+50, self.frame.size.height)];
        }else{
            bgView  = [[customGraphicsView alloc] initWithFrame:CGRectMake(i * W-1, 0, W+20, self.frame.size.height)];
            if (bgView.frame.origin.x<0) {
                bgView.frame = CGRectMake(0, 0, W+20, self.frame.size.height);
            }
        }
        bgView.clipsToBounds=YES;
        bgView.graphicsType = i;
        bgView.tag = 200+i;
        [self addSubview:bgView];
        
        UILabel *Label = [[UILabel alloc] init];
        Label.frame = CGRectMake ( bgView.frame.origin.x+1,bgView.frame.origin.y+6,bgView.frame.size.width-20,bgView.frame.size.height);
        Label.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:14];
        Label.backgroundColor = transparentColor;
        Label.adjustsFontSizeToFitWidth=YES;
        Label.textAlignment = NSTextAlignmentCenter;
        Label.text = name[i];
        Label.tag = 100+i;
        Label.userInteractionEnabled = YES;
        UITapGestureRecognizer *LabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseVC:)];
        [Label addGestureRecognizer:LabelTap];
        
        [self addSubview:Label];
    }
    
}
-(void)chooseVC:(UITapGestureRecognizer *)sender
{
    for (NSUInteger i = 0; i<(int)_name.count; i++) {
        customGraphicsView *bgView = (customGraphicsView *)[self viewWithTag:200+i];
        bgView.bgColor = _notBgColor;
        UILabel *labelView = (UILabel *)[self viewWithTag:100+i];
        labelView.textColor = _notTextBgColor;
        
    }
    
    UILabel *Clicklabel = (UILabel *)sender.view;
    Clicklabel.textColor = _chooseTextBgColor;
    
    customGraphicsView *bgView = (customGraphicsView *)[self viewWithTag:100+Clicklabel.tag];
    bgView.bgColor = _chooseBgColor;
    
    [self.delegate composeToolGraphicsView:self moduleId:(int)Clicklabel.tag-100];
}

-(void)setEliminateClickColore:(BOOL)EliminateClickColore
{
    _EliminateClickColore = EliminateClickColore;
    
    if (EliminateClickColore == NO) {
        for (NSUInteger i = 0; i<(int)_name.count; i++) {
            customGraphicsView *bgView = (customGraphicsView *)[self viewWithTag:200+i];
            bgView.bgColor = _notBgColor;
            UILabel *labelView = (UILabel *)[self viewWithTag:100+i];
            labelView.textColor = _notTextBgColor;

        }
    }else{
        return;
    }
    
}

- (void)setTagVC:(int )tagVC
{
    _tagVC = tagVC;
    for (NSUInteger i = 0; i<(int)_name.count; i++) {
        customGraphicsView *bgView = (customGraphicsView *)[self viewWithTag:200+i];
        bgView.bgColor = _notBgColor;
        UILabel *labelView = (UILabel *)[self viewWithTag:100+i];
        labelView.textColor = _notTextBgColor;

    }
    customGraphicsView *bgView = (customGraphicsView *)[self viewWithTag:200+tagVC];
    bgView.bgColor = _chooseBgColor;
    UILabel *labelView = (UILabel *)[self viewWithTag:100+tagVC];
    labelView.textColor = _chooseTextBgColor;
}


- (void)setNotBgColor:(UIColor *)notBgColor
{
    _notBgColor = notBgColor;
}

- (void)setChooseBgColor:(UIColor *)chooseBgColor
{
    _chooseBgColor = chooseBgColor;
}
- (void)setNotTextBgColor:(UIColor *)notTextBgColor
{
    _notTextBgColor = notTextBgColor;
}

- (void)setChooseTextBgColor:(UIColor *)chooseTextBgColor
{
    _chooseTextBgColor = chooseTextBgColor;
}


@end

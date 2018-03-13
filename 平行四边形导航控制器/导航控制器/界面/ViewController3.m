//
//  ViewController3.m
//  导航控制器
//
//  Created by Smile on 2018/2/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel * Label  = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 200, 200)];
    Label.text=@"我是界面3";
    Label.font = [UIFont fontWithName:@"STHeitiSC-Light" size:20];
    Label.textColor = [UIColor blackColor];
    Label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:Label];
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

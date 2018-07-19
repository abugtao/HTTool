//
//  HTViewController.m
//  HTTool
//
//  Created by abugtao@163.com on 06/28/2018.
//  Copyright (c) 2018 abugtao@163.com. All rights reserved.
//

#import "HTViewController.h"
#import "HTTool.h"
@interface HTViewController ()
@property (nonatomic,strong)UILabel *labe;
@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton by_buttonWithFrame:CGRectMake(100, 100, 200, 40) bgColro:[UIColor yellowColor] textColor:[UIColor redColor] font:DiyFont(12) title:@"" boardColor:[UIColor greenColor] cornerRadius:20];
    [self.view addSubview:btn];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"你好",@"1",@"bb",@"2", nil];
    NSLog(@"%@",dic);
    
    
    UITextField *textF = [UITextField by_textFieldWithFrame:CGRectMake(100, 300, 200, 40) textColor:[UIColor grayColor] textFont:DiyFont(15) placeholder:@"反反复复" placeholderColor:[UIColor redColor] placeholderFont:DiyFont(12)];
    textF.backgroundColor = [UIColor greenColor];
    [textF by_creatRightViewWithWidth:40 image:nil textStr:@"ff" textColor:[UIColor yellowColor] textFont:DiyFont(14)];
    [self.view addSubview:textF];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.labe moveBy:CGPointMake(10, 6)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

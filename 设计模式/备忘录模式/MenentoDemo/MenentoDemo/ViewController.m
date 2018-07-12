//
//  ViewController.m
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "NSObject+memento.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestView *texeView = [[TestView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];

    [self.view addSubview:texeView];
    
    
    texeView.valueStr = @"idage";
  
    NSLog(@"恢复前 ===%@",texeView.valueStr );
    //保存
    [texeView saveStateWithKey:@"test"];

    texeView.valueStr = @"idage163";

    //恢复
    [texeView recoverFromStateWithKey:@"test"];
    
    NSLog(@"恢复后 ===%@",texeView.valueStr );
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

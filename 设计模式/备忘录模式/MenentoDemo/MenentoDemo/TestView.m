//
//  TestView.m
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import "TestView.h"

@implementation TestView


-(id)getStatus{
    
    return self.valueStr.length? self.valueStr: @"当前运动:10.00KM";
}

-(void)setStatus:(id)data{
    if (data) {
        self.valueStr = (NSString*)data;
  
    }
}

@end

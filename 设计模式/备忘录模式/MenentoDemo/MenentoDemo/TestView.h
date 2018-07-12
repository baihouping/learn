//
//  TestView.h
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MementoCenterProtocol.h"
@interface TestView : UIView<MementoCenterProtocol>

@property(nonatomic,copy)NSString *valueStr;

@end

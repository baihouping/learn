//
//  MementoCenterProtocol.h
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MementoCenterProtocol <NSObject>

/*
 获得状态
 */
-(id)getStatus;
/*
 设置状态
 */
-(void)setStatus:(id)data;
@end

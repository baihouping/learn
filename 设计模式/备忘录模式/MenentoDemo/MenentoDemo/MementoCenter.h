//
//  MementoCenter.h
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"

@interface MementoCenter : NSObject
/**
*  保存备忘录
*
*  @param object object
*  @param key    key
*/
+(void)saveMementoObject:(id<MementoCenterProtocol>)object withKey:(NSString*)key;

/**
 *  获得保存的状态数据
 *
 *  @param key key
 *
 *  @return 状态
 */
+(id)getMementObjectWithKey:(NSString*)key;


@end

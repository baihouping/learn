//
//  NSObject+memento.h
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (memento)
/**
 *  存储状态
 *
 *  @param key 键值
 */
- (void)saveStateWithKey:(NSString *)key;

/**
 *  恢复状态
 *
 *  @param key 键值
 */
- (void)recoverFromStateWithKey:(NSString *)key;

@end

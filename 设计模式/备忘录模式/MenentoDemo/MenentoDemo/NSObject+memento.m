//
//  NSObject+memento.m
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import "NSObject+memento.h"
#import "MementoCenter.h"

@implementation NSObject (memento)
/**
 *  存储状态
 *
 *  @param key 键值
 */
- (void)saveStateWithKey:(NSString *)key{
    
    if (key==nil) {
        
        return;
        
    }
    
    id<MementoCenterProtocol> obj = (id<MementoCenterProtocol>)self;
    
    if ([obj respondsToSelector:@selector(getStatus)]) {

        [MementoCenter saveMementoObject:obj withKey:key];

    }
}

/**
 *  恢复状态
 *
 *  @param key 键值
 */
- (void)recoverFromStateWithKey:(NSString *)key{
    if (key==nil) {
        return;
    }
    
    id state = [MementoCenter getMementObjectWithKey:key];

    id<MementoCenterProtocol> obj = (id<MementoCenterProtocol>)self;

    if ([obj respondsToSelector:@selector(setStatus:)]) {
        
        [obj setStatus:state];

    }
}

@end

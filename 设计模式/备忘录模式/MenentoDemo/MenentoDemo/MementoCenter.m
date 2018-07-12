//
//  MementoCenter.m
//  MenentoDemo
//
//  Created by 冯亮 on 2016/11/9.
//  Copyright © 2016年 idage. All rights reserved.
//

#import "MementoCenter.h"
#import "FastCoder.h"
@implementation MementoCenter
/**
 *  保存备忘录
 *
 *  @param object object
 *  @param key    key
 */
+(void)saveMementoObject:(id<MementoCenterProtocol>)object withKey:(NSString*)key{
    if (object==nil || key==nil) {
        return;
    }
    id  data = [object getStatus];
   
    NSData *tmpData = [FastCoder dataWithRootObject:data];
    
    // 进行存储
    if (tmpData) {
        
        [[NSUserDefaults standardUserDefaults] setObject:tmpData
                                                  forKey:key];
    }
}

/**
 *  获得保存的状态数据
 *
 *  @param key key
 *
 *  @return 状态
 */
+(id)getMementObjectWithKey:(NSString*)key{
    if (key==nil) {
        return nil;
    }
    id data =  nil;
    NSData *tmpData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if (tmpData) {
        
        data = [FastCoder objectWithData:tmpData];
    }
    
    return data;
    
    
}
@end

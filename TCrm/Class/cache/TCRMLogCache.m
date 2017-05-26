//
//  TCRMLogCache.m
//  TCrm
//
//  Created by baidu on 2017/5/19.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "TCRMLogCache.h"
#import "TCRMTools.h"

#define TCRMCachePath       @"tcrmcache.plist"

@interface TCRMLogCache ()

@property (nonatomic, copy, readonly) NSString* cacheFile;

@end

@implementation TCRMLogCache

/**
 添加日志缓存
 
 @param logActionDic crm日志
 */
- (void)add:(NSDictionary *)logActionDic {
    
    NSString* value = [TCRMTools tcrm_dicToJson:logActionDic];
    if (value.length == 0) {
        return;
    }
    
    NSTimeInterval date = [[NSDate date] timeIntervalSince1970];
    NSString* key = [NSString stringWithFormat:@"%f",date];
    NSMutableDictionary* toSaveDic =[NSMutableDictionary dictionaryWithDictionary:[self cacheLogList]];
    [toSaveDic setObject:value forKey:key];
    BOOL result = [toSaveDic writeToFile:self.cacheFile atomically:YES];
    
    if (result) {
        NSLog(@"TCRM日志缓存成功");
    } else {
        NSLog(@"TCRM日志缓存失败");
    }
}


/**
 获取缓存列表
 
 @return 缓存列表
 */
- (NSDictionary *)cacheLogList {
     NSDictionary *cacheDic = [NSDictionary dictionaryWithContentsOfFile:self.cacheFile];
    return cacheDic;
}


/**
 删除一条缓存
 
 @param cacheId 缓存id
 */
- (void)removeCache:(NSString *)cacheId {
    NSMutableDictionary *cacheDic = [NSMutableDictionary dictionaryWithContentsOfFile:self.cacheFile];
    [cacheDic removeObjectForKey:cacheId];
    [cacheDic writeToFile:self.cacheFile atomically:YES];
}

- (NSString *)cacheFile {
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = paths.firstObject;
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:TCRMCachePath];
    return filename;
}

@end

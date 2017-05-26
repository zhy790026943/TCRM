//
//  TCRMLogCache.h
//  TCrm
//
//  Created by baidu on 2017/5/19.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCRMBaseAction.h"

/**
 日志上传前，暂存缓存
 */
@protocol TCRMLogCacheProtocol <NSObject>

/**
 添加日志缓存

 @param logActionDic crm日志
 */
- (void)add:(NSDictionary *)logActionDic;


/**
 获取缓存列表

 @return 缓存列表
 */
- (NSDictionary *)cacheLogList;


/**
 删除一条缓存

 @param cacheId 缓存id
 */
- (void)removeCache:(NSString *)cacheId;

@end



@interface TCRMLogCache : NSObject<TCRMLogCacheProtocol>



@end

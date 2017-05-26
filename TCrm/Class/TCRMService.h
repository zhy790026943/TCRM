//
//  TCRMService.h
//  TCrm
//
//  Created by baidu on 2017/5/17.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCRMLogCache.h"
#import "TCRMHttpService.h"

@interface TCRMService : NSObject

@property (nonatomic ,strong)TCRMLogCache* cache;

+ (instancetype)sharedInstance;

//启动CRM
+ (void)setupTCRMServiceWithURL:(NSString *)crmUrl;

//发送CRM日志
+ (void)sendCRMWithModel:(NSDictionary *)crmDictionary;


@end

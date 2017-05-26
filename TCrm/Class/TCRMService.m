//
//  TCRMService.m
//  TCrm
//
//  Created by baidu on 2017/5/17.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "TCRMService.h"
#import "TCRMTools.h"

@interface TCRMService ()

@end

@implementation TCRMService

- (instancetype)init {
    if (self = [super init]) {
        self.cache = [TCRMLogCache new];
    }
    return self;
}

#pragma mark - Public

//启动CRM
+ (void)setupTCRMServiceWithURL:(NSString *)crmUrl {
    [TCRMHttpService sharedInstance].crmURL = crmUrl;
}

//发送CRM日志
+ (void)sendCRMWithModel:(NSDictionary *)crmDictionary {
    [[TCRMService sharedInstance].cache add:crmDictionary];
    
    NSDictionary* allCache = [[TCRMService sharedInstance].cache cacheLogList];
    for (NSString* key in allCache.allKeys) {
        NSString* value = [allCache valueForKey:key];
        NSDictionary* params = [TCRMTools tcrm_jsonToDic:value];
        if (params) {
            [[TCRMHttpService sharedInstance] sendCrmLog:key params:params completeBlock:^(NSString *key, NSError *error) {
                if (!error) {
                    [[TCRMService sharedInstance].cache removeCache:key];
                }
            }];
        } else {
            [[TCRMService sharedInstance].cache removeCache:key];
        }
        
    }
}

#pragma mark - Private
static id _tcrmInstance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tcrmInstance = [super allocWithZone:zone];
    });
    return _tcrmInstance;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tcrmInstance = [[self alloc] init];
    });
    return _tcrmInstance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _tcrmInstance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _tcrmInstance;
}


@end

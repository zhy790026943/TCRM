//
//  TCRMHttpService.h
//  TCrm
//
//  Created by baidu on 2017/5/17.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TCRMModelBlock) (NSString* key, NSError* error);

@interface TCRMHttpService : NSObject

@property (nonatomic, copy) NSString* crmURL;


+ (instancetype)sharedInstance;


- (void)sendCrmLog:(NSString *)key
            params:(NSDictionary *)params
     completeBlock:(TCRMModelBlock)block;

@end

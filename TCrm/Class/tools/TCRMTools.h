//
//  TCRMTools.h
//  TCrm
//
//  Created by baidu on 2017/5/25.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCRMTools : NSObject

+ (NSString *)tcrm_dicToJson:(NSDictionary *)dictionary;

+ (NSDictionary *)tcrm_jsonToDic:(NSString *)jsonString;

@end

//
//  TCRMBaseAction.h
//  TCrm
//
//  Created by baidu on 2017/5/19.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol TCRMBaseProtocol <NSObject>

@required

@property (nonatomic, copy) NSString* cacheId;

/**
 业务ID

 @return 业务ID
 */
- (NSString *)actionId;


/**
 获取当前业务参数

 @return 业务参数
 */
- (NSDictionary *)getValidItems;


/**
 转换为json String

 @return json
 */
- (NSString *)toJsonString;


/**
 转换为参数字典

 @param jsonString json
 */
- (void)parseData:(NSString *)jsonString;


@end


@interface TCRMBaseAction : NSObject<TCRMBaseProtocol>

@property (nonatomic, strong) NSDictionary* actionParams;

@end

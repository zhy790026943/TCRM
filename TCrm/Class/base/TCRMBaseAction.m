//
//  TCRMBaseAction.m
//  TCrm
//
//  Created by baidu on 2017/5/19.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "TCRMBaseAction.h"

@interface TCRMBaseAction ()

@end

@implementation TCRMBaseAction

//ActionID
- (NSString *)actionId {
    return @"";
}

/**
 获取字典参数

 @return 字典
 */
- (NSDictionary *)getValidItems {
    return self.actionParams;
}


/**
 将字典转换为网络上传参数

 @return 参数
 */
- (NSString *)toJsonString {
    
    return @"";
}


/**
 解析json字符串

 @param jsonString json
 */
- (void)parseData:(NSString *)jsonString {
    
}



@end

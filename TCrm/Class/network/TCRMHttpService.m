//
//  TCRMHttpService.m
//  TCrm
//
//  Created by baidu on 2017/5/17.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "TCRMHttpService.h"
#import "TCRMHttpRequestSerialization.h"

@interface TCRMHttpService ()<NSURLSessionDelegate>

@end

@implementation TCRMHttpService

- (void)sendCrmLog:(NSString *)key params:(NSDictionary *)params completeBlock:(TCRMModelBlock)block {
    
    NSString* theKey = [key mutableCopy];
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSError* error = nil;
    TCRMHttpRequestSerialization* serialization = [TCRMHttpRequestSerialization new];
    NSMutableURLRequest *request = [serialization requestWithMethod:@"get" URLString:self.crmURL parameters:params error:&error];
    
    NSURLSessionTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (block) {
            block(theKey,error);
        }
    }];
    
    [task resume];
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

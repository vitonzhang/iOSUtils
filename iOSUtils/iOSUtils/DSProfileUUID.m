//
//  DSProfileUUID.m
//  iOSUtils
//
//  Created by zhangchong on 15-2-4.
//  Copyright (c) 2015年 vitonzhang. All rights reserved.
//

#import "DSProfileUUID.h"
#import <dispatch/dispatch.h>

static DSProfileUUID * defaultInstance = nil;
static NSString * DSProfileUUIDIdentityKey = @"DSProfileUUIDIdentityKey";

@interface DSProfileUUID ()
{
    long long _currentUUID;
}
@end


@implementation DSProfileUUID

+ (instancetype)defaultProfileUUID
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultInstance = [[self alloc] init];
    });
    
    return defaultInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentUUID = [self p__readUUID];
    }
    return self;
}

- (NSNumber *)uuid
{
    _currentUUID++;
    if ( _currentUUID + 5 >= LONG_LONG_MAX ) {
        _currentUUID = 0;
    }
    return [NSNumber numberWithLongLong:_currentUUID];
}

- (void)saveUUID
{
    [self p__writeUUID:_currentUUID];
}

#pragma mark - Private Method
- (long long)p__readUUID
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber * value = [userDefaults objectForKey:DSProfileUUIDIdentityKey];
    if (value) {
        return [value longLongValue];
    } else {
        return 0;
    }
}

- (void)p__writeUUID:(long long)uuid
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber * value = [NSNumber numberWithLongLong:uuid];
    [userDefaults setObject:value forKey:DSProfileUUIDIdentityKey];
    [userDefaults synchronize];
}

@end

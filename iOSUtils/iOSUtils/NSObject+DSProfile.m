//
//  NSObject+DSProfile.m
//  iOSUtils
//
//  Created by zhangchong on 15-2-4.
//  Copyright (c) 2015年 vitonzhang. All rights reserved.
//

#import "NSObject+DSProfile.h"
#import <objc/runtime.h>

static const void *DSProfileId = &DSProfileId;

@implementation NSObject (DSProfile)

- (NSNumber *)profileId
{
    NSNumber * value = (NSNumber *)objc_getAssociatedObject(self, DSProfileId);
    return value;
}

- (void)setProfileId:(NSNumber *)profileId
{
    objc_setAssociatedObject(self, DSProfileId, profileId, OBJC_ASSOCIATION_RETAIN);
}

@end

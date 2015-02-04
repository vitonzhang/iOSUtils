//
//  DSProfileUUID.h
//  iOSUtils
//
//  Created by zhangchong on 15-2-4.
//  Copyright (c) 2015年 vitonzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSProfileUUID : NSObject

+ (instancetype)defaultProfileUUID;

- (NSNumber *)uuid;

- (void)saveUUID;

@end

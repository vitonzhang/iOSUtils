//
//  NSObject+DSProfile.h
//  iOSUtils
//
//  Created by zhangchong on 15-2-4.
//  Copyright (c) 2015年 vitonzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __DSPROFILE__

#define DSPROFILE(object, profileId)  \
    do { \
        [object setProfileId:profileId]; \
    } while (false)

#else

#define DSPROFILE(object, profileId)

#endif

@interface NSObject (DSProfile)

@property (nonatomic, strong) NSNumber * profileId;

@end

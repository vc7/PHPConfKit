//
//  PCKit.m
//  PHPConfKit
//
//  Created by vincent on 2014/08/25.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import "PCKit.h"

@implementation PCKit

static NSString *appId;

/*!
 Sets the applicationId and clientKey of your application.
 @param applicationId The application id for your Parse application.
 */
+ (void)setApplicationId:(NSString *)applicationId
{
    @synchronized(self) {
        appId = applicationId;
    }
}
+ (NSString *)getApplicationId
{
    @synchronized(self) {
        return appId;
    }
}

@end

//
//  PCKit.m
//  PHPConfKit
//
//  Created by vincent on 2014/08/25.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import "PCKit.h"
#import "PCKDataSpecProtocol.h"

@implementation PCKit

static NSString *applicationId;
static id <PCKDataSpec> dataSpec;

+ (void)setApplicationId:(NSString *)anApplicationId dataSpec:(id <PCKDataSpec>)aDataSpec
{
    @synchronized(self) {
        applicationId = anApplicationId;
        dataSpec = aDataSpec;
    }
}

+ (NSString *)getApplicationId
{
    @synchronized(self) {
        return applicationId;
    }
}

+ (id <PCKDataSpec>)getDataSpec
{
    @synchronized(self) {
        return dataSpec;
    }
}

@end

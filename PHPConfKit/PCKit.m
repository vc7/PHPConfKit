//
//  PCKit.m
//  PHPConfKit
//
//  Created by vincent on 2014/08/25.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import "PCKit.h"
#import "PCKDataSpecProtocol.h"

#import "CoreData+MagicalRecord.h"

static NSString *const kPCKDataStoreNamed = @"kPCKDataStoreNamed";

@implementation PCKit

static NSString *applicationId;
static id <PCKDataSpec> dataSpec;

+ (void)setApplicationId:(NSString *)anApplicationId dataSpec:(id <PCKDataSpec>)aDataSpec
{
    @synchronized(self) {
        
        if (anApplicationId) {
            applicationId = anApplicationId;
        } else {
            @throw [NSException exceptionWithName:@"PCKitApplicationIdNilException"
                                           reason:@"You shoud not set required application id to nil" userInfo:nil];
        }
        
        if (aDataSpec) {
            dataSpec = aDataSpec;
        } else {
            @throw [NSException exceptionWithName:@"PCKitDataSpecNilException"
                                           reason:@"You shoud not set required data spec to nil" userInfo:nil];
        }
        
        //!!!: Initialize MagicRecord
        [MagicalRecord setupCoreDataStackWithStoreNamed:kPCKDataStoreNamed];
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

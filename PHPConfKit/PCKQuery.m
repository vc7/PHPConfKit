//
//  PCKQuery.m
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import "PCKQuery.h"

@implementation PCKQuery

#pragma mark - PCKQuery convenient initializers

+ (instancetype)query
{
    PCKQuery *query = [[PCKQuery alloc] init];
    
    return query;
}

+ (instancetype)queryWithEntityName:(NSString *)entityName
{
    PCKQuery *query = [[PCKQuery alloc] init];
    query.entityName = entityName;
    
    return query;
}

@end

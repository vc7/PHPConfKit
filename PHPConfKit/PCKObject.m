//
//  PCKObject.m
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import "PCKObject.h"

@implementation PCKObject

+ (PCKQuery *)query
{
    return [PCKQuery queryWithEntityName:[self entityName]];
}

@end

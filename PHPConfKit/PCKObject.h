//
//  PCKObject.h
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SSDataKit/SSDataKit.h>
#import "PCKQuery.h"

@interface PCKObject : SSManagedObject

/*! Return a query instance with model object's entity name by default */
+ (PCKQuery *)query;

@end

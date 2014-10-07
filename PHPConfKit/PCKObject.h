//
//  PCKObject.h
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCKQuery.h"
#import "CoreData+MagicalRecord.h"

@interface PCKObject : NSManagedObject

+ (NSString *)entityName;

/*! Return a query instance with model object's entity name by default */
+ (PCKQuery *)query;

@end

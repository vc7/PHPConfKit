//
//  PCKQuery.h
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCKQuery : NSObject

/*! Return a new instance of PCKQuery. */
+ (instancetype)query;
/*! Return a new instance of PCKQuery with given entity name. */
+ (instancetype)queryWithEntityName:(NSString *)entityName;

@property (nonatomic, strong) NSString *entityName;

@end

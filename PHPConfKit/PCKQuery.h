//
//  PCKQuery.h
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCKObject;

typedef void (^PCKObjectResultBlock)(PCKObject *object, NSError *error);
typedef void (^PCKArrayResultBlock)(NSArray *array, NSError *error);

@interface PCKQuery : NSObject

/*! Return a new instance of PCKQuery. */
+ (instancetype)query;
/*! Return a new instance of PCKQuery with given entity name. */
+ (instancetype)queryWithEntityName:(NSString *)entityName;

@property (nonatomic, strong) NSString *entityName;

- (PCKObject *)getFirstObject;
- (void)getFirstObjectWithBlock:(PCKObjectResultBlock)block;

- (NSArray *)findAll;
- (void)findAllWithBlock:(PCKArrayResultBlock)block;

- (NSArray *)findObjects;
- (void)findObjectsInBackgroundWithBlock:(PCKArrayResultBlock)block;

@end

//
//  NSArray+Enumeration.h
//  arrayBlocks
//
//  Created by Gan Chau on 8/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Enumeration)

- (NSArray *)mapWithBlock:(id (^)(id object))operation;
- (NSArray *)selectWithBlock:(BOOL (^)(id object))predicate;

@end

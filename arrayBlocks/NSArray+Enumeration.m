//
//  NSArray+Enumeration.m
//  arrayBlocks
//
//  Created by Gan Chau on 8/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "NSArray+Enumeration.h"

@implementation NSArray (Enumeration)

- (NSArray *)mapWithBlock:(id (^)(id))operation
{
    NSMutableArray *newArray = [@[] mutableCopy];
    
    for (id obj in self) {
        [newArray addObject:operation(obj)];
    }
    
    return newArray;
}

- (NSArray *)selectWithBlock:(BOOL (^)(id))predicate
{
    NSMutableArray *newArray = [@[] mutableCopy];
    
    for (id obj in self) {
        if (predicate(obj)) {
            [newArray addObject:obj];
        }
    }
    
    return newArray;
}

@end

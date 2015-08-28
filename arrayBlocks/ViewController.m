//
//  ViewController.m
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Enumeration.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *testArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTestArray];
    [self appleTestBlocks];
    [self myMethodsWithBlocks];
}

- (void)setupTestArray
{
    self.testArray = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @100];
}

- (void)appleTestBlocks
{
    // enumerate through each object in array and add 1 to it
    [self.testArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSNumber *plusOne = @([(NSNumber *)obj integerValue] + 1);
        NSLog(@"Result of enumerateObjectsUsingBlock: %@", plusOne);
    }];
    
    // create a predicate of objects that are even numbers
    NSPredicate *evenPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [(NSNumber *)evaluatedObject integerValue] % 2 == 0;
    }];
    
    NSArray *filteredTestArray = [self.testArray filteredArrayUsingPredicate:evenPredicate];
    NSLog(@"Result of predicateWithBlock + filteredArrayUsingPredicate: %@", filteredTestArray);
}

- (void)myMethodsWithBlocks
{
    NSArray *plusOneArray = [self.testArray mapWithBlock:^id(id object) {
        return @([object integerValue] + 1);
    }];
    
    NSArray *evenNumberArray = [self.testArray selectWithBlock:^BOOL(id object) {
        return ([object integerValue] % 2 == 0);
    }];
    
    NSLog(@"Result of mapWithBlock: %@", plusOneArray);
    NSLog(@"Result of selectWithBlock: %@", evenNumberArray);
}

@end
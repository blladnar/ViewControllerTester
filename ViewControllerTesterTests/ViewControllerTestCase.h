//
//  ViewControllerTestCase.h
//  ViewControllerTester
//
//  Created by Randall Brown on 12/10/16.
//  Copyright © 2016 Randall Brown. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ViewControllerTestCase : XCTestCase
@property (nonatomic, strong) NSMutableArray *tests;

-(void)spec;
@end

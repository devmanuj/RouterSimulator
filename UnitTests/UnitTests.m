//
//  UnitTests.m
//  UnitTests
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "UnitTests.h"
#import "IpAddress.h"

@implementation UnitTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}



- (void)testIpAddress
{
    NSString *address = @"192.168.0.1";
    
    IpAddress *ipAddress = [[IpAddress alloc] initWithString:address];
    
    
    STFail(@"Unit tests are not implemented yet in UnitTests");

    STAssertEquals(@"q", @"w", @"We expected 192 but it's been initialized as ",@"q",@"w");
    
    
}


@end

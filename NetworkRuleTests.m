//
//  NetworkRuleTests.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "NetworkRule.h"
#import "IpAddress.h"
#import <SenTestingKit/SenTestingKit.h>

@interface NetworkRuleTests : SenTestCase

@end

@implementation NetworkRuleTests

- (void)setUp
{
    NSLog(@"\n\n");
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testNetworkRule
{
    NetworkRule *rule = [[NetworkRule alloc] initWithString:@"10.0.0.0 255.255.255.0 192.168.1.1"];
    
    IpAddress *expectedNetworkAddres = [[IpAddress alloc] initWithString:@"10.0.0.0"];
    IpAddress *expectedSubnetAddres = [[IpAddress alloc] initWithString:@"255.255.255.0"];
    IpAddress *expectedDestinationAddress = [[IpAddress alloc] initWithString:@"192.168.1.1"];

    
    STAssertEqualObjects(expectedNetworkAddres, rule.networkAddress, @"We expected network address to be %@ but it's been initialized as %@",expectedNetworkAddres.ipAddress, rule.networkAddress);
    
    STAssertEqualObjects(expectedSubnetAddres, rule.subnetMask, @"We expected subnet address to be %@ but it's been initialized as %@",expectedSubnetAddres.ipAddress, rule.subnetMask);
    
    STAssertEqualObjects(expectedDestinationAddress, rule.destinationMachineAddress, @"We expected destination address to be %@ but it's been initialized as %@",expectedDestinationAddress.ipAddress, rule.destinationMachineAddress);
}


@end

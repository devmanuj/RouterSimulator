//
//  IpAddressTest.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import "IpAddress.h"
#import "NetworkRule.h"
#import <SenTestingKit/SenTestingKit.h>

@interface IpAddressTest : SenTestCase

@end

@implementation IpAddressTest

- (void)setUp
{
    [super setUp];
    NSLog(@"\n\n");
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)testIpAddress
{
    NSString *address = @"192.168.0.1";
    
    IpAddress *ipAddress = [[IpAddress alloc] initWithString:address];
    
    unsigned char expectedFirstOctet = 192;
    unsigned char expectedSecondOctet = 168;
    unsigned char expectedThirdOctet = 0;
    unsigned char expectedFourthOctet = 1;
    
    STAssertEquals(expectedFirstOctet, ipAddress.firstOctet, @"We expected First Octet in IP to be %d but it's been initialized as %d",expectedFirstOctet,ipAddress.firstOctet);
    STAssertEquals(expectedSecondOctet, ipAddress.secondOctet, @"We expected Second Octet in IP to be %d but it's been initialized as %d",expectedSecondOctet,ipAddress.secondOctet);
    STAssertEquals(expectedThirdOctet, ipAddress.thirdOctet, @"We expected Third Octet in IP to be %d but it's been initialized as %d",expectedThirdOctet,ipAddress.thirdOctet);
    STAssertEquals(expectedFourthOctet, ipAddress.fourthOctet, @"We expected Fourth Octet in IP to be %d but it's been initialized as %d",expectedFourthOctet,ipAddress.fourthOctet);
}

-(void)testAddressFollowsNetworkRule
{
    NetworkRule *rule = [[NetworkRule alloc] initWithString:@"10.0.0.0 255.255.255.0 192.168.1.1"];
    IpAddress *packetAddress = [[IpAddress alloc] initWithString:@"10.0.0.2"];
        
    STAssertTrue([packetAddress matchesRules:rule], @"\n\nMatching Error !! As per routing rule packet for network address %@ should be sent to %@",packetAddress.ipAddress, rule.destinationMachineAddress.ipAddress);
    
    packetAddress = [[IpAddress alloc] initWithString:@"10.1.1.2"];
    
    
    STAssertFalse([packetAddress matchesRules:rule], @"\n\nMatching Error !! As per routing rule packet for network address %@ cannot be sent to this address",packetAddress.ipAddress, rule.destinationMachineAddress.ipAddress);
}



@end

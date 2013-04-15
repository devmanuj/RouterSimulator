//
//  RouterTests.m
//  RouterSimulator
//
//  Created by Manuj Porwal on 04/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Router.h"
#import "NetworkRule.h"
#import "IpAddress.h"

NSString * const kError;

@interface RouterTests : SenTestCase

@end

@interface Router()

@property(nonatomic, strong) NSMutableArray *rules;
@property(nonatomic, strong) IpAddress *defaultgateway;

-(IpAddress *)calulateDestinationAddress:(IpAddress *)route Error:(NSError **)error;

@end

@implementation RouterTests

- (void)setUp
{
    NSLog(@"\n\n");
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testDestinationAddressCalculation
{
    Router *router = [[Router alloc] init];
    
    router.rules = [NSMutableArray array];
    
    NetworkRule *rule = [[NetworkRule alloc] initWithString:@"10.0.0.0 255.255.255.0 192.168.1.1"];
    [router.rules addObject:rule];
    
    NSError *error;

    IpAddress *destinationAddress = [router calulateDestinationAddress:[[IpAddress alloc] initWithString:@"10.0.0.2"] Error:&error];
        
    STAssertEqualObjects(rule.destinationMachineAddress, destinationAddress, @"We expected network address to be %@ but it's been calculated as %@",rule.destinationMachineAddress.ipAddress,destinationAddress.ipAddress);
    
    destinationAddress = [router calulateDestinationAddress:[[IpAddress alloc] initWithString:@"10.1.1.2"] Error:&error];

    STAssertEqualObjects([[error userInfo] objectForKey:kError],@"NO ROUTE DEFINED" , @"Expected was a warning that 'No Route Defined' but the response is %@",error.localizedDescription);
    
    router.defaultgateway = [[IpAddress alloc] initWithString:@"192.168.1.3"];
    
    destinationAddress = [router calulateDestinationAddress:[[IpAddress alloc] initWithString:@"10.1.1.2"] Error:&error];
    
    STAssertEqualObjects(router.defaultgateway, destinationAddress, @"We expected network address to be %@ but it's been calculated as %@",router.defaultgateway.ipAddress,destinationAddress.ipAddress);
}


@end

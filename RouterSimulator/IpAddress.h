//
//  IpAddress.h
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkRule;

@interface IpAddress : NSObject

@property(readonly, nonatomic, assign) unsigned char firstOctet;
@property(readonly, nonatomic, assign) unsigned char secondOctet;
@property(readonly, nonatomic, assign) unsigned char thirdOctet;
@property(readonly, nonatomic, assign) unsigned char fourthOctet;
@property(readonly, nonatomic, strong) NSString *ipAddress;

-(id)initWithString:(NSString *)ipAddressString;
-(BOOL)isEqual:(NSString *)anotherIpAddress;
-(BOOL)matchesRules:(NetworkRule *)rule;

@end

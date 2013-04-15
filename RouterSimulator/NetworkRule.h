//
//  NetworkRule.h
//  RouterSimulator
//
//  Created by Manuj Porwal on 03/03/13.
//  Copyright (c) 2013 Manuj Porwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IpAddress.h"



@interface NetworkRule : NSObject

@property(readonly, nonatomic, strong) IpAddress *networkAddress;
@property(readonly, nonatomic, strong) IpAddress *subnetMask;
@property(readonly, nonatomic, strong) IpAddress *destinationMachineAddress;

-(id)initWithString:(NSString *)ruleString;

@end

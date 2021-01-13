//
//  RudderAppCenterFactory.m
//  Pods-Rudder-AppCenter_Example
//
//  Created by Ruchira Moitra on 12/01/21.
//

#import "RudderAppCenterFactory.h"
#import "RudderAppCenterIntegration.h"

@implementation RudderAppCenterFactory

static RudderAppCenterFactory *sharedInstance;

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (nonnull NSString *)key {
    return @"AppCenter";
}

-(id<RSIntegration>)initiate:(NSDictionary *)config client:(RSClient *)client rudderConfig:(RSConfig *)rudderConfig{
    [RSLogger logDebug:@"Creating RudderIntegrationFactory: AppCenter"];
    return [[RudderAppCenterIntegration alloc] initWithConfig:config
                                                withAnalytics:client
                                             withRudderConfig:rudderConfig];
}
@end

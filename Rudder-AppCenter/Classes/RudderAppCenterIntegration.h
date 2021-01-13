//
//  RudderAppCenterIntegration.h
//  Pods-Rudder-AppCenter_Example
//
//  Created by Ruchira Moitra on 12/01/21.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>

NS_ASSUME_NONNULL_BEGIN

@interface RudderAppCenterIntegration : NSObject<RSIntegration>

@property (nonatomic) BOOL sendEvents;
@property (nonatomic) NSString *transmissionLevel;
@property (nonatomic) NSArray *eventPriorityMap;

-(instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client withRudderConfig:(RSConfig*) rudderCinfig;

@end

NS_ASSUME_NONNULL_END

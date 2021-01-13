//
//  RudderAppCenterIntegration.m
//  Pods-Rudder-AppCenter_Example
//
//  Created by Ruchira Moitra on 12/01/21.
//

#import "RudderAppCenterIntegration.h"
#import <Rudder/Rudder.h>
@import AppCenter;
@import AppCenterAnalytics;
@import AppCenterCrashes;
@implementation RudderAppCenterIntegration

#pragma mark - Initialization

- (instancetype) initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client withRudderConfig:(RSConfig *)rudderCinfig {
    self = [super init];
    if (self) {
        [RSLogger logDebug:@"Initializing AppCenter SDK"];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.transmissionLevel = [config objectForKey:@"transmissionLevel"];
            self.eventPriorityMap = [config objectForKey:@"eventPriorityMap"];
#ifdef __DEVICE__
                             [MSACAppCenter start:[config objectForKey:@"appSecret"] withServices:@[
                             [MSACAnalytics class]
                             ]];
#endif
            
        });
    }
    return self;
}

- (void) dump:(RSMessage *)message {
    @try {
        if (message != nil) {
            dispatch_async(dispatch_get_main_queue(),^{
                [self processRudderEvent:message];
            });
        }
    } @catch (NSException *ex) {
        [RSLogger logError:[[NSString alloc] initWithFormat:@"%@", ex]];
        }
    }
- (void) processRudderEvent: (nonnull RSMessage *) message {
    NSString *type = message.type;
    if([type isEqualToString:@"track"]){
        // do for track
        //need to check how events priority map is coming and then write the logic
#ifdef __DEVICE__
        NSString *event = message.event;
        NSDictionary *properties = message.properties;
        if( properties != nil ){
            [MSACAnalytics trackEvent:event withProperties:properties];
        }
        if(self.transmissionLevel != nil){
            [MSACAnalytics setTransmissionInterval:60*[self.transmissionLevel integerValue]];
        }
#endif
        
    }else if ([type isEqualToString:@"screen"]){
        // do for page
    }else {
        [RSLogger logDebug:@"AppCenter Integration: Message type not supported"];
    }
    
}
@end

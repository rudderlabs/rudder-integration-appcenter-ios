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
            NSLog(@"Check config");
            [RSLogger logDebug:[[NSString alloc] initWithFormat:@"%@", [config objectForKey:@"appSecret"]]];
            self.transmissionLevel = [config objectForKey:@"transmissionLevel"];
            if(![self.transmissionLevel isEqualToString: @""]){
                NSLog(@"inside transmission level");
                [RSLogger logDebug:[[NSString alloc] initWithFormat:@"%ld", 60*[self.transmissionLevel integerValue]]];
                [MSACAnalytics setTransmissionInterval:60*[self.transmissionLevel integerValue]];
            }
            self.eventPriorityMap = [config objectForKey:@"eventPriorityMap"];
            [MSACAppCenter start:[config objectForKey:@"appSecret"] withServices:@[
                [MSACAnalytics class]
            ]];
            
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

- (void)reset {
    [RSLogger logDebug:@"Inside reset"];
}

- (void) processRudderEvent: (nonnull RSMessage *) message {
    NSString *type = message.type;
    if([type isEqualToString:@"track"]){
        [RSLogger logDebug:@"Inside track"];
        // do for track
        NSDictionary *eventPriorityHashMap = nil;
        if(self.eventPriorityMap != nil){
            eventPriorityHashMap = [NSDictionary dictionaryWithObjects:[self.eventPriorityMap valueForKey:@"to"]
                                                               forKeys:[self.eventPriorityMap valueForKey:@"from"]];
        }
        NSString *event = message.event;
        NSDictionary *properties = message.properties;
        NSLog(@"Check config");
        [RSLogger logDebug:[[NSString alloc] initWithFormat:@"%@", properties]];
        if(eventPriorityHashMap != nil && [eventPriorityHashMap objectForKey:event] != nil){
            if([[eventPriorityHashMap valueForKey:event]isEqualToString:@"Normal"])
                [MSACAnalytics trackEvent:event withProperties:properties flags:MSACFlagsNormal];
            else if ([[eventPriorityHashMap valueForKey:event]isEqualToString:@"Critical"])
                [MSACAnalytics trackEvent:event withProperties:properties flags:MSACFlagsCritical];
        }else{
            [MSACAnalytics trackEvent:event withProperties:properties];
        }
    }else if ([type isEqualToString:@"screen"]){
        // do for page
        //   NSString *name = message.name;
        NSDictionary *properties = message.properties;
        NSString *eventName = [NSString stringWithFormat: @"Viewed %@", [properties objectForKey:@"name"]];
        if(properties!= nil)
            [MSACAnalytics trackEvent:eventName withProperties:properties];
        
    }else {
        [RSLogger logDebug:@"AppCenter Integration: Message type not supported"];
    }
    
}


@end

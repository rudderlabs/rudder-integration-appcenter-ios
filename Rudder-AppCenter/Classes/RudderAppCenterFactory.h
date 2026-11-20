//
//  RudderAppCenterFactory.h
//  Pods-Rudder-AppCenter_Example
//
//  Created by Ruchira Moitra on 12/01/21.
//

#import <Foundation/Foundation.h>
#if defined(__has_include) && __has_include(<Rudder/Rudder.h>)
#import <Rudder/Rudder.h>
#else
#import "Rudder.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RudderAppCenterFactory : NSObject<RSIntegrationFactory>
+ (instancetype) instance;

@end

NS_ASSUME_NONNULL_END

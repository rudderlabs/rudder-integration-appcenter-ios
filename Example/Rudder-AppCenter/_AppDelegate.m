//
//  _AppDelegate.m
//  Rudder-AppCenter
//
//  Created by Ruchira on 01/12/2021.
//  Copyright (c) 2021 Ruchira. All rights reserved.
//

#import "_AppDelegate.h"
#import <Rudder/Rudder.h>
#import <RudderAppCenterFactory.h>
#import <CoreLocation/CoreLocation.h>

@interface _AppDelegate () <CLLocationManagerDelegate>
@property(nonatomic) CLLocationManager *locationManager;
@end

@implementation _AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSString *WRITE_KEY = @"1n4UdzGfTIEV7rOux0bl9IpPaok";
    //   NSString *DATA_PLANE_URL = @"https://8e50d3caecbe.ngrok.io";
    
    RSConfigBuilder *configBuilder = [[RSConfigBuilder alloc] init];
    //  [configBuilder withDataPlaneUrl:DATA_PLANE_URL];
    [configBuilder withControlPlaneUrl:@"https://87d77a187bed.ngrok.io"];
    [configBuilder withLoglevel:RSLogLevelDebug];
    [configBuilder withFactory:[RudderAppCenterFactory instance]];
    // [configBuilder withTrackLifecycleEvens:false];
    [RSClient getInstance:WRITE_KEY config:[configBuilder build]];
    
    
    
    //   [[RSClient sharedInstance] reset];
//        [[RSClient sharedInstance] identify: @"test_user_id_ios_2"
//                                     traits: @{
//                                         @"foo": @"bar",
//                                         @"foo1": @"bar1",
//                                         @"email": @"test_2@gmail.com"
//                                     }
//         ];
    [[RSClient sharedInstance] track:@"ruchira event 2"
                           properties:@{@"name": @"screen2",
                                        @"new propert": @1
                           }];
//    [[RSClient sharedInstance] track:@"abc1"];
//    [[RSClient sharedInstance] screen:@"screen3"];
//    [[RSClient sharedInstance] track:@"test with nested 1"
//                          properties:@{@"prop1": @"value1",
//                                       @"prop2": @{@"prop2-1":@"value2-1",
//                                                   @"prop2-2":@"value2-2"
//                                       }
//                          }];
    //    [[RSClient sharedInstance] track:@"test track"
    //                          properties:@{@"prop1": @"value1"}];
//        [[RSClient sharedInstance] screen:@"screen2"
//                               properties:@{@"name": @"screen2",
//                                            @"new propert": @"prop val 1"
//                               }];
//    [[RSClient sharedInstance] track:@"QWERTY"
//                           properties:@{@"name": @"screen2",
//                                        @"new propert": @"prop val 1"
//                           }];
    
    //    [[RSClient sharedInstance]  alias:@"newId"];
    
    //    [[RSClient sharedInstance] identify:@"666"
    //                                     traits:@{@"name": @"abc Mazumder",
    //                                              @"firstname": @"abc",
    //                                              @"lastname": @"Mazumder",
    //                                              @"email": @"nirab@gmail.com",
    //                                              @"city": @"Delhi",
    //                                              @"country" : @"India",
    //                                              @"gender" : @"Male"
    //                                     }
    //        ];
//    [[RSClient sharedInstance] reset];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

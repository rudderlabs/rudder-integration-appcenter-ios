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
    
   //TC: 1. Sending simple track call with event name
    [[RSClient sharedInstance] identify: @"User_111"
                                         traits: @{
                                             @"name": @"Manashi",
                                             @"city": @"Kolkata",
                                             @"email": @"manashi@gmail.com"
                                         }
             ];
    [[RSClient sharedInstance] track:@"Songs Viewed"];


    //Tc: 2. Sending simple track call with event name and properties

    [[RSClient sharedInstance] track:@"Video Clicked"
    properties:@{@"name": @"carryminati",
                 @"platform": @"youtube"
    }];
    
    //Tc: 3. Sending track call with event name and properties by setting the priority as "Critical"

    [[RSClient sharedInstance] track:@"Purchase"
                               properties:@{@"details": @"pant"
                               }];
            [[RSClient sharedInstance] track:@"Simple track call"];


    //Tc: 4. Sending track call with event name and properties by setting the priority as "Normal"

    [[RSClient sharedInstance] track:@"Purchase 1"
                               properties:@{@"details": @"pant"
                               }];
            [[RSClient sharedInstance] track:@"Simple track call 1"];
    
    
    //Tc: 5. Sending 5 track call, some with "Normal" priority and some with "Critical" priority and by giving some value to "Transmission Interval"

        [[RSClient sharedInstance] track:@"Bloo Normal Event 1"];
        [[RSClient sharedInstance] track:@"Bloo Critical Event 1"];
        [[RSClient sharedInstance] track:@"Bloo Normal Event 2"];
        [[RSClient sharedInstance] track:@"Bloo Critical Event 2"];
        [[RSClient sharedInstance] track:@"Bloo Critical Event 3"];
        [[RSClient sharedInstance] track:@"Bloo Normal Event 3"];
    
    //Tc: 6. Sending track call with event name and in properties some key/value length longer than 125 characters.

    //Key:

     [[RSClient sharedInstance] track:@"Too long key"
                               properties:@{@"mbkdbakckdbkcbandcandcndncdbakcbdbcbdkjbcldncln kdnkcnnlkcdnlkcndnckndncldnlcnldnckdnclnncndlclndcndncdnjkcdkncknsdkhcshdcnndvkkvnsnv": @"value",
                                            @"details": @"its should be truncated"
                               }];


    //Value:

    [[RSClient sharedInstance] track:@"Too long Value"
                               properties:@{@"Key": @"mbkdbakckdbkcbandcandcndncdbakcbdbcbdkjbcldncln kdnkcnnlkcdnlkcndnckndncldnlcnldnckdnclnncndlclndcndncdnjkcdkncknsdkhcshdcnndvkkvnsnv",
                                            @"details": @"its should be truncated"
                               }];


    //Tc: 7. Sending track call with event name length longer than 256 characters.

    [[RSClient sharedInstance] track:@"kbkdbakckdbkcbandcandcndncdbakcbdbcbdkjbcldncln kdnkcnnlkcdnlkcndnckndncldnlcnldnckdnclnncndlclndcndncdnjkcdkncknsdkhcshdcnndvkkvnsnvhkjbdckadkjhvcjkdbcbdb kjsdhvdvs,mbvkjsfkvbsbvdbvzjksklfbvmnfdlavjvsbdvmmfsnvkhfdvfgweiohgjkvbjkhrivnkvbdsjvvbnvlhfvnfbvjkhvfbv"
                               properties:@{@"Key": @"mbkdbakckdbkcbandcandcndncdbakcbdbcbdkjbcldncln kdnkcnnlkcdnlkcndnckndncldnlcnldnckdnclnncndlclndcndncdnjkcdkncknsdkhcshdcnndvkkvnsnv",
                                            @"details": @"its should be truncated"
                               }];


    //Tc: 8. Sending track call with event name and in properties more than 20 key:value pair

     [[RSClient sharedInstance] track:@"manadbakckdbkcbandcandcndncdbakcbdbcbdkjbcldncln kdnkcnnlkcdnlkcndnckndncldnlcnldnckdnclnncndlclndcndncdnjkcdkncknsdkhcshdcnndvkkvnsnvhkjbdckadkjhvcjkdbcbdb kjsdhvdvs,mbvkjsfkvbsbvdbvzjksklfbvmnfdlavjvsbdvmmfsnvkhfdvfgweiohgjkvbjkhrivnkvbdsjvvbnvlhfvnfbvjkhvfbv"
                               properties:@{@"Category" : @"Music", @"FileName" : @"favorite.avi",@"Category1" : @"Music", @"FileName1" : @"favorite.avi",@"Category2" : @"Music", @"FileName2" : @"favorite.avi",@"Category3" : @"Music", @"FileName3" : @"favorite.avi",@"Category4" : @"Music", @"FileName4" : @"favorite.avi",@"Category5" : @"Music", @"FileName5" : @"favorite.avi",@"Category6" : @"Music", @"FileName6" : @"favorite.avi",@"Category7" : @"Music", @"FileName7" : @"favorite.avi",@"Category8" : @"Music", @"FileName8" : @"favorite.avi",@"Category9" : @"Music", @"FileName9" : @"favorite.avi",@"Category10" : @"Music", @"FileName10" : @"favorite.avi",@"Category11" : @"Music", @"FileName11" : @"favorite.avi"
                               }];


    //Tc: 9. Sending track call with event name and in properties where value of a key is Integer/String/Double/Empty/Array/Object

    [[RSClient sharedInstance] track:@"Integer Value"
                                  properties:@{@"prop1": @100
                                  }];
            [[RSClient sharedInstance] track:@"String Value"
            properties:@{@"prop1": @"300"
            }];
            [[RSClient sharedInstance] track:@"Double Value"
            properties:@{@"prop1": @3000.88
            }];
            [[RSClient sharedInstance] track:@"Empty Value"
            properties:@{@"prop1": @""
            }];

            [[RSClient sharedInstance] track:@"Array Value"
            properties:@{@"prop1": @[@1,@2,@3]
            }];
            [[RSClient sharedInstance] track:@"Object Value"
                                  properties:@{@"prop1": @{@"color1":@"red", @"color2": @"blue"}
            }];


    //Tc: 10. Sending duplicate track events with some matching keys or mismatching keys

    [[RSClient sharedInstance] track:@"Shopping Done"
                                  properties:@{@"price": @100,
                                               @"size": @"L"
                                  }];

    [[RSClient sharedInstance] track:@"Shopping Done"
                                  properties:@{@"price": @120,
                                               @"size": @"L"
                                  }];

    //Tc: 11. Sending screen call with screen name

    [[RSClient sharedInstance] screen:@"Home"
                                   properties:@{@"name": @"screen2",
                                                @"new propert": @"prop val 1"
                                   }];

    //Tc: 12. Sending screen call with screen name and properties by setting the priority as "normal"

     [[RSClient sharedInstance] screen:@"Cinema Name"  properties:@{@"prop_key" : @"prop_value",@"category":@"TENET"}];
    
    
    
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

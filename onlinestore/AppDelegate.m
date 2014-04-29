//
//  AppDelegate.m
//  onlinestore
//
//  Created by Rajasekhar on 2/18/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "AppDelegate.h"
#import <GooglePlus/GooglePlus.h>

#import "BlueCatsSDK.h"
#import <BlueCatsSDK/BCMicroLocationManager.h>
#import "BCMicroLocationManager.h"
#import "BCMicroLocation.h"
#import "BCSite.h"
#import "BCCategory.h"
#import "BCBeacon.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"

#import "ALAlertBanner.h"


BCSite *ourSite;
NSMutableArray *advertisedBeacons;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    advertisedBeacons=[[NSMutableArray alloc] init];
    
    [BlueCatsSDK startPurringWithAppToken:@"a6ed9689-4578-4b29-b345-a9692d1fa6a5"];
    [[BCMicroLocationManager sharedManager] startUpdatingMicroLocation];
    
    [[BCMicroLocationManager sharedManager] setDelegate:self];
    
    
   

    // Override point for customization after application launch.
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

- (BOOL)application: (UIApplication *)application openURL: (NSURL *)url sourceApplication: (NSString *)sourceApplication annotation: (id)annotation
{
    return [GPPURLHandler handleURL:url sourceApplication:sourceApplication annotation:annotation];
}


#pragma mark - BCMicroLocationManagerDelegate methods

- (void)microLocationManager:(BCMicroLocationManager *)microLocationManger didDetermineState:(BCSiteState)state forSite:(BCSite *)site
{
    NSLog(@"didDetermineState");
}

- (void)microLocationManager:(BCMicroLocationManager *)microLocationManger didEnterSite:(BCSite *)site
{
     NSLog(@"didEnterSite");
}

- (void)microLocationManager:(BCMicroLocationManager *)microLocationManger didExitSite:(BCSite *)site
{
     NSLog(@"didExitSite");
}

- (void)microLocationManager:(BCMicroLocationManager *)microLocationManger didUpdateMicroLocations:(NSArray *)microLocations
{
    NSLog(@"didUpdateMicroLocations"); BCMicroLocation *microLocation = [microLocations lastObject];
    
    
   
    
    
    NSOrderedSet *nearbySites = microLocationManger.nearbySites;
    
    for (BCSite *site in nearbySites) {
        if ([site.teamID isEqualToString:@"f7a64100-cca2-508a-7349-3ebc8fce469f"]){
            ourSite=site;
        }
        
    }
    

    
    [self setValuesForMicroLocation:microLocation];
}


-(BOOL)isAdvertisedBeacon:(NSString *)beaconId{

    if([advertisedBeacons containsObject:beaconId]){
        
        return YES;
   
    }else{
        [advertisedBeacons addObject:beaconId];
        return NO;
    }
    
}


- (void)setValuesForMicroLocation:(BCMicroLocation *)microLocation
{
   
    if (microLocation) {
        NSArray *beacons = [microLocation beaconsForSite:ourSite proximity:BCProximityImmediate];
        NSMutableArray *compositeKeys = [[NSMutableArray alloc] init];
        for (BCBeacon *beacon in beacons) {
            [compositeKeys addObject:[beacon.compositeKey substringFromIndex:32]];
           
            
            if(![self isAdvertisedBeacon:beacon.beaconID]){
            
                 NSLog(@"%@",beacon.beaconID);
                
                ////WEBSERVICE CALL
                
//                NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Skumastrbyble/272a0101%C2%ADbda2%C2%AD28a2%C2%ADfc47%C2%AD8cd5032b3c46",[NSString stringWithFormat:@"%@",beacon.beaconID]];
//
                
                NSString *beaconIDString=[NSString stringWithFormat:@"%@",beacon.beaconID];
                beaconIDString=[beaconIDString stringByReplacingOccurrencesOfString: @"-" withString:@"%C2%AD"];
                
                
                NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Skumastrbyble/%@",beaconIDString];
                
                NSURL *url = [NSURL URLWithString:urlString];
                ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
                [request setDelegate:self];
                [request startAsynchronous];
                
                
               // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
                //hud.labelText = @"Loading Promo message..";

                
                
//                ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.window
//                                                                    style:ALAlertBannerStyleNotify
//                                                                 position:ALAlertBannerPositionTop
//                                                                    title:@"Alert"
//                                                                 subtitle:[NSString stringWithFormat:@"%@",beacon.beaconID]
//                                                              tappedBlock:^(ALAlertBanner *alertBanner) {
//                                                                  NSLog(@"tapped!");
//                                                                  [alertBanner hide];
//                                                              }];
//                banner.secondsToShow = 10;
//                banner.showAnimationDuration = 0.5;
//                banner.hideAnimationDuration = 0.5;
//                [banner show];

            
            }else{
            
                //NSLog(@"Advertised Beacon %@",beacon.beaconID);
            }
        
        }
        
    }
    

}
#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    
    //[MBProgressHUD hideHUDForView:self.window animated:YES];
    
    if (request.responseStatusCode == 400) {
        
    } else if (request.responseStatusCode == 403) {
        
    } else if (request.responseStatusCode == 200) {
        
        
        NSError *jsonError;
        NSMutableArray *responseArr = [NSJSONSerialization
                                      JSONObjectWithData:request.responseData
                                      options:NSJSONReadingMutableLeaves
                                      error:&jsonError];
        
        if ([responseArr count]>0)
        {
            
            
            for (int i=0; i<[responseArr count]; i++) {
                
                
                NSDictionary *promoDetail=[responseArr objectAtIndex:i];
                
                NSString *promoMessage=[NSString stringWithFormat:@"%@",[promoDetail objectForKey:@"promo_msg"]];
                
                ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.window
                                                                    style:ALAlertBannerStyleNotify
                                                                 position:ALAlertBannerPositionTop
                                                                    title:@"Dear Customer"
                                                                 subtitle:promoMessage
                                                              tappedBlock:^(ALAlertBanner *alertBanner) {
                                                                  NSLog(@"tapped!");
                                                                  [alertBanner hide];
                                                              }];
                banner.secondsToShow = 10;
                banner.showAnimationDuration = 0;
                banner.hideAnimationDuration = 0;
                [banner show];
                

                
            }
            
            
            
            
            
            
            
        }else{
            
            NSString *message=[NSString stringWithFormat:@"Problem in Fectching Shop Items.Please try later.."];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    } else {
        NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    //[MBProgressHUD hideHUDForView:self.window animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



@end

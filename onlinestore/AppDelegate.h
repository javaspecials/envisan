//
//  AppDelegate.h
//  onlinestore
//
//  Created by Rajasekhar on 2/18/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BCMicroLocationManager.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,BCMicroLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

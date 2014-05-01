//
//  LoginViewController.h
//  onlinestore
//
//  Created by Envision on 19/03/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import "FHSTwitterEngine.h"
#import "EAIntroView.h"
@class GPPSignInButton;

@interface LoginViewController : UIViewController <EAIntroDelegate,GPPSignInDelegate,FHSTwitterEngineAccessTokenDelegate,UITextViewDelegate>{

}

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet GPPSignInButton *signInButton;
- (IBAction)loginButtonTap:(id)sender;
- (IBAction)signUpTap:(id)sender;
- (IBAction)guestButtonTap:(id)sender;


@end

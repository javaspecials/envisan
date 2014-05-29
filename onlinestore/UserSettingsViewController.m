            //
//  UserrSettingsViewController.m
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "UserSettingsViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface UserSettingsViewController ()

@end
ASIFormDataRequest *getRequest;
ASIFormDataRequest *updateRequest;
NSURL *url ;
@implementation UserSettingsViewController
//@synthesize myScrool,pushBtn,smsBtn,emailBtn,screenlockBtn,bannerBtn,bluetoothBtn,wifiBtn,sslBtn,gpsBtn,webserverBtn;
@synthesize myScrool,pushArr,smsArr,screenLockArr,bannerArr,bleutoothArr,wifiArr,gpsArr,webserverArr,sslArr,emailArr,bluetoothSwitch,bannerSwitch,smsBSwitch,pushSwitch,emailSwitch,gpsSwitch,sslSwitch,screenlockBSwitch,webserverSwitch,wifiSwitch;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setHeaderView:YES];
    // Do any additional setup after loading the view.
    //self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    [myScrool setScrollEnabled:YES];
    [myScrool setContentSize:CGSizeMake(320, 1100)];
    
    
    [self getDetails];
}


-(void)getDetails
{
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Fetchuserstngbyuid/ 1989895"];
    
    
    ////WEBSERVICE CALL
    
    NSURL *apiUrl = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    getRequest = [ASIFormDataRequest requestWithURL:apiUrl];
    [getRequest setDelegate:self];
    [getRequest startAsynchronous];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Shop Items..";
    

    
}


#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    if (getRequest==request) {
        
   
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if (request.responseStatusCode == 400) {
        
    } else if (request.responseStatusCode == 403) {
        
    } else if (request.responseStatusCode == 200) {
        
        
        NSError *jsonError;
        NSArray *responseDict = [NSJSONSerialization
                                      JSONObjectWithData:request.responseData
                                      options:NSJSONReadingMutableLeaves
                                      error:&jsonError];
        
        if (responseDict!=nil)
        {
            NSLog(@"responseDict is %@",responseDict );
            
            // NSArray *productArrObj =[responseDict
          NSLog(@"name %@:",responseDict);
            
         
    
            
           
            
            
            int pushFlag1=[[[responseDict objectAtIndex:0] valueForKey:@"push_notification"] intValue];
            
            self.pushStr = [[responseDict objectAtIndex:0] valueForKey:@"push_notification"];
            NSLog(@"push_notification %@:",self.pushStr);
            
            
            int pushFlag2=[[[responseDict objectAtIndex:0] valueForKey:@"app_update_check"] intValue];
            
            self.screenLockStr = [[responseDict objectAtIndex:0] valueForKey:@"app_update_check"];
            NSLog(@"app_update_check %@:",self.screenLockStr);
            
            int pushFlag3=[[[responseDict objectAtIndex:0] valueForKey:@"bluetooth"] intValue];
            
            self.bluetoothStr = [[responseDict objectAtIndex:0] valueForKey:@"bluetooth"];
            NSLog(@"bluetooth %@:",self.bluetoothStr);
            
            int pushFlag4=[[[responseDict objectAtIndex:0] valueForKey:@"banners"] intValue];
            
            self.bannerStr = [[responseDict objectAtIndex:0] valueForKey:@"banners"];
            NSLog(@"banners %@:",self.bannerStr);
            
            int pushFlag5=[[[responseDict objectAtIndex:0] valueForKey:@"ssl"] intValue];
            
            self.sslStr = [[responseDict objectAtIndex:0] valueForKey:@"ssl"];
            NSLog(@"ssl %@:",self.sslStr);
            
           
            int pushFlag6=[[[responseDict objectAtIndex:0] valueForKey:@"sms_notifications"] intValue];
            
            self.smsStr = [[responseDict objectAtIndex:0] valueForKey:@"sms_notifications"];
            NSLog(@"sms_notifications %@:",self.smsStr);
            
            int pushFlag7=[[[responseDict objectAtIndex:0] valueForKey:@"email_alerts_for_offers"] intValue];
            
            self.emailStr = [[responseDict objectAtIndex:0] valueForKey:@"email_alerts_for_offers"];
            NSLog(@"email_alerts_for_offers %@:",self.emailStr);
            
            int pushFlag8=[[[responseDict objectAtIndex:0] valueForKey:@"web_server"] intValue];
            
            self.webserverStr = [[responseDict objectAtIndex:0] valueForKey:@"web_server"];
            NSLog(@"web_server %@:",self.webserverStr);
            
            int pushFlag9=[[[responseDict objectAtIndex:0] valueForKey:@"wifi"] intValue];
            
            self.wifiStr = [[responseDict objectAtIndex:0] valueForKey:@"wifi"];
            NSLog(@"wifi %@:",self.wifiStr);
            
            int pushFlag10=[[[responseDict objectAtIndex:0] valueForKey:@"gps"] intValue];
            
            self.gpsStr = [[responseDict objectAtIndex:0] valueForKey:@"gps"];
            NSLog(@"gps %@:",self.gpsStr);
            
            
            if (pushFlag1==1) {
                
                
                screenlockBSwitch.on=YES;
                
                
            }else{
               screenlockBSwitch.on=NO;
                
            }
            
            if (pushFlag2==1) {
                 pushSwitch.on=YES;
            } else {
                 pushSwitch.on=NO;
            }
            
            if (pushFlag3==1) {
                bluetoothSwitch.on=YES;
            } else {
                bluetoothSwitch.on=NO;
            }
            
            if (pushFlag4==1) {
                 bannerSwitch.on=YES;
            } else {
                bannerSwitch.on=NO;
            }
            
            if (pushFlag5==1) {
                
                 sslSwitch.on=YES;
            } else {
                sslSwitch.on=NO;
            }
            
            
            if (pushFlag6==1) {
                smsBSwitch.on=YES;
            } else {
                smsBSwitch.on=NO;
            }
            
            if (pushFlag7==1) {
                emailSwitch.on=YES;
            } else {
                emailSwitch.on=NO;
            }
            
    
            
            if (pushFlag8==1) {
                sslSwitch.on=YES;
            } else {
                sslSwitch.on=NO;
            }
            
            
            if (pushFlag9==1) {
                wifiSwitch.on=YES;
            } else {
                wifiSwitch.on=NO;
            }
            
            
            if (pushFlag10==1) {
                gpsSwitch.on=YES;
            } else {
                gpsSwitch.on=NO;
            }



         
            
        }
            
        }else if(updateRequest==request)
        {
        
        if (request.responseStatusCode == 400) {
            
        } else if (request.responseStatusCode == 403) {
            
        } else if (request.responseStatusCode == 200) {
            
            
            
            NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
                    NSLog(@"%@",str);
            
            
                    if ([str isEqualToString:@"true"]) {
                        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
                        [alert show];
                    }else{
                        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                        
                        [alert show];
                        
                        
                    }
            
        }
        } else {
            NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }

        
        
        else{
            
            NSString *message=[NSString stringWithFormat:@"Problem in Fectching Shop Items.Please try later.."];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sss:(UISwitch *)sender {
}

- (IBAction)saveTab:(id)sender {
    
    [self SubmitDetails];
    
}

-(void)SubmitDetails{
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Updatebyuserst/1989895"];
    
    NSURL *someUrl = [[NSURL alloc]initWithString:urlString];
    
   updateRequest = [ASIFormDataRequest requestWithURL:someUrl];
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    //[dic setObject:@"1235" forKey:@"id"];
    [dic setObject: self.bluetoothStr forKey:@"bluetooth"];
    [dic setObject: self.pushStr forKey:@"push_notification"];
    [dic setObject:self.bannerStr forKey:@"banners"];
    [dic setObject: self.bluetoothStr forKey:@"alerts_on_locked_screen"];
    //[dic setObject: self.pushStr forKey:@"app_update_check"];
    [dic setObject:self.bannerStr forKey:@"ssl"];
    
    [dic setObject: self.bluetoothStr forKey:@"gps"];
    [dic setObject: self.pushStr forKey:@"web_server"];
    [dic setObject:self.bannerStr forKey:@"wifi"];
    [dic setObject: self.bluetoothStr forKey:@"sms_notifications"];
    //[dic setObject: self.pushStr forKey:@"show_in_notificiton_center"];
    [dic setObject:self.bannerStr forKey:@"email_alerts_for_offers"];
    
   
    
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        
        [updateRequest appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
        [updateRequest setDelegate:self];
        [updateRequest startSynchronous];
        
        
     
    }
    
    
    
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   // hud.labelText = @"Saving Details..";
}



@end

//
//  SideMenuViewController.m
//  onlinestore
//
//  Created by Envision on 5/1/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SettingsCell.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface SideMenuViewController ()

@end

@implementation SideMenuViewController
@synthesize pushArr,smsArr,screenLockArr,bannerArr,bleutoothArr,wifiArr,gpsArr,webserverArr,sslArr,emailArr,scell;
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
    // Do any additional setup after loading the view from its nib.
    _arrObj = [[NSArray alloc]initWithObjects:@"PushNotification",@"SmsNotification",@"EmailAlert",@"LockScreenAlert",@"Banner", nil];
    _ntfObj = [[NSArray alloc]initWithObjects:@"Bluetooth",@"Webserver",@"wifi",@"GPS",@"SSL", nil];
    _totalObj = [[NSArray alloc]initWithObjects:_arrObj,_ntfObj, nil];
    
    //getData
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Fetchuserstngbyuid/1000"];
    
    
    ////WEBSERVICE CALL
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Settings..";
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)settingsBtnTapp:(id)sender {
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_totalObj objectAtIndex:section]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdenifier = @"Cell";
    
    SettingsCell *cell = (SettingsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdenifier];
    if (cell==nil) {
       [[NSBundle mainBundle]loadNibNamed:@"SettingsCell" owner:self options:nil];
         //cell = [nib objectAtIndex:0];
        cell=scell;
   /* UITableViewCell *cell;
    //= [tableView dequeueReusableCellWithIdentifier:cellIdenifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenifier];*/
    }
    cell.nameLbl.text = [[_totalObj objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    
     //[cell.mySwitch addTarget:self action:@selector(checkSwitchTap:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        NSString *str = @"Notification";
        return str;
    }
    else{
        
 
        NSString *str = @"wifi";
        return str;
    }
    //NSString *str = @"NewTestment";
    //return str;
}

#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    
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
            
            // NSArray *productArrObj =[responseDict objectForKey:@"products"];
            NSLog(@"name %@:",responseDict);
            
            
            
            // [self displaySwitchMethods];
            
            
            
            
            int pushFlag1=[[[responseDict objectAtIndex:0] valueForKey:@"push_notification"] intValue];
            
            self.pushStr = [[responseDict objectAtIndex:0] valueForKey:@"push_notification"];
            NSLog(@"push_notification %@:",self.pushStr);
            
            
            /*int pushFlag2=[[[responseDict objectAtIndex:0] valueForKey:@"app_update_check"] intValue];
            
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
            NSLog(@"gps %@:",self.gpsStr);*/
            
            if (pushFlag1==1) {
                scell.mySwitch.on=YES;
            }
            else{
                scell.mySwitch.on=NO;
            }
            
           /* if (pushFlag1==1) {
                
                
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
            }*/
            
            
            
            
            
            
            
            
            
            
            
            /* modifiedDateArr = [responseDict valueForKey:@"modifieddate"];
             NSLog(@"modifidate %@:",modifiedDateArr);
             
             modifiedByArr = [responseDict valueForKey:@"modifiedby"];
             NSLog(@"modifiby %@:",modifiedByArr);
             
             createdDateArry = [responseDict valueForKey:@"createddate"];
             NSLog(@"createddate %@:",createdDateArry);
             
             createdByArr = [responseDict valueForKey:@"createdby"];
             NSLog(@"createdby %@:",createdByArr);
             //NSLog(@"name %@:",createdByArr);*/
            
            
            // [tableViewObj reloadData];
            
            
            
        }else
            
            //Categories
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            if (request.responseStatusCode == 400) {
                
            } else if (request.responseStatusCode == 403) {
                
            } else if (request.responseStatusCode == 200) {
                
                
                // [self SubmitDetails:request.responseData];
                
                
                NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
                NSLog(@"%@",str);
                
                
                if ([str isEqualToString:@"true"]) {
                    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                    
                    [alert show];
                }else{
                    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                    
                    [alert show];
                    
                    
                }
                
                // [self prepareDataFromJSONData:request.responseData];
                // [self prepareDataFromJSONDataForitemList:request.responseData];
                
                
                
                //  NSDictionary *categoryDic=[categories objectAtIndex:selectedCategoryIndex];
                // int categoryId=[[categoryDic objectForKey:@"id"] intValue];
                
                // [self sendItemsRequestWithCategoryId:categoryId];
                
                
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
    
    //    } else {
    //        NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
    //        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //        [alert show];
    //    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



@end

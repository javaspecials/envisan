//
//  DemoViewController.m
//  onlinestore
//
//  Created by Envision on 05/05/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "DemoViewController.h"
#import "MBProgressHUD.h"
#import "DataHandler.h"
#import "ASIFormDataRequest.h"
#import "HomeViewController1.h"



@interface DemoViewController ()

@end
NSMutableDictionary *dic;

@implementation DemoViewController


@synthesize submitButton;

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
    
}
-(IBAction)submitButtonClicked:(id)sender
{
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Userdetail.json"];
    
    NSURL *someUrl = [[NSURL alloc]initWithString:urlString];
    ////WEBSERVICE CALL
    //    NSURL *url = [NSURL URLWithString:urlString];
    //    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    //    [request setDelegate:self];
    //    [request startAsynchronous];
    
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:someUrl];
    //    [request setRequestMethod:@"POST"];
    //    [request setPostValue:self.useNameTxf.text forKey:@"username"];
    //    [request setPostValue:self.pwdTxt.text forKey:@"password"];
    //    [request setPostValue:self.fNameTxt.text forKey:@"firstname"];
    //    [request setPostValue:self.lNameTxt.text forKey:@"id"];
    //
    
    
    dic=[[NSMutableDictionary alloc] init];
    /*[dic setObject:@"1575095" forKey:@"id"];
     [dic setObject:@"dkaran" forKey:@"username"];
     [dic setObject:@"d4297" forKey:@"password"];
     [dic setObject:@"bpau" forKey:@"firstname"];*/
    
    
    //[dic setObject:@"7099" forKey:@"id"];
    
    [dic setObject:nametext.text forKey:@"username"];
    //[dic setObject:gendertext.text forKey:@"dateofbirth"];
    [dic setObject:emailidtext.text forKey:@"emailaddress"];
    [dic setObject:agetext.text forKey:@"zipcode"];
    [dic setObject:emailidtext.text forKey:@"zipcode"];
    
    //    [dic setObject:self.zipTxf.text forKey:@"password"];
    //    [dic setObject:self.emailAddrTxf.text forKey:@"emailaddress"];
    //    [dic setObject:self.dobTxf.text forKey:@"dateofbirth"];
    //
    //    [dic setObject:self.addressTxtView.text forKey:@"address1"];
    //    [dic setObject:self.stateNameTxf.text forKey:@"state"];
    //    [dic setObject:self.cityNameTxf.text forKey:@"city"];
    //[dic setObject:self.countryNameTxf.text forKey:@"country"];
    
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        
        [request appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
        [request setDelegate:self];
        [request startSynchronous];
        
        // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //hud.labelText = @"Saving Details..";
    }
    
}
#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if (request.responseStatusCode == 400) {
        
    } else if (request.responseStatusCode == 403) {
        
    } else if (request.responseStatusCode == 200) {
        
        
        NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        
        
        if ([str isEqualToString:@"true"]) {
            
            
            [DataHandler defaultHandler].userDetails=dic;
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            HomeViewController1 *vc = [sb instantiateViewControllerWithIdentifier:@"HomeViewController1"];
            [self.navigationController pushViewController:vc animated:YES];
            
            
            
            
        }else{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
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
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [nametext resignFirstResponder];
    [zipCodetext resignFirstResponder];
    [agetext resignFirstResponder];
    [emailidtext resignFirstResponder];
    [gendertext resignFirstResponder];
    //    [self.countryNameTxf resignFirstResponder];
    //    [self.addressTxtView resignFirstResponder];
    //    [self.dobTxf resignFirstResponder];
    //    [self.userNameTxf resignFirstResponder];
    //    [self.passwordTxf resignFirstResponder];
    
    
    return YES;



//- (void)didReceiveMemoryWarning
//{
    //[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

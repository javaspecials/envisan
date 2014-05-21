//
//  UserProfileViewController.m
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UsereProDisplayViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"

#import "DataHandler.h"
@interface UserProfileViewController ()

@end
UIView *pickerBackground;
@implementation UserProfileViewController
@synthesize scrObj,lanArrObj;
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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBarHidden = YES;

    
    [[self.address1Txt layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.address1Txt layer] setBorderWidth:3];
    [[self.address1Txt layer] setCornerRadius:10];
    
    [[self.address2Txf layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.address2Txf layer] setBorderWidth:3];
    [[self.address2Txf layer] setCornerRadius:10];
    
    
    ///http://68.169.52.119/Fetchbyuserid/18422
    [super viewDidLoad];
    
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
    
    self.imageView.layer.borderWidth=5;
    self.imageView.layer.borderColor=[[UIColor whiteColor] CGColor];
    
    
    self.outerCircle.layer.cornerRadius = self.outerCircle.frame.size.width/2;
    self.outerCircle.layer.borderWidth=0.5;
    self.outerCircle.layer.borderColor=[[UIColor whiteColor] CGColor];

    
    
    NSDictionary *userDetails=[DataHandler defaultHandler].userDetails;
    
    if (userDetails) {
        
         NSString *fullName=[NSString stringWithFormat:@"%@ %@",[userDetails objectForKey:@"firstname"],[userDetails objectForKey:@"lastname"]];
        
        if ([fullName isEqualToString:@"(null) (null)"]||[fullName isEqualToString:@"(null)"]) {
            
        }else{
            self.name.text=fullName;
        }
       
        
        
        self.useNameTxf.text=[userDetails objectForKey:@"username"];
          self.pwdTxt.text=[userDetails objectForKey:@"password"];
        self.fNameTxt.text=[userDetails objectForKey:@"firstname"];
        self.lNameTxt.text=[userDetails objectForKey:@"lastname"];
       
      
        self.dobTxt.text=[userDetails objectForKey:@"dateofbirth"];
        
        self.address1Txt.text=[userDetails objectForKey:@"address1"];
        
        self.cityNameTxt.text=[userDetails objectForKey:@"city"];
          self.stateNameTxt.text=[userDetails objectForKey:@"state"];
        
        
         self.emaitAdrTxf.text=[userDetails objectForKey:@"emailaddress"];
       
        
         self.userAliasTxt.text=[userDetails objectForKey:@"user_alias"];
          self.zipCodeTxf.text=[userDetails objectForKey:@"zipcode"];
         self.address2Txf.text=[userDetails objectForKey:@"address2"];
        self.countryNameTxf.text=[userDetails objectForKey:@"country"];
          self.languageTxf.text=[userDetails objectForKey:@"language"];
        
        NSString *photoURL=[userDetails objectForKey:@"image"];
        NSRange rangeValue = [photoURL rangeOfString:@"http" options:NSCaseInsensitiveSearch];
        if (rangeValue.length > 0){
            NSURL* aURL = [NSURL URLWithString:photoURL];
            NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
            self.imageView.image = [UIImage imageWithData:data];

        } 
        

    }
    
    
	// Do any additional setup after loading the view.
    
//    
//    NSDate *now = [NSDate date];
//    
//    [picker setDate:now animated:YES];
//    
    
    [self setHeaderView:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [scrObj setScrollEnabled:YES];
    [scrObj setContentSize:CGSizeMake(320, 2000)];
    
    lanArrObj = [[NSArray alloc]initWithObjects:@"English",@"Hindi",@"French",@"Telugu",@"Maratti",@"Kanada", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)profileBtnTap:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.useNameTxf resignFirstResponder];
    [self.pwdTxt resignFirstResponder];
    [self.fNameTxt resignFirstResponder];
    [self.lNameTxt resignFirstResponder];
    [self.userAliasTxt resignFirstResponder];
    [self.dobTxt resignFirstResponder];
    [self.address1Txt resignFirstResponder];
    [self.address2Txf resignFirstResponder];
    [self.cityNameTxt resignFirstResponder];
    [self.stateNameTxt resignFirstResponder];
    [self.countryNameTxf resignFirstResponder];
    [self.emaitAdrTxf resignFirstResponder];
    [self.zipCodeTxf resignFirstResponder];
    //[self.activeTxf resignFirstResponder];
    [self.languageTxf resignFirstResponder];
//    [self.createDateTxf resignFirstResponder];
//    [self.createdByTxf resignFirstResponder];
//    [self.modifieDateTxf resignFirstResponder];
//    [self.modifiedByTxf resignFirstResponder];
    //[self.stateNameTxt resignFirstResponder];
    
    return YES;
}
- (IBAction)submitBtnTapp:(id)sender {
    
    
    [self textfieldValidation];
    
 
}



-(void)webserViceCalling
{
   // NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Updatebyuser/1003"];
    
    NSDictionary *userDetails=[DataHandler defaultHandler].userDetails;
    
    NSLog(@"ff%@",userDetails);

    
     NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Updatebyuser/%@",[userDetails objectForKey:@"id"]];

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
    
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    /*[dic setObject:@"1575095" forKey:@"id"];
    [dic setObject:@"dkaran" forKey:@"username"];
    [dic setObject:@"d4297" forKey:@"password"];
    [dic setObject:@"bpau" forKey:@"firstname"];*/
    
    
    //[dic setObject:@"11422" forKey:@"id"];
    [dic setObject:self.useNameTxf.text forKey:@"username"];
     [dic setObject:self.pwdTxt.text forKey:@"password"];
     [dic setObject:self.fNameTxt.text forKey:@"firstname"];
    
    [dic setObject:self.lNameTxt.text forKey:@"lastname"];
    [dic setObject:self.userAliasTxt.text forKey:@"user_alias"];
    [dic setObject:self.dobTxt.text forKey:@"dateofbirth"];
    [dic setObject:self.address1Txt.text forKey:@"address1"];
    
    [dic setObject:self.address2Txf.text forKey:@"address2"];
    [dic setObject:self.cityNameTxt.text forKey:@"city"];
    [dic setObject:self.stateNameTxt.text forKey:@"state"];
    [dic setObject:self.countryNameTxf.text forKey:@"country"];
    
    [dic setObject:self.emaitAdrTxf.text forKey:@"emailaddress"];
    [dic setObject:self.zipCodeTxf.text forKey:@"zipcode"];
    //[dic setObject:self.activeTxf.text forKey:@"activie"];
    //[dic setObject:self.countryNameTxf.text forKey:@"country"];
    [dic setObject:self.languageTxf.text forKey:@"language"];
    

    
    
    
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
    
        

    
    }
    
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Saving Details..";

    
   }


#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if (request.responseStatusCode == 400) {
        
    } else if (request.responseStatusCode == 403) {
        
    } else if (request.responseStatusCode == 200) {
        
    
      //  NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
        // NSLog(@"%@",str);
        
        
        NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        
        
        if ([str isEqualToString:@"true"]) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
        }else{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
            
            
        }
              

       
        
        NSError *jsonError;
        NSDictionary *responseDict = [NSJSONSerialization
                                      JSONObjectWithData:request.responseData
                                      options:NSJSONReadingMutableLeaves
                                      error:&jsonError];
        
        if (responseDict!=nil)
        {
            
            //NSLog(@"responseDict is %@",[responseDict objectForKey:@"products"]);
            
        
            
            
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
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



- (IBAction)displayDateBtnTapp:(id)sender {
}

#pragma TextFeld Validation

-(void)textfieldValidation
{
    if (([self.useNameTxf.text isEqualToString:@""]) || ([self.pwdTxt.text isEqualToString:@""]) || ([self.fNameTxt.text isEqualToString:@""]) || ([self.lNameTxt.text isEqualToString:@""])  || ([self.address1Txt.text isEqualToString:@""])  || ([self.cityNameTxt.text isEqualToString:@""]) || ([self.stateNameTxt.text isEqualToString:@""]) || ([self.countryNameTxf.text isEqualToString:@""]) || ([self.emaitAdrTxf.text isEqualToString:@""]) || ([self.zipCodeTxf.text isEqualToString:@""]) || ([self.languageTxf.text isEqualToString:@""]) )
    {
        UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Please fill in the details." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        [ErrorAlert show];
    }
    
    else{
        //UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Success." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        //    [ErrorAlert show];
       // [self webServiceCalling];
        [self webserViceCalling];
    }
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(([self.fNameTxt.text isEqualToString:@""]) || ([self.languageTxf.text isEqualToString:@""]) || ([self.userAliasTxt.text isEqualToString:@""]) || ([self.cityNameTxt.text isEqualToString:@""]) || ([self.stateNameTxt.text isEqualToString:@""]) || ([self.countryNameTxf.text isEqualToString:@""]))
    {
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
        for (int i = 0; i < [string length]; i++) {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Numbers not allowed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                return NO;
            }
            
        }
        
    }else if([self.zipCodeTxf.text isEqualToString:@""])
    {
        int iValue;
        
        if (self.zipCodeTxf.text.length > 0 && [[NSScanner scannerWithString:self.zipCodeTxf.text] scanInt:&iValue]) {
            //do smomething with iValue (int value from noOfPassengers.text)
            NSLog(@"value entered correctly.");
            return YES;
        }
//        else
//            NSLog(@"Error: Only numerica values are accepted");
    }
    
    return YES;
}

#pragma DropDo Button

-(void)dropDownBtnMethods
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(250, 175, 130, 180) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    [table reloadData];
    table.hidden=YES;
}

- (IBAction)langBtnTapp:(id)sender {
    
    table.hidden=NO;

    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [lanArrObj count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=[lanArrObj objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.languageTxf.text = [lanArrObj objectAtIndex:indexPath.row];;
    table.hidden=YES;
    
}

#pragma DatePicker
- (IBAction)datePickerBtnTapp:(id)sender {
    
    //    CGRect frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 215);
    //    UIDatePicker *typePicker = [[UIDatePicker alloc] initWithFrame:frame];
    //    [self.view addSubview:typePicker];
    //    [UIView beginAnimations:@"slideIn" context:nil];
    //    [typePicker setCenter:CGPointMake(typePicker.center.x, self.view.frame.size.height - typePicker.frame.size.height/2)];
    //    [UIView commitAnimations];
    //    NSDate *dateSelected = [typePicker date];
    //    NSString *dateModifi = [NSString stringWithFormat:@"%@",dateSelected];
    //    self.dobTxf.text = dateModifi;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    pickerBackground=[[UIView alloc]initWithFrame:CGRectMake(0, screenHeight-250, screenWidth, 250) ];
    pickerBackground.backgroundColor=[UIColor whiteColor];
    picker = [[DatePickerView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 250)];
    [picker addTargetForDoneButton:self action:@selector(donePressed)];
    [picker addTargetForCancelButton:self action:@selector(cancelPressed)];
    
    [pickerBackground addSubview:picker];
    [self.view addSubview:pickerBackground];
    picker.hidden = NO;
    [picker setMode:UIDatePickerModeDate];
    [picker.picker addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
}


-(void)pickerChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    NSLog(@"date time description: %@",[dateFormatter stringFromDate:[(UIDatePicker*)sender date]]);
    //    selectedDate = picker.date;
    //    [button setTitle:[dateFormatter stringFromDate:selectedDate] forState:UIControlStateNormal];
    
    self.dobTxt.text=[dateFormatter stringFromDate:[(UIDatePicker*)sender date]];
    //    selectedDate = picker.date;
}

-(void)donePressed {
    pickerBackground.hidden=YES;
    picker.hidden = YES;
    NSLog(@"Done button tapped");
    
}

-(void)cancelPressed {
    picker.hidden = YES;
    pickerBackground.hidden=YES;
    
    NSLog(@"Cancel pressed");
}

@end

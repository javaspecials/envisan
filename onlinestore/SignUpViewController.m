//
//  SignUpViewController1.m
//  onlinestore
//
//  Created by Envision on 05/05/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

//#import "SignUpViewController1.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "DataHandler.h"
#import "HomeViewController1.h"
//#import "SideMenuViewController.h"

#import "SideMenuViewController.h"
#import "IIViewDeckController.h"
#import "SignUpViewController.h"
#import "DemoViewController.h"
@interface SignUpViewController ()

@end
NSMutableDictionary *dic;
UIView *pickerBackground;
@implementation SignUpViewController

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
    [self setHeaderView:YES];
    self.arrObj = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    
    [self dropDownBtnMethods];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveBtnTapp:(id)sender {
    
    
    
    [self textfieldValidation];
}
-(void)webServiceCalling
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
    
    
    //[dic setObject:@"" forKey:@"id"];
    
    [dic setObject:self.nameTxf.text forKey:@"username"];
    [dic setObject:self.mfTxf.text forKey:@"gender"];
    [dic setObject:self.dobTxf.text forKey:@"dateofbirth"];
    [dic setObject:self.emailTxf.text forKey:@"emailaddress"];
    [dic setObject:self.zipTxf.text forKey:@"zipcode"];


    
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
        
        
        NSError *jsonError;
        NSDictionary *responseDict = [NSJSONSerialization
                                      JSONObjectWithData:request.rawResponseData
                                      options:NSJSONReadingAllowFragments
                                      error:&jsonError];
        
        NSString *idString=[responseDict objectForKey:@"id"];
        
        [dic setObject:idString forKey:@"id"];
        
        //if ([idString isEqualToString:@"id"]) {
            
            [DataHandler defaultHandler].userDetails=dic ;
            
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            HomeViewController1 *vc = [sb instantiateViewControllerWithIdentifier:@"HomeViewController1"];
            
         
            [self.navigationController pushViewController:vc animated:YES];
        //}
        
        
       // }
    

       // else{
            //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            //[alert show];
            
            
        //}
    }
else {
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


#pragma TextFeld Validation

-(void)textfieldValidation
{
    if (([self.nameTxf.text isEqualToString:@""]) || ([self.mfTxf.text isEqualToString:@""]) || ([self.emailTxf.text isEqualToString:@""]) || ([self.dobTxf.text isEqualToString:@""])  )
    {
        UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Please fill in the details." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        [ErrorAlert show];
    }
    
    else{
        if ([self validateEmail:self.emailTxf.text]==YES) {
            [self webServiceCalling];
            
        }
        else{
            UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"error"
                                                            message:@"email format ist not correct"
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

-(BOOL) validateEmail:(NSString*) emailString
{
    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    NSLog(@"%i", regExMatches);
    if (regExMatches == 0) {
        return NO;
    }
    else
        return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    
    if( (textField == self.nameTxf) ||(textField == self.mfTxf))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    if (textField == self.zipTxf) {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        NSString *expression = @"^([0-9]+)?(\\.([0-9]{1,2})?)?$";
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:nil];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:newString
                                                            options:0
                                                              range:NSMakeRange(0, [newString length])];
        if (numberOfMatches == 0)
            return NO;
    }

    
        return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTxf resignFirstResponder];
    [self.emailTxf resignFirstResponder];
    [self.zipTxf resignFirstResponder];
    [self.dobTxf resignFirstResponder];
    [self.mfTxf resignFirstResponder];
    //    [self.countryNameTxf resignFirstResponder];
    //    [self.addressTxtView resignFirstResponder];
    //    [self.dobTxf resignFirstResponder];
    //    [self.userNameTxf resignFirstResponder];
    //    [self.passwordTxf resignFirstResponder];
    
    
    return YES;
}
- (IBAction)dateTapp:(id)sender {
    
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
    
    self.dobTxf.text=[dateFormatter stringFromDate:[(UIDatePicker*)sender date]];
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

- (IBAction)segment:(id)sender {
    if (Segment.selectedSegmentIndex == 0) {
        self.mfTxf.text = @"Male";
         //[dic setObject:self.mfTxf.text forKey:@"gender"];
        //[Segment setTitle:@"Male" forSegmentAtIndex:0];
        
    }
    else if (Segment.selectedSegmentIndex == 1)
    {
        self.mfTxf.text = @"Female";
        //[Segment setTitle:@"Female" forSegmentAtIndex:1];

         //[dic setObject:self.mfTxf.text forKey:@"gender"];
    }
}

#pragma DropDo Button

-(void)dropDownBtnMethods
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(190, 136, 100, 80) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.myScroolObj addSubview:table];
    [table reloadData];
    table.hidden=YES;
}

- (IBAction)dropdownBtnTapp:(id)sender {
    
   // table.hidden=NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrObj count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=[_arrObj objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.mfTxf.text = [_arrObj objectAtIndex:indexPath.row];;
    table.hidden=YES;
    
}

- (IBAction)MfBtnTapp:(id)sender {
    
    table.hidden=NO;
    
}


@end

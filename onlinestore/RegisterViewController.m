//
//  RegisterViewController.m
//  onlinestore
//
//  Created by Envision on 15/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "RegisterViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "DataHandler.h"
#import "HomeViewController1.h"

@interface RegisterViewController ()

@end
UIView *pickerBackground;
NSMutableDictionary *dic;
@implementation RegisterViewController
@synthesize myScrObj,cityArr,stateArr,countryArr;

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
	// Do any additional setup after loading the view.
    
    [self setHeaderView:YES];
    
    
    //Set UITextView Border
    
    [[self.addressTxtView layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.addressTxtView layer] setBorderWidth:3];
    [[self.addressTxtView layer] setCornerRadius:10];
    
    [myScrObj setScrollEnabled:YES];
    [myScrObj setContentSize:CGSizeMake(320, 1200)];
   // self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
   
    
     [self dropDownBtnMethods];

}


#pragma DropDo Button

-(void)dropDownBtnMethods
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(250, 420, 180, 180) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    [table reloadData];
    table.hidden=YES;
}


- (IBAction)cityBtnTapp:(id)sender {
    table.hidden=NO;
}

- (IBAction)stateBtnTapp:(id)sender {
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [cityArr count];

    
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=[cityArr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.cityNameTxf.text = [cityArr objectAtIndex:indexPath.row];;
    table.hidden=YES;
    
}
//-(BOOL) validateEmail:(NSString*) emailString
//{
//    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$";
//    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
//    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
//    NSLog(@"%i", regExMatches);
//    if (regExMatches == 0) {
//        return NO;
//    }
//    else
//        return YES;
//}
- (IBAction)saveBtnTapp:(id)sender
{
     [self textfieldValidation];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma TextFeld Validation

-(void)textfieldValidation
{
    if (([self.fNameTxf.text isEqualToString:@""]) || ([self.lNameTxf.text isEqualToString:@""]) || ([self.emailAddrTxf.text isEqualToString:@""]) || ([self.dobTxf.text isEqualToString:@""]) || ([self.addressTxtView.text isEqualToString:@""]) || ([self.cityNameTxf.text isEqualToString:@""]) || ([self.stateNameTxf.text isEqualToString:@""]) || ([self.countryNameTxf.text isEqualToString:@""]))
    {
        UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Please fill in the details." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        [ErrorAlert show];
    }
    
    //else{
        
        /*if ([self validateEmail:self.emailAddrTxf.text]==YES) {
            [self webServiceCalling];
            
        }
        else{
            UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"error"
                                                            message:@"email format ist not correct"
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil];
            [alert show];
        }*/
           // }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    
    if( (textField == self.lNameTxf) ||(textField == self.fNameTxf))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    
    if (self.passwordTxf.text.length >= 10 && range.length == 0)
        return NO;
    
    
    
    
    
    
    else
        
        return YES;

}
-(void)webServiceCalling{
    
    
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
    
    [dic setObject:self.fNameTxf.text forKey:@"firstname"];
    [dic setObject:self.lNameTxf.text forKey:@"lastname"];
    [dic setObject:self.userNameTxf.text forKey:@"username"];
    [dic setObject:self.passwordTxf.text forKey:@"password"];
    [dic setObject:self.emailAddrTxf.text forKey:@"emailaddress"];
    [dic setObject:self.dobTxf.text forKey:@"dateofbirth"];

    [dic setObject:self.addressTxtView.text forKey:@"address1"];
     [dic setObject:self.stateNameTxf.text forKey:@"state"];
    [dic setObject:self.cityNameTxf.text forKey:@"city"];
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
    [self.fNameTxf resignFirstResponder];
    [self.lNameTxf resignFirstResponder];
    [self.cityNameTxf resignFirstResponder];
    [self.stateNameTxf resignFirstResponder];
    [self.emailAddrTxf resignFirstResponder];
    [self.countryNameTxf resignFirstResponder];
    [self.addressTxtView resignFirstResponder];
    [self.dobTxf resignFirstResponder];
    [self.userNameTxf resignFirstResponder];
    [self.passwordTxf resignFirstResponder];


    return YES;
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

- (IBAction)countryBtnTapp:(id)sender {
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



@end

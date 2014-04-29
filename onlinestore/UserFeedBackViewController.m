//
//  UserPreferenceViewController.m
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "UserFeedBackViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface UserFeedBackViewController ()

@end

@implementation UserFeedBackViewController

#define ALPHA                   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define NUMERIC                 @"1234567890"
#define ALPHA_NUMERIC           ALPHA NUMERIC

   NSCharacterSet *unacceptedInput;

@synthesize myScroolView,arrobj;

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
   // checkboxSelected = 0;
    
    strTem = @"Complaints";
    
     [self setHeaderView:YES];
    

    
    
    [[self.complaintTxtView layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.complaintTxtView layer] setBorderWidth:3];
    [[self.complaintTxtView layer] setCornerRadius:10];
    
    
    
    
    self.title = @"USER FEEDBACK";
    
     arrobj = [[NSMutableArray alloc]initWithObjects:
               @"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];

   
   // self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [myScroolView setScrollEnabled:YES];
    [myScroolView setContentSize:CGSizeMake(320, 1000)];
    
    [self dropDownBtnMethods];
   
}
#pragma DropDo Button

-(void)dropDownBtnMethods
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(250, 420, 180, 180) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [myScroolView addSubview:table];
    [table reloadData];
    table.hidden=YES;
}

- (IBAction)dropdownBtnTapp:(id)sender {
    
    table.hidden=NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrobj count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=[arrobj objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.ratingTxt.text = [arrobj objectAtIndex:indexPath.row];;
    table.hidden=YES;
    
}

#pragma ClickButton

- (IBAction)saveTapp:(id)sender {
    NSLog(@"%@",strTem);
    
   
    [self textfieldValidation];
  }



    
-(void)webServiceCalling{
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Userfeedback.json"];
    
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
    
    
    [dic setObject:@"858585" forKey:@"id"];
    
    [dic setObject:self.manufatureTxt.text forKey:@"manufacturer"];
    [dic setObject:self.storeTxt.text forKey:@"store"];
    [dic setObject:self.complaintTxtView.text forKey:@"Appreciation"];
    
    [dic setObject:self.ratingTxt.text forKey:@"rating"];
     // [dic setObject:self.complaintTxtView.text forKey:@"Appreciation"];
    //[dic setObject:self.complaintTxtView.text forKey:@"complaint_suggession"];
    
    
    
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
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
        }else{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.manufatureTxt resignFirstResponder];
    [self.applicationTxt resignFirstResponder];
    [self.storeTxt resignFirstResponder];
    [self.ratingTxt resignFirstResponder];
    [self.complaintTxtView resignFirstResponder];
    return YES;
}

#pragma TextFeld Validation

-(void)textfieldValidation
{
    if (([self.manufatureTxt.text isEqualToString:@""]) || ([self.storeTxt.text isEqualToString:@""]) || ([self.ratingTxt.text isEqualToString:@""]))
    {
        UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Please fill in the details." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        [ErrorAlert show];
    }
    
    else{
        //UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Success." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        //    [ErrorAlert show];
        [self webServiceCalling];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(([self.manufatureTxt.text isEqualToString:@""]) || ([self.storeTxt.text isEqualToString:@""]) || ([self.storeTxt.text isEqualToString:@""]))
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
        
    }
    
    return YES;
}

#pragma Textview Length
#define MAX_LENGTH 10
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText
{
    NSString *newText = [ self.complaintTxtView.text stringByReplacingCharactersInRange: range withString: replacementText ];
    if( [newText length]<= MAX_LENGTH ){
        return YES;
    }
    // case where text length > MAX_LENGTH
    self.complaintTxtView.text = [ newText substringToIndex: MAX_LENGTH ];
    return NO;
    
//    if([textView.text isEqualToString:@"\n"]) {
//           [textView resignFirstResponder];
//           return NO;
//        }
    
    
    
    return YES;
    
}
/*
- (IBAction)compSegTap:(id)sender {
    
//    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
//    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (self.complaintTxtView.hidden == NO) {
        
        self.complaintTxtView.hidden=YES;
        
        
        
        //toggle the correct view to be visible
        //[self.complaintTxtView setHidden:NO];
       // [self.complaintTxtView setHidden:YES];
    }
    else{
          self.complaintTxtView.hidden=NO;
        
        //toggle the correct view to be visible
        //[self.complaintTxtView setHidden:NO];
        //[self.complaintTxtView setHidden:YES];
    }
    
}

- (IBAction)apprSegTap:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 1) {
        //toggle the correct view to be visible
        //[self.complaintTxtView setHidden:NO];
        //[self.complaintTxtView setHidden:YES];
    }
    else{
        //toggle the correct view to be visible
       // [self.complaintTxtView setHidden:NO];
        //[self.complaintTxtView setHidden:YES];
    }
}

- (IBAction)suggSegTap:(id)sender {
    
//    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
//    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
//    
//    if (selectedSegment == 2) {
//        //toggle the correct view to be visible
//        //[self.complaintTxtView setHidden:NO];
//        //[self.complaintTxtView setHidden:YES];
//    }
//    else{
//        //toggle the correct view to be visible
//        //[self.complaintTxtView setHidden:NO];
//        //[self.complaintTxtView setHidden:YES];
//    }
    if (Segment.selectedSegmentIndex == 0) {
        self.complaintTxtView.hidden = NO;
        strTem=@"Sugg";
        
        
    }
   else if (Segment.selectedSegmentIndex == 1) {
        self.complaintTxtView.hidden = NO;
       strTem=@"App";

    }
   else if (Segment.selectedSegmentIndex == 2) {
       self.complaintTxtView.hidden = NO;
       strTem=@"Com";

   }

    
}*/

- (IBAction)segmentChanged:(id)sender{

    if (Segment.selectedSegmentIndex == 0) {
        self.complaintTxtView.text = @"Complaints";
    }
    else if (Segment.selectedSegmentIndex == 1)
    {
        self.complaintTxtView.text = @"Appreciation";
    }

}

- (IBAction)appreciation:(id)sender {
    if (Segment.selectedSegmentIndex == 0) {
        self.complaintTxtView.text = @"Complaints";
    }
   else if (Segment.selectedSegmentIndex == 1)
   {
       self.complaintTxtView.text = @"Appreciation";
   }
}

- (IBAction)complaints:(id)sender {
    
    
    if (Segment.selectedSegmentIndex == 0) {
        self.complaintTxtView.text = @"Complaints";
    }
    else if (Segment.selectedSegmentIndex == 1)
    {
        self.complaintTxtView.text = @"Appreciation";
    }
}

- (IBAction)cancelBtnTap:(id)sender {
    
    self.manufatureTxt.text = @"";
    self.storeTxt.text = @"";
    
    self.ratingTxt.text = @"";
    self.complaintTxtView.text = @"";
}


@end

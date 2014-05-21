//
//  PlanToByeViewController.m
//  onlinestore
//
//  Created by Envision on 23/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "PlanToByeViewController.h"
#import "WishDisplayViewController.h"
#import "MBProgressHUD.h"
#import "DataHandler.h"
#import "ASIFormDataRequest.h"
@interface PlanToByeViewController ()

@end
NSMutableDictionary *dic;

@implementation PlanToByeViewController
@synthesize scroolObj,arrObj;
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
    //[self setHeaderView:YES];
    [self dismissViewControllerAnimated:YES completion:nil];

    //self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
     self.navigationController.navigationBarHidden = YES;
    [scroolObj setScrollEnabled:YES];
    [scroolObj setContentSize:CGSizeMake(320, 1200)];
    arrObj = [[NSMutableArray alloc]initWithObjects:@"weekly",@"monthly",@"quarterly",@"half-yearly",@"once",@"when finds a good deal"  ,nil];
     [self dropDownBtnMethods];

}

#pragma DropDo Button

-(void)dropDownBtnMethods
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(170, 320, 100, 180) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [scroolObj addSubview:table];
    [table reloadData];
    table.hidden=YES;
}

- (IBAction)dropDownBtnTapp:(id)sender {
    table.hidden=NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrObj count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=[arrObj objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.frequencyTxf.text = [arrObj objectAtIndex:indexPath.row];;
    table.hidden=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)browseBtn:(id)sender {
    
    WishDisplayViewController *wish = [self.storyboard instantiateViewControllerWithIdentifier:@"WishDisplayViewController"];
    wish.arrWish=self.arrObj    ;
    [self presentViewController:wish animated:YES completion:nil];
    
   
}

- (IBAction)saveBtTap:(id)sender {
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Shopwishplatems.json"];
    
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
    
    
    //[dic setObject:@"SHOP_WISH_PLAN_MYCART" forKey:@"W"];
   // [dic setObject:@"8585" forKey:@"id"];
    [dic setObject:@"90490" forKey:@"userid"];
    [dic setObject:self.productNameTxf.text forKey:@"item"];
    [dic setObject:self.frequencyTxf.text forKey:@"frequancy"];
    [dic setObject:self.storeTxf.text forKey:@"storeid"];
    [dic setObject:self.quantityTxf.text forKey:@"quantity"];
    [dic setObject:self.brandTxf.text forKey:@"brand"];
    [dic setObject:self.modelTxf.text forKey:@"model"];
    [dic setObject:@"P" forKey:@"SHOP_WISH_PLAN_MYCART"];

    
    
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


#pragma TextFeld Validation

-(void)textfieldValidation
{
    if (([self.productNameTxf.text isEqualToString:@""]) || ([self.frequencyTxf.text isEqualToString:@""]) || ([self.quantityTxf.text isEqualToString:@""]) || ([self.brandTxf.text isEqualToString:@""]) || ([self.modelTxf.text isEqualToString:@""]) || ([self.storeTxf.text isEqualToString:@""]))
    {
        UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Please fill in the details." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        [ErrorAlert show];
    }
    
    else{
        //UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Alert!!"message:@"Success." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        //    [ErrorAlert show];
        //[self webServiceCalling];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    
    if( (textField == self.productNameTxf) ||(textField == self.brandTxf))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    if ((textField == self.quantityTxf) ||(textField == self.modelTxf) ||(textField == self.storeTxf)){
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

- (IBAction)cancelBtnTapp:(id)sender {
    
    self.productNameTxf.text = @"";
    self.frequencyTxf.text = @"";
    self.quantityTxf.text = @"";
    self.brandTxf.text = @"";
    self.modelTxf.text = @"";
    self.storeTxf.text = @"";
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.productNameTxf resignFirstResponder];
    [self.frequencyTxf resignFirstResponder];
    [self.quantityTxf resignFirstResponder];
    [self.brandTxf resignFirstResponder];
    [self.modelTxf resignFirstResponder];
    [self.storeTxf resignFirstResponder];
    
    
    
    return YES;
}
@end

//
//  LoginViewController.m
//  onlinestore
//
//  Created by Envision on 19/03/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "HomeViewController1.h"
#import "DataHandler.h"

#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "SignUpViewController.h"


#import "SideMenuViewController.h"
#import "IIViewDeckController.h"
#import "SignUpViewController.h"




@interface LoginViewController ()
@end

static NSString * const gplusKClientId =@"282843127091-d49rbd16o59i2gk0uv1qc0mjnphhrla1.apps.googleusercontent.com";
static NSString * const twitterConsumerKey =@"dJKq4ValwLXtGBqEiNE44Q";
static NSString * const twitterSecretKey =@"Nj79mSfbr525OwgE7igZeBqV0mP7UHQj082ZTIoGcM";



GPPSignIn *signIn;

@implementation LoginViewController

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
    [self showIntroViews];
    
    [self googlePlusInit];
    [self twitterInit];
    
    
	// Do any additional setup after loading the view.
}

- (IBAction)loginButtonTap:(id)sender{

    
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Fetchbyuser/%@",self.username.text];
    
    
    NSURL *apiUrl = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:apiUrl];
    [request setDelegate:self];
    [request startAsynchronous];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Authenticating..Please wait...";

}

- (IBAction)signUpTap:(id)sender {
    
    SignUpViewController *signUpViewController=[[SignUpViewController alloc]initWithNibName:@"SignUpViewController1" bundle:nil];
    

    [self.navigationController pushViewController:signUpViewController animated:YES];
    
//    DemoViewController *demo = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
//   [self.navigationController pushViewController:demo animated:YES];
}




- (IBAction)guestButtonTap:(id)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    HomeViewController1 *homeViewController = [sb instantiateViewControllerWithIdentifier:@"HomeViewController1"];
    
    
    
    
    SideMenuViewController *sideMenuViewController=[[SideMenuViewController alloc] initWithNibName:@"SideMenuViewController" bundle:nil];
    
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:homeViewController
                                                                                    leftViewController:sideMenuViewController];
    deckController.leftSize = 120;
    //deckController.leftSize=1024-275;
    [self.navigationController pushViewController:deckController animated:YES];
    
    
    
    
    
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
        NSMutableArray *responseArr = [NSJSONSerialization
                                      JSONObjectWithData:request.responseData
                                      options:NSJSONReadingMutableLeaves
                                      error:&jsonError];
        
        if ([responseArr count]>0)
        {
            
            NSMutableDictionary *userDetailsDic=[responseArr objectAtIndex:0];
            
            
            if ([[userDetailsDic objectForKey:@"password"] isEqualToString:self.password.text]) {
               
                
                [DataHandler defaultHandler].userDetails=userDetailsDic;
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
                HomeViewController1 *vc = [sb instantiateViewControllerWithIdentifier:@"HomeViewController1"];
                [self.navigationController pushViewController:vc animated:YES];


            }else{
            
                NSString *message=[NSString stringWithFormat:@"Wrong Password.Please Try Again.."];
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];

            
            }
           
            
           
            
        }else{
            
            NSString *message=[NSString stringWithFormat:@"Invalid Username.Please try later.."];
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



-(void)googlePlusInit{

    signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    //signIn.shouldFetchGoogleUserEmail = YES;  // Uncomment to get the user's email
    
    // You previously set kClientId in the "Initialize the Google+ client" step
    signIn.clientID = gplusKClientId;
    
    // Uncomment one of these two statements for the scope you chose in the previous step
   // signIn.scopes = @[ kGTLAuthScopePlusLogin];  // "https://www.googleapis.com/auth/plus.login" scope
    signIn.scopes = @[ @"profile" ];            // "profile" scope
    
    // Optional: declare signIn.actions, see "app activities"
    signIn.delegate = self;

}

- (void)showIntroViews {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Welcome";
    //page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"intro1.png"];
    //page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    //page2.title = @"This is page 2";
    //page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"intro2.png"];
    //page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    //page3.title = @"This is page 3";
    //page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"intro3.png"];
    //page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    //page4.title = @"This is page 4";
    //page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"intro4.png"];
    //page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroPage *page5 = [EAIntroPage page];
    //page5.title = @"This is page 5";
    //page4.desc = sampleDescription4;
    page5.bgImage = [UIImage imageNamed:@"intro5.png"];
    //page5.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title5"]];
    
    EAIntroPage *page6 = [EAIntroPage page];
    //page5.title = @"This is page 5";
    //page4.desc = sampleDescription4;
    page6.bgImage = [UIImage imageNamed:@"intro6.png"];
    //page5.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title5"]];
    
    EAIntroPage *page7 = [EAIntroPage page];
    //page5.title = @"This is page 5";
    //page4.desc = sampleDescription4;
    page7.bgImage = [UIImage imageNamed:@"intro7.png"];
    //page5.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title5"]];
    
    EAIntroPage *page8 = [EAIntroPage page];
    //page5.title = @"This is page 5";
    //page4.desc = sampleDescription4;
    page8.bgImage = [UIImage imageNamed:@"intro8.png"];
    //page5.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title5"]];
    

    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3,page4,page5,page6,page7,page8]];
    [intro setDelegate:self];
    
    [intro showInView:self.view animateDuration:0.3];
}
#pragma mark -
#pragma mark G+ methods
- (IBAction)googlePlusLoginButtonTap:(id)sender{

    [signIn authenticate];

}

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if (error) {
        // Do some error handling here.
    } else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        HomeViewController *vc =[sb instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        

    }
}
-(void)refreshInterfaceBasedOnSignIn
{
    if ([[GPPSignIn sharedInstance] authentication]) {
        // The user is signed in.
        self.signInButton.hidden = YES;
        // Perform other actions here, such as showing a sign-out button
    } else {
        self.signInButton.hidden = NO;
        // Perform other actions here
    }
}
- (void)didDisconnectWithError:(NSError *)error{

}

#pragma mark -
#pragma mark Facebook methods
- (IBAction)fbLoginButtonTap:(id)sender
{
    // If the session state is any of the two "open" states when the button is clicked
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        
        // Close the session and remove the access token from the cache
        // The session state handler (in the app delegate) will be called automatically
        [FBSession.activeSession closeAndClearTokenInformation];
        
        // If the session state is not any of the two "open" states when the button is clicked
    } else {
        // Open a session showing the user the login UI
        // You must ALWAYS ask for basic_info permissions when opening a session
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info",@"email"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             
             // Retrieve the app delegate
          //#raj   AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
             // Call the app delegate's sessionStateChanged:state:error method to handle session state changes
           //#raj   [appDelegate sessionStateChanged:session state:state error:error];
             
             
             
             if (FBSession.activeSession.isOpen) {
                 
                 [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                     if (!error) {
                         
                         NSLog(@"USER NAME %@",user.name);
                         NSLog(@"USER EMAIL %@",[user objectForKey:@"email"]);
                         NSLog(@"USER  %@",user);
                         
                         UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
                         HomeViewController *vc =[sb instantiateViewControllerWithIdentifier:@"HomeViewController"];
                         [self.navigationController pushViewController:vc animated:YES];

                     }
                 }];
             }
             
             
             
             
         }];
    }
}

#pragma mark -
#pragma mark Twitter methods

-(void)twitterInit{
    
    [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:twitterConsumerKey andSecret:twitterSecretKey];
    [[FHSTwitterEngine sharedEngine]setDelegate:self];
    [[FHSTwitterEngine sharedEngine]loadAccessToken];
}

-(IBAction)twitterLoginButtonTap:(id)sender {
    UIViewController *loginController = [[FHSTwitterEngine sharedEngine]loginControllerWithCompletionHandler:^(BOOL success) {
        NSLog(success?@"L0L success":@"O noes!!! Loggen faylur!!!");
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        HomeViewController *vc =[sb instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:vc animated:YES];        
    }];
    [self presentViewController:loginController animated:YES completion:nil];

}

- (void)storeAccessToken:(NSString *)accessToken {
    [[NSUserDefaults standardUserDefaults]setObject:accessToken forKey:@"SavedAccessHTTPBody"];
}

- (NSString *)loadAccessToken {
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"SavedAccessHTTPBody"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//@end

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    [self animateScrollViewtoXandY:0 :0];
    
    return YES;
}
- (IBAction)saveBtnTapp:(id)sender {
}

#pragma mark scroll

-(void)animateScrollViewtoXandY:(double)x :(double)y{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.view.frame=CGRectMake(x, y,self.view.frame.size.width,self.view.frame.size.height);
    [UIView commitAnimations];
    
    
}


#pragma mark -TableView Delegate methods



-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.username) {
        [self animateScrollViewtoXandY:0 :-110];
    }
    else if (textField == self.password) {
        [self animateScrollViewtoXandY:0 :-120];
               
    }
}



@end


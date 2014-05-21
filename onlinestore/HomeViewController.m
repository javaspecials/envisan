//
//  ViewController.m
//  SampleTiles
//
//  Created by Rajasekhar on 19/03/14.
//
//

#import "HomeViewController.h"
#import "TileView.h"
#import "CategoriesViewController.h"
#import "ProductsViewController.h"
#import "BuildingMapViewController.h"
#import "PriceAndCompareViewController.h"
#import "BrowsAndShopViewController.h"
#import "UserSettingsViewController.h"
#import "UserProfileViewController.h"
#import "UserFeedBackViewController.h"
#import "UsereProDisplayViewController.h"
#import "CouponsViewController.h"
#import "LandingWishListViewController.h"
#import "UserProductSelectionListViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self setHeaderView:YES];
    
    NSMutableArray *iconsLeft=[[NSMutableArray alloc] init];
    
    
    NSMutableDictionary *tempLeftDic1=[[NSMutableDictionary alloc] init];
    [tempLeftDic1 setObject:@"1" forKey:@"id"];
    [tempLeftDic1 setObject:@"Offers & Deals" forKey:@"name"];
    [tempLeftDic1 setObject:@"browse_n_shop.png" forKey:@"iconImage"];
    [tempLeftDic1 setObject:@"#1996E6" forKey:@"color"];
    [iconsLeft addObject:tempLeftDic1];
    
    NSMutableDictionary *tempLeftDic2=[[NSMutableDictionary alloc] init];
    [tempLeftDic2 setObject:@"2" forKey:@"id"];
    [tempLeftDic2 setObject:@"Map & Mall" forKey:@"name"];
    [tempLeftDic2 setObject:@"Compare Price.png" forKey:@"iconImage"];
    [tempLeftDic2 setObject:@"#FF7419" forKey:@"color"];
    [iconsLeft addObject:tempLeftDic2];
    
    NSMutableDictionary *tempLeftDic3=[[NSMutableDictionary alloc] init];
    [tempLeftDic3 setObject:@"3" forKey:@"id"];
    [tempLeftDic3 setObject:@"Price And Compare" forKey:@"name"];
    [tempLeftDic3 setObject:@"User Profile.png" forKey:@"iconImage"];
    [tempLeftDic3 setObject:@"#C1392B" forKey:@"color"];
    [iconsLeft addObject:tempLeftDic3];
    
    NSMutableDictionary *tempLeftDic4=[[NSMutableDictionary alloc] init];
    [tempLeftDic4 setObject:@"4" forKey:@"id"];
    [tempLeftDic4 setObject:@"Userr Preferrence" forKey:@"name"];
    [tempLeftDic4 setObject:@"User Preference.png" forKey:@"iconImage"];
    [tempLeftDic4 setObject:@"#FF000D" forKey:@"color"];
    [iconsLeft addObject:tempLeftDic4];
    
    
    
    
    
    
    
    

    NSMutableArray *iconsMiddle=[[NSMutableArray alloc] init];
    
    
    NSMutableDictionary *tempMiddleDic1=[[NSMutableDictionary alloc] init];
    [tempMiddleDic1 setObject:@"5" forKey:@"id"];
    [tempMiddleDic1 setObject:@"" forKey:@"name"];
    [tempMiddleDic1 setObject:@"Map And Mall.png" forKey:@"iconImage"];
    [tempMiddleDic1 setObject:@"#F8BD19" forKey:@"color"];
    [iconsMiddle addObject:tempMiddleDic1];
    
    NSMutableDictionary *tempMiddleDic2=[[NSMutableDictionary alloc] init];
    [tempMiddleDic2 setObject:@"6" forKey:@"id"];
    [tempMiddleDic2 setObject:@"" forKey:@"name"];
    [tempMiddleDic2 setObject:@"Offer and Deals.png" forKey:@"iconImage"];
    [tempMiddleDic2 setObject:@"#86B91C" forKey:@"color"];
    [iconsMiddle addObject:tempMiddleDic2];
    
    NSMutableDictionary *tempMiddleDic3=[[NSMutableDictionary alloc] init];
    [tempMiddleDic3 setObject:@"7" forKey:@"id"];
    [tempMiddleDic3 setObject:@"Shop Assistant" forKey:@"name"];
    [tempMiddleDic3 setObject:@"Coupons.png" forKey:@"iconImage"];
    [tempMiddleDic3 setObject:@"#7658F8" forKey:@"color"];
    [iconsMiddle addObject:tempMiddleDic3];
    
    NSMutableDictionary *tempMiddleDic4=[[NSMutableDictionary alloc] init];
    [tempMiddleDic4 setObject:@"8" forKey:@"id"];
    [tempMiddleDic4 setObject:@"Shop" forKey:@"name"];
    [tempMiddleDic4 setObject:@"Loyalty Program.png" forKey:@"iconImage"];
    [tempMiddleDic4 setObject:@"#FF000D" forKey:@"color"];
    [iconsMiddle addObject:tempMiddleDic4];
    
  
    NSMutableArray *iconsRight=[[NSMutableArray alloc] init];
    
    
    NSMutableDictionary *tempRightDic1=[[NSMutableDictionary alloc] init];
    [tempRightDic1 setObject:@"9" forKey:@"id"];
    [tempRightDic1 setObject:@"Browse & Shop" forKey:@"name"];
    [tempRightDic1 setObject:@"Review Product.png" forKey:@"iconImage"];
    [tempRightDic1 setObject:@"#F8BD19" forKey:@"color"];
    [iconsRight addObject:tempRightDic1];
    
    NSMutableDictionary *tempRightDic2=[[NSMutableDictionary alloc] init];
    [tempRightDic2 setObject:@"10" forKey:@"id"];
    [tempRightDic2 setObject:@"Review Products" forKey:@"name"];
    [tempRightDic2 setObject:@"User Settings.png" forKey:@"iconImage"];
    [tempRightDic2 setObject:@"#86B91C" forKey:@"color"];
    [iconsRight addObject:tempRightDic2];
    
    NSMutableDictionary *tempRightDic3=[[NSMutableDictionary alloc] init];
    [tempRightDic3 setObject:@"11" forKey:@"id"];
    [tempRightDic3 setObject:@"Shop Assistant" forKey:@"name"];
    [tempRightDic3 setObject:@"ShopAssitant.png" forKey:@"iconImage"];
    [tempRightDic3 setObject:@"#7658F8" forKey:@"color"];
    [iconsRight addObject:tempRightDic3];
    
    NSMutableDictionary *tempRightDic4=[[NSMutableDictionary alloc] init];
    [tempRightDic4 setObject:@"12" forKey:@"id"];
    [tempRightDic4 setObject:@"Shop" forKey:@"name"];
    [tempRightDic4 setObject:@"user feedback.png" forKey:@"iconImage"];
    [tempRightDic4 setObject:@"#FF000D" forKey:@"color"];
    [iconsRight addObject:tempRightDic4];
    

    
    
    
    for (UIView *v in [tilesScrollView subviews]) {
        [v removeFromSuperview];
    }
    UIView *tempView=[self getScrollingContentView:iconsLeft:iconsRight:iconsMiddle];
    [tilesScrollView addSubview:tempView];
    tilesScrollView.contentSize =CGSizeMake(tempView.frame.size.width, tempView.frame.size.height);

    
}

-(UIView *)getScrollingContentView:(NSArray *)leftcontents:(NSArray*)rightContents:(NSArray*)middleContents{
    
   
    int x_position=0;
    int y_position=0;
    
    UIView *tempView=[[UIView alloc] init];
    TileView *tileView;
    
    
    for (int i=0; i<=2; i++) {
    
     y_position=0;
        
        for (int j=0;j<[leftcontents count];j++) {
          
          NSDictionary *contentsDic;
          
          if (i==0) {
              contentsDic=[leftcontents objectAtIndex:j];

          }else if(i==1){
              contentsDic=[middleContents objectAtIndex:j];
          }else{
              contentsDic=[rightContents objectAtIndex:j];
          }
          
            
            tileView=[[TileView alloc]init];
            tileView.itemView.frame=CGRectMake(x_position,y_position,tileView.itemView.frame.size.width,tileView.itemView.frame.size.height);
            tileView.colorView.backgroundColor=[self colorFromHexString:[contentsDic objectForKey:@"color"]];
            tileView.title.text=[NSString stringWithFormat:@"%@",[contentsDic objectForKey:@"name"]];
            tileView.button.tag=[[contentsDic objectForKey:@"id"] intValue];
           
             [tileView.button addTarget:self action:@selector(categoryClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [tileView.imageView setImage:[UIImage imageNamed:[contentsDic objectForKey:@"iconImage"]]];
            
            [tempView addSubview:tileView.itemView];
           
            y_position=y_position+tileView.itemView.frame.size.height;
           
        }
      
         x_position=x_position+tileView.itemView.frame.size.width;
        
    }
    
    tempView.frame=CGRectMake(0, 0, x_position,y_position );
    return tempView;
}

-(UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


-(void)categoryClick:(id)sender{
    
    UIButton *button=sender;
    
    int index=button.tag;
    NSLog(@"%d",index);
    
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    
    
    switch (index) {
//        case 1:{
//            CategoriesViewController *vc =[sb instantiateViewControllerWithIdentifier:@"CategoriesViewController"];
//            [self.navigationController pushViewController:vc animated:YES];
//            }
//            break;
//        case 2:{
//            BuildingMapViewController *vc =[sb instantiateViewControllerWithIdentifier:@"BuildingMapViewController"];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
            
        case 1:{
            BrowsAndShopViewController *vc =[sb instantiateViewControllerWithIdentifier:@"BrowsAndShopViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2:{
            PriceAndCompareViewController *vc =[sb instantiateViewControllerWithIdentifier:@"PriceAndCompareViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 3:{
            UserProfileViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 4:{
            UserProductSelectionListViewController *vc =[sb instantiateViewControllerWithIdentifier:@"Wish1ViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
 
        
        case 5:{
            CategoriesViewController *vc =[sb instantiateViewControllerWithIdentifier:@"CategoriesViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            
            
            
        case 6:{
            CouponsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"OffersAndDealsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;


            
        case 9:{
            ProductsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"ProductsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 10:{
            UserSettingsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserrSettingsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
       

            
               case 12:{
            UserFeedBackViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserPreferenceViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        
            
        default:{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Comming Soon.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            }
            break;
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end

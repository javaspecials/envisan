//
//  ViewController.m
//  onlinestore
//
//  Created by Rajasekhar on 2/18/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoryView.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "ItemDetailViewController.h"

@interface CategoriesViewController ()

@end

NSMutableArray *categoriesData;
NSMutableArray *itemsData;
NSMutableArray *promoItemsData;

int selectedCategoryIndex=0;
int selectedPromotionItemIndex=0;
int selectedItemIndex=0;

ASIFormDataRequest *promoiItemsRequest;
ASIFormDataRequest *itemsRequest;
ASIFormDataRequest *categoriesRequest;

@implementation CategoriesViewController



#pragma mark -
#pragma mark View Life Cycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setHeaderView:YES];
    
    categories=[[NSMutableArray alloc] init];
    promotionalItems=[[NSMutableArray alloc] init];
    items=[[NSMutableArray alloc] init];
    
    
    
    ////WEBSERVICE CALL
            NSURL *url = [NSURL URLWithString:@"http://68.169.52.119/categoryinfo.json"];
            categoriesRequest = [ASIFormDataRequest requestWithURL:url];
            [categoriesRequest setDelegate:self];
            [categoriesRequest startAsynchronous];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"Loading Shop Items..";
    
  
    
//
//   MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//   hud.labelText = @"Loading Shop Items..";
//   [self prepareDataFromJSONData:[self dataWithLocalFileContents:@"catlog.json"]];


}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Auxiliary Methods




-(void)drawMainCategories{
    
    
    for (int i=0; i<[categoriesData count]; i++) {
        NSMutableDictionary *tempDic=[[NSMutableDictionary alloc] init];
        
        
        [tempDic setObject:[[categoriesData objectAtIndex:i] objectForKey:@"catg_img"] forKey:@"imageURL"];
        [tempDic setObject:[[categoriesData objectAtIndex:i] objectForKey:@"catg_id"] forKey:@"id"];
        [tempDic setObject:[[categoriesData objectAtIndex:i] objectForKey:@"catg_name"] forKey:@"name"];
        
        [categories addObject:tempDic];
    }
    
    
    for (UIView *v in [categoriesScrollView subviews]) {
        [v removeFromSuperview];
    }
    UIView *tempView=[self getCategoriesScrollingContentView:categories buttonAction:@"categoryClick"];
    [categoriesScrollView addSubview:tempView];
    categoriesScrollView.contentSize =CGSizeMake(tempView.frame.size.width, tempView.frame.size.height);
}


-(void)drawItems{
    
    [items removeAllObjects];
    
    for (int i=0; i<[itemsData count]; i++) {
        NSMutableDictionary *tempDic=[[NSMutableDictionary alloc] init];
        
        
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"skuurl"] forKey:@"imageURL"];
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"id"] forKey:@"id"];
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"skulongdesc"] forKey:@"name"];
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"promo_msg"] forKey:@"description"];
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"cp"] forKey:@"cp"];
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"mrp"] forKey:@"mrp"];
        [tempDic setObject:[[itemsData objectAtIndex:i] objectForKey:@"sp"] forKey:@"sp"];
        [items addObject:tempDic];
    }
    
    
    for (UIView *v in [itemsScrollView subviews]) {
        [v removeFromSuperview];
    }
    UIView *tempView=[self getCategoriesScrollingContentView:items buttonAction:@"itemClick"];;
    [itemsScrollView addSubview:tempView];
    itemsScrollView.contentSize =CGSizeMake(tempView.frame.size.width, tempView.frame.size.height);
   
}

-(void)drawPromoItems{
    
    [promotionalItems removeAllObjects];
    
    for (int i=0; i<[promoItemsData count]; i++) {
        NSMutableDictionary *tempDic=[[NSMutableDictionary alloc] init];
        
        NSString *bleID=[[promoItemsData objectAtIndex:i] objectForKey:@"ble_id"];
        if (![bleID isEqualToString:@"0"]) {
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"skuurl"] forKey:@"imageURL"];
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"id"] forKey:@"id"];
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"skulongdesc"] forKey:@"name"];
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"promo_msg"] forKey:@"description"];
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"cp"] forKey:@"cp"];
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"mrp"] forKey:@"mrp"];
            [tempDic setObject:[[promoItemsData objectAtIndex:i] objectForKey:@"sp"] forKey:@"sp"];
            [promotionalItems addObject:tempDic];

        }
       
    }
    
    
    for (UIView *v in [promotionalItemsScrollView subviews]) {
        [v removeFromSuperview];
    }
    UIView *tempView=[self getCategoriesScrollingContentView:promotionalItems buttonAction:@"promoItemClick"];;
    [promotionalItemsScrollView addSubview:tempView];
    promotionalItemsScrollView.contentSize =CGSizeMake(tempView.frame.size.width, tempView.frame.size.height);
    
}


/*-(void)drawPromotionalItems{
    
   NSArray *tempSubCategories=[[categoriesData objectAtIndex:selectedCategoryIndex] objectForKey:@"promoitems"];
    
    [promotionalItems removeAllObjects];
    for (int i=0; i<[tempSubCategories count]; i++) {
        NSMutableDictionary *tempDic=[[NSMutableDictionary alloc] init];
        
        [tempDic setObject:[[tempSubCategories objectAtIndex:i] objectForKey:@"itemurl"] forKey:@"imageURL"];
        //[tempDic setObject:[[tempSubCategories objectAtIndex:i] objectForKey:@"subcatid"] forKey:@"id"];
        [tempDic setObject:[NSString stringWithFormat:@"%i",i+200000] forKey:@"id"];
        [tempDic setObject:[[tempSubCategories objectAtIndex:i] objectForKey:@"name"] forKey:@"name"];
        
        [promotionalItems addObject:tempDic];
    }
    
    
    for (UIView *v in [promotionalItemsScrollView subviews]) {
        [v removeFromSuperview];
    }
    UIView *tempView=[self getCategoriesScrollingContentView:promotionalItems];
    [promotionalItemsScrollView addSubview:tempView];
    promotionalItemsScrollView.contentSize =CGSizeMake(tempView.frame.size.width, tempView.frame.size.height);
}*/

//-(NSInteger) pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component.


-(UIView *)getCategoriesScrollingContentView:(NSArray *)contents buttonAction:(NSString *)buttonAction{
    
    
    
    int x_position=0;
    int y_position=0;
    
    UIView *tempView=[[UIView alloc] init];
    CategoryView *categoryItem;
    
    
    for (int i=0;i<[contents count]; i++) {
        
        NSDictionary *categoryDic=[contents objectAtIndex:i];
        
        
        categoryItem=[[CategoryView alloc]init];
        categoryItem.frame=CGRectMake(x_position,y_position, categoryItem.itemView.frame.size.width, categoryItem.itemView.frame.size.height);
        categoryItem.title.text=[NSString stringWithFormat:@"%@",[categoryDic objectForKey:@"name"]];
        [categoryItem setLazyImage:[NSString stringWithFormat:@"%@",[categoryDic objectForKey:@"imageURL"]]];
        
        
        categoryItem.button.tag=i;//[[categoryDic objectForKey:@"id"] intValue];
        
        if ([buttonAction isEqualToString:@"categoryClick"]) {
            [categoryItem.button addTarget:self action:@selector(categoryClick:) forControlEvents:UIControlEventTouchUpInside];
            

        }else if([buttonAction isEqualToString:@"itemClick"]){
            [categoryItem.button addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        }else if([buttonAction isEqualToString:@"promoItemClick"]){
            [categoryItem.button addTarget:self action:@selector(promoItemClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        
        [tempView addSubview:categoryItem];
        x_position=x_position+categoryItem.itemView.frame.size.width;
        
    }
    
    tempView.frame=CGRectMake(0, 0, x_position,categoryItem.frame.size.height );
    categoryItem=nil;
    return tempView;
}






-(NSData *)dataWithLocalFileContents:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    return data;
}


#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    if (itemsRequest==request) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (request.responseStatusCode == 400) {
            
        } else if (request.responseStatusCode == 403) {
            
        } else if (request.responseStatusCode == 200) {
            
            
            
            [self prepareDataFromJSONDataForitemList:request.responseData];
            
            
           

            
            
        } else {
            NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
    }else if(categoriesRequest==request){
        
        //Categories
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (request.responseStatusCode == 400) {
            
        } else if (request.responseStatusCode == 403) {
            
        } else if (request.responseStatusCode == 200) {
            
            
            [self prepareDataFromJSONData:request.responseData];
           // [self prepareDataFromJSONDataForitemList:request.responseData];
            
            
            
            NSDictionary *categoryDic=[categories objectAtIndex:selectedCategoryIndex];
            int categoryId=[[categoryDic objectForKey:@"id"] intValue];
            
            [self sendItemsRequestWithCategoryId:categoryId];
            [self sendPromoItemsRequestWithCategoryId:categoryId];
            
            
        } else {
            NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }else{
    
        //Promo Items
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (request.responseStatusCode == 400) {
            
        } else if (request.responseStatusCode == 403) {
            
        } else if (request.responseStatusCode == 200) {
            
            
            
            [self prepareDataFromJSONDataForPromoItemList:request.responseData];
            
            
            
            
            
            
        } else {
            NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    
    
    
    
    }
    
    
    
    
  
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)prepareDataFromJSONData:(NSData *)data{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSError *jsonError;
    NSDictionary *responseDict = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:NSJSONReadingMutableLeaves
                                  error:&jsonError];
    
    if (responseDict!=nil)
    {
        //NSLog(@"responseDict is %@",[responseDict valueForKey:@"catg_name"]);
        
        [categoriesData removeAllObjects];
       // categoriesData=[[NSMutableArray alloc] init];
        categoriesData=[NSJSONSerialization
                        JSONObjectWithData:data
                        options:NSJSONReadingMutableLeaves
                        error:&jsonError];
        
        
        [self drawMainCategories];
       // [self drawItems];
        //[self drawPromotionalItems];
        
        
    }else{
        
        NSString *message=[NSString stringWithFormat:@"Problem in Fectching Shop Items.Please try later.."];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
}


#pragma mark -
#pragma mark Button Action Methods
-(IBAction)backClick:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)categoryClick:(id)sender{
    
    UIButton *button=sender;
    
    int index=button.tag;
    
    selectedCategoryIndex=index;
    
    
    
    NSDictionary *categoryDic=[categories objectAtIndex:selectedCategoryIndex];
    int categoryId=[[categoryDic objectForKey:@"id"] intValue];
  
    [self sendItemsRequestWithCategoryId:categoryId];
    [self sendPromoItemsRequestWithCategoryId:categoryId];
    
   
}
-(void)itemClick:(id)sender{
    
    UIButton *button=sender;
    
    int index=button.tag;
    
    NSLog(@"Selected ID %i",index);
    
    
    NSDictionary *itemDic=[items objectAtIndex:index];
   // int itemId=[[itemDic objectForKey:@"id"] intValue];
    

    
//    NSDictionary *tempItem=[[[categoriesData objectAtIndex:selectedCategoryIndex] objectForKey:@"items"] objectAtIndex:selectedItemIndex];
//    NSLog(@"%@",tempItem);
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ItemDetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    vc.itemDetailDictionary=itemDic;
    [self.navigationController pushViewController:vc animated:YES];
    
    

}

-(void)promoItemClick:(id)sender{
    
    UIButton *button=sender;
    
    int index=button.tag;
    
    NSLog(@"Selected ID %i",index);
    
    
    NSDictionary *itemDic=[items objectAtIndex:index];
   // int itemId=[[itemDic objectForKey:@"id"] intValue];
    
    
    
    //    NSDictionary *tempItem=[[[categoriesData objectAtIndex:selectedCategoryIndex] objectForKey:@"items"] objectAtIndex:selectedItemIndex];
    //    NSLog(@"%@",tempItem);
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ItemDetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    vc.itemDetailDictionary=itemDic;
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}



-(void)sendItemsRequestWithCategoryId:(int)categoryId{

    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://68.169.52.119/Skumastrbycatg/%i",categoryId]];
    itemsRequest = [ASIHTTPRequest requestWithURL:url];
    
    
    [itemsRequest setDelegate:self];
    [itemsRequest startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Shop Items..";



}

-(void)sendPromoItemsRequestWithCategoryId:(int)categoryId{
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://68.169.52.119/Skumastrbycatg/%i",categoryId]];
    promoiItemsRequest = [ASIHTTPRequest requestWithURL:url];
    
    
    [promoiItemsRequest setDelegate:self];
    [promoiItemsRequest startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Shop Items..";
    
    
    
}


-(void)prepareDataFromJSONDataForitemList:(NSData *)data{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSError *jsonError;
    NSDictionary *responseDict = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:NSJSONReadingMutableLeaves
                                  error:&jsonError];
    
    if (responseDict!=nil)
    {
        //NSLog(@"responseDict is %@",[responseDict valueForKey:@"catg_name"]);
        
        if (itemsData) {
            NSMutableArray *emptyArray = [NSMutableArray new];
            itemsData = emptyArray;
            //[itemsData removeAllObjects];
        }
        
        
        // categoriesData=[[NSMutableArray alloc] init];
        itemsData=[NSJSONSerialization
                        JSONObjectWithData:data
                        options:NSJSONReadingMutableLeaves
                        error:&jsonError];
        
        
        //[self drawsubcategories];
         [self drawItems];
        //[self drawPromotionalItems];
        
        
    }else{
        
        NSString *message=[NSString stringWithFormat:@"Problem in Fectching Shop Items.Please try later.."];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
}


-(void)prepareDataFromJSONDataForPromoItemList:(NSData *)data{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSError *jsonError;
    NSDictionary *responseDict = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:NSJSONReadingMutableLeaves
                                  error:&jsonError];
    
    if (responseDict!=nil)
    {
        //NSLog(@"responseDict is %@",[responseDict valueForKey:@"catg_name"]);
        
        if (promoItemsData) {
            NSMutableArray *emptyArray = [NSMutableArray new];
            promoItemsData = emptyArray;
            //[itemsData removeAllObjects];
        }
        
        
        // categoriesData=[[NSMutableArray alloc] init];
        promoItemsData=[NSJSONSerialization
                   JSONObjectWithData:data
                   options:NSJSONReadingMutableLeaves
                   error:&jsonError];
        
        
        //[self drawsubcategories];
        [self drawPromoItems];
        //[self drawPromotionalItems];
        
        
    }else{
        
        NSString *message=[NSString stringWithFormat:@"Problem in Fectching Shop Items.Please try later.."];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
}

-(void)dealloc{

    categories=nil;
    items=nil;
    promotionalItems=nil;
    categoriesData=nil;
    itemsData=nil;


}



@end

//
//  DataHandler.h
//  RetailSales
//
//  Created by Rajasekhar on 07/01/13.
//
//

#import <Foundation/Foundation.h>

@interface DataHandler : NSObject{
    NSMutableArray *cartItems;
    
    NSMutableDictionary *userDetails;
    
}
+ (DataHandler *)defaultHandler;
@property(nonatomic,retain,readwrite) NSMutableArray *cartItems;
@property(nonatomic,retain,readwrite)  NSMutableDictionary *userDetails;

@end

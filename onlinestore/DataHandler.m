//
//  DataHandler.m
//  RetailSales
//
//  Created by Rajasekhar on 07/01/13.
//
//

#import "DataHandler.h"

@implementation DataHandler
@synthesize cartItems,userDetails;
static DataHandler *handler;

+(void)initialize{
    
    handler = [[DataHandler alloc] init];
}

+ (DataHandler *)defaultHandler {
	return handler;
}

-(id)init
{
    if (self = [super init])
    {
        // Initialization code here
        cartItems=[[NSMutableArray alloc] init];
        userDetails=[[NSMutableDictionary alloc]init];

        
    }
    return self;
}


@end

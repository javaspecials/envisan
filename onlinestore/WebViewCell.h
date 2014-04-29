//
//  TwoPartCell.h
//
//
//  Created by Rajasekhar 
//

#import <UIKit/UIKit.h>



@interface WebViewCell : UITableViewCell<UIWebViewDelegate>{
    
    
    IBOutlet UIWebView *webView;
  }

@property (nonatomic,retain) IBOutlet UIWebView *webView;



@end

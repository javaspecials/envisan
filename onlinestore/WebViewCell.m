//
//  TwoPartCell.m
//  EShop
//
//  Created by Rajasekhar on 27/12/12.
//  Copyright (c) 2012
//

#import "WebViewCell.h"

@implementation WebViewCell
@synthesize webView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
      
    }
    return self;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *contentHeight = [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('html')[0].offsetHeight"];
    self.webView.frame = CGRectMake(self.webView.frame.origin.x,self.webView.frame.origin.y, self.webView.frame.size.width, [contentHeight floatValue]);
    self.contentView.frame= CGRectMake(self.webView.frame.origin.x,self.webView.frame.origin.y, self.webView.frame.size.width, [contentHeight floatValue]);
    
    NSLog(@"%@",contentHeight);
    
}


@end

//
//  ANWKViewController.m
//  ANWebViewTest
//
//  Created by Admin on 05.06.18.
//  Copyright © 2018 Alena Tarasenko. All rights reserved.
//
//
#import "ANWKViewController.h"


@interface ANWKViewController ()

@property (weak,nonatomic) WKWebView * webKView;
@property (weak,nonatomic) NSString * urlstring;

@end

@implementation ANWKViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    self.webKView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webKView .frame = self.view.bounds;
    self.webKView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.webKView ];
    self.webKView.navigationDelegate = self;
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(getPathString:)
                               name:ANStartViewControllerLoadPathNotification
                             object:nil];
  
}

-(void)getPathString:(NSNotification *) notification{
    
    NSLog(@"%@", notification.userInfo);
    self.pathString = [notification.userInfo valueForKey:@"ANStartViewControllerLoadPathKey"];
    self.urlstring = [NSString stringWithFormat:@"https://career.ru/vacancy/%@",self.pathString];
    NSURL * url = [[NSURL alloc] initWithString:self.urlstring];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webKView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    if([webView.URL.absoluteString isEqualToString:self.urlstring]){
        decisionHandler(WKNavigationResponsePolicyAllow);
    }
    else{
         decisionHandler(WKNavigationResponsePolicyCancel);
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end

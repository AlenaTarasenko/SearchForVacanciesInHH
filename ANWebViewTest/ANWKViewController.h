//
//  ANWKViewController.h
//  ANWebViewTest
//
//  Created by Admin on 05.06.18.
//  Copyright © 2018 Alena Tarasenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ANStartViewController.h"

@interface ANWKViewController : UIViewController <WKNavigationDelegate>

@property (strong,nonatomic)   NSString * pathString;

@end


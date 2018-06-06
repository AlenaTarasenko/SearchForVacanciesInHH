//
//  ANStartViewController.h
//  ANWebViewTest
//
//  Created by Admin on 05.06.18.
//  Copyright © 2018 Alena Tarasenko. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const ANStartViewControllerLoadPathNotification;
extern NSString *const ANStartViewControllerLoadPathKey;

@interface ANStartViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField * textJobNamber;
@property (weak, nonatomic) IBOutlet UIButton *buttonGo;

- (IBAction)actionGo:(id)sender;

@end

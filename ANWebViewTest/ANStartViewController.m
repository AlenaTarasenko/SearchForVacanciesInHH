//
//  ANStartViewController.m
//  ANWebViewTest
//
//  Created by Admin on 05.06.18.
//  Copyright © 2018 Alena Tarasenko. All rights reserved.
//

#import "ANStartViewController.h"
#import "ANWKViewController.h"

NSString *const ANStartViewControllerLoadPathNotification = @"ANStartViewControllerGoActionNotification";
NSString *const ANStartViewControllerLoadPathUserInfoKey  = @"ANStartViewControllerLoadPathKey";

@interface ANStartViewController ()

@property (strong, nonatomic)   ANWKViewController * viewWKWebController;
@property (weak, nonatomic)     IBOutlet UIView * topConteiner;
@property (strong, nonatomic)   NSString * pathString;

@end

@implementation ANStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pathString = @"";
    self.viewWKWebController = [[ANWKViewController alloc] init];
    [self addChildViewController:_viewWKWebController];
    [_topConteiner addSubview:self.viewWKWebController.view];
    [self.viewWKWebController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)actionGo:(id)sender {
    self.pathString = self.textJobNamber.text;
    if(![self.pathString isEqualToString:@""]){
        [self.textJobNamber resignFirstResponder];
        self.textJobNamber.text = nil;
        NSDictionary * userInfoDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.pathString,ANStartViewControllerLoadPathUserInfoKey, nil];
        NSLog(@"%@", userInfoDictionary);
        [[NSNotificationCenter defaultCenter] postNotificationName:ANStartViewControllerLoadPathNotification
                                                            object:nil
                                                          userInfo: userInfoDictionary];
    }
}

#pragma mark - UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *replaceString =[textField.text stringByReplacingCharactersInRange:range withString:string];
    NSCharacterSet *set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray * resultArray =[replaceString componentsSeparatedByCharactersInSet:set];
    return [replaceString length]<10 && [resultArray count]<=1;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textJobNamber resignFirstResponder];
    return YES;
}

@end

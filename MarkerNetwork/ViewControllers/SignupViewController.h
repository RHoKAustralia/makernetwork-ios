//
//  SignupViewController.h
//  MarkerNetwork
//
//  Created by Fangzhou He on 5/12/2015.
//  Copyright (c) 2015 MarkerNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;

- (IBAction)signup_button:(id)sender;

@end

//
//  SignupViewController.m
//  MarkerNetwork
//
//  Created by Fangzhou He on 5/12/2015.
//  Copyright (c) 2015 MarkerNetwork. All rights reserved.
//

#import "SignupViewController.h"
#import <JGProgressHUD/JGProgressHUD.h>//;
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signup_button:(id)sender {
    
    PFUser *user = [PFUser user];
    user.username = _usernameText.text;
    user.password = _passwordText.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.
            JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
            HUD.textLabel.text = @"SignUp Success!";
            HUD.indicatorView = [[JGProgressHUDSuccessIndicatorView alloc] init]; //JGProgressHUDSuccessIndicatorView is also available
            [HUD showInView:self.view];
            [HUD dismissAfterDelay:2.0];
//            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(signupSuccess:) userInfo:nil repeats:NO];

        } else {   NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
            HUD.textLabel.text = @"Error: Username already exist!";
            HUD.indicatorView = [[JGProgressHUDErrorIndicatorView alloc] init]; //JGProgressHUDSuccessIndicatorView is also available
            [HUD showInView:self.view];
            [HUD dismissAfterDelay:2.0];

        }
    }];
    

}
@end

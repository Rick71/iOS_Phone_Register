//
//  ViewController.m
//  Phone Register
//
//  Created by Ricardo Vera on 03/12/15.
//  Copyright © 2015 Comercomp. All rights reserved.
//

#import "Register.h"
#import <DigitsKit/DigitsKit.h>


@interface Register ()

@end

@implementation Register
/*********************************************************************/
#pragma mark - Initializacion
/*********************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [[Digits sharedInstance] logOut];
    // Do any additional setup after loading the view, typically from a nib.
    
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    [self.view addSubview:authButton];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*********************************************************************/
#pragma mark - Action Methods
/*********************************************************************/
- (IBAction)btnLoginPressed:(id)sender {
    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        // Inspect session/error objects
        if (session != nil){
            NSString *stPhone = session.phoneNumber;
            self.lblPhone.text = [@"Teléfono: " stringByAppendingString:stPhone];
        }
    

    }];
    }
@end

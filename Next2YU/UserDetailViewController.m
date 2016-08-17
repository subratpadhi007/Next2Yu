//
//  UserDetailViewController.m
//  Next2YU
//
//  Created by Java Guru IOS on 20/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import "UserDetailViewController.h"
#import "Userdetail.h"
#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface UserDetailViewController ()



@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainbackgrnd.jpg"]];
    
    //Keyboard stuff
    _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    _tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_tapRecognizer];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)RegisterUser:(id)sender {
    AppDelegate *App_del = [UIApplication sharedApplication].delegate;
    
    NSManagedObject *userdet = [NSEntityDescription insertNewObjectForEntityForName:@"Userdetail" inManagedObjectContext:App_del.managedObjectContext];
    
    [userdet setValue: _FullName.text forKey:@"fullname"];
    [userdet setValue: _UserName.text forKey:@"username"];
    [userdet setValue: _Password.text forKey:@"password"];
    [userdet setValue: _Company.text forKey:@"company"];
    [userdet setValue: _City.text forKey:@"city"];
    [userdet setValue: _Mobile.text forKey:@"mobile"];
    
    _FullName.text= @" ";
    _UserName.text= @" ";
    _Password.text= @" ";
    _Company.text= @" ";
    _City.text= @" ";
    _Mobile.text= @" ";
    
    [App_del saveContext];
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"You credential registered successfully" delegate:self cancelButtonTitle:@"Okya" otherButtonTitles:nil, nil];

    [success show];
}
- (IBAction)loginButtonClicked:(id)sender {

    
    
}
    






@end

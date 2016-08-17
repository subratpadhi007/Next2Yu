//
//  UserDetailViewController.h
//  Next2YU
//
//  Created by Java Guru IOS on 20/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *FullName;

@property (weak, nonatomic) IBOutlet UITextField *UserName;

@property (weak, nonatomic) IBOutlet UITextField *Password;

@property (weak, nonatomic) IBOutlet UITextField *Company;

@property (weak, nonatomic) IBOutlet UITextField *City;

@property (weak, nonatomic) IBOutlet UITextField *Mobile;

@property (weak, nonatomic) IBOutlet UILabel *status;

- (IBAction)RegisterUser:(id)sender;


@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

@end

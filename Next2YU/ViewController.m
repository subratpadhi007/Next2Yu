//
//  ViewController.m
//  Next2YU
//
//  Created by Java Guru IOS on 20/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import "ViewController.h"
#import "Userdetail.h"
#import "UserDetailViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mUserName;
@property (weak, nonatomic) IBOutlet UITextField *mPassword;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainbackgrnd.jpg"]];
    
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL isreturn = NO;
    if(textField == _mUserName)
    {
        [textField resignFirstResponder];
        [_mPassword becomeFirstResponder];
    }
    else{
       [textField resignFirstResponder];
        isreturn = YES;
    }
    
    return isreturn;
}
- (IBAction)authUserLogin:(id)sender {
    
    AppDelegate *App_del = [UIApplication sharedApplication].delegate;
    NSEntityDescription *user = [NSEntityDescription entityForName:@"Userdetail" inManagedObjectContext:App_del.managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:user];
    
    NSArray *array = [App_del.managedObjectContext executeFetchRequest:fetch error:nil];
    for (int i=0;i<array.count;i++) {
        Userdetail *userObj = [array objectAtIndex:i];
        NSLog(@"name is %@", userObj.username );
        NSLog(@"School is %@", userObj.password);
    }

    
}




@end

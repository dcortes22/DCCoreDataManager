//
//  DCViewController.m
//  DCCoreDataManager
//
//  Created by David Cortes on 10/10/2015.
//  Copyright (c) 2015 David Cortes. All rights reserved.
//

#import "DCViewController.h"
#import "DCCoreDataManager.h"

@interface DCViewController ()

@end

@implementation DCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createUser:(id)sender {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:_name.text forKey:@"name"];
    [dictionary setObject:_last_name.text forKey:@"last_name"];
    [dictionary setObject:_age.text forKey:@"age"];
    
    [[DCCoreDataManager sharedInstance]saveEntity:@"User" withValues:dictionary];
    [[DCCoreDataManager sharedInstance] saveContext];
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Saved"
                                  message:@"User Saved"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    _name.text = @"";
                                    _last_name.text = @"";
                                    _age.text = @"";
                                    
                                }];
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end

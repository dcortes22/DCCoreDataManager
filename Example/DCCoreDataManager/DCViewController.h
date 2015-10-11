//
//  DCViewController.h
//  DCCoreDataManager
//
//  Created by David Cortes on 10/10/2015.
//  Copyright (c) 2015 David Cortes. All rights reserved.
//

@import UIKit;

@interface DCViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *last_name;
@property (weak, nonatomic) IBOutlet UITextField *age;

- (IBAction)createUser:(id)sender;


@end

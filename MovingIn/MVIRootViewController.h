//
//  MVIRootViewController.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-21.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVISplashScreenViewController.h"
#import "MVIMainMenuViewController.h"

@interface MVIRootViewController : UIViewController

@property (nonatomic) UIViewController *currentViewController;

// Loads the main menu
- (void)loadMainMenu;

@end

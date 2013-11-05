//
//  MVISplashScreenViewController.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-21.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVISplashScreenViewController.h"

@interface MVISplashScreenViewController ()

@end

@implementation MVISplashScreenViewController

// Just call the suer and sets to fullscreen to prevent problems with different resolutions
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setWantsFullScreenLayout:YES];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Wait for three seconds and load the main menu
    [NSTimer scheduledTimerWithTimeInterval: 2.5 target:self selector:@selector(loadMainMenu) userInfo:nil repeats:NO];
}
- (void) loadMainMenu
{
    // Finds the current window from the keywindow property from the singleton shared application
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    // Takes the rootController and casts it to MVIRootViewController so it can call the loadMainMenu method from there
    MVIRootViewController *rootController = (MVIRootViewController *) [window rootViewController];
    // Remove this view from the its superview
    [[self view] removeFromSuperview];
    // Add the rootController's view as the window's subview
    [window addSubview:[rootController view]];
    // Send a message to the rootController asking to load the mainMenu
    [rootController loadMainMenu];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

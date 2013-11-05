//
//  MVIRootViewController.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-21.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIRootViewController.h"

@interface MVIRootViewController ()

@end

@implementation MVIRootViewController

// Just call the super of init
- (id) init {
    
    self = [super init];
    if (self) {
    }
    
    return self;
}
// Just call the super of initWithNibName
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Setting the current view controller as the Splash Screen
    [self setCurrentViewController:[[MVISplashScreenViewController alloc] initWithNibName:@"MVISplashScreenViewController" bundle:nil]];
    // Set its background
    [[_currentViewController view] setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    // Takes the window
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    // Removes iself from the view
    [[self view] removeFromSuperview];
    // add the _currentViewController as the view
    [window addSubview:[_currentViewController view]];
    
}

- (void)loadMainMenu
{
    // instantiates the menu
    MVIMainMenuViewController *mainMenuController = [[MVIMainMenuViewController alloc] initWithNibName:@"MVIMainMenuViewController" bundle:nil];
    // sets its title
    [mainMenuController setTitle:@"Main Menu"];
    // set its background
    [[mainMenuController view] setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    // instantiate a navigationController with the mainMenu
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainMenuController];
    
    // Changes the background image of the navigation bar
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBackground.png"] forBarMetrics:UIBarMetricsDefault];
    // takes the window
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    // sets the navigationController as the rootViewController
    [window setRootViewController:navigationController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

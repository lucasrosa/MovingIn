//
//  MVIMainMenuViewController.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-21.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIMainMenuViewController.h"

@interface MVIMainMenuViewController ()

@end

@implementation MVIMainMenuViewController

// Just call the super initWithNibName
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Just call the super of viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
}
// Just call the super didReceiveMemoryWarning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newReviewClicked:(id)sender {
    // Instantiates the reviewViewController
    MVIReviewViewController *reviewViewController = [[MVIReviewViewController alloc] initWithNibName:@"MVIReviewViewController" bundle:nil];
    // Set its title
    [reviewViewController setTitle:@"New Review"];
    // Prevents problems with resolutions lower than the iPhone 5's
    [reviewViewController setWantsFullScreenLayout:YES];
    // Set the background
    [[reviewViewController view] setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    // Pushes the view into the navigation controller
    [[self navigationController] pushViewController:reviewViewController animated:YES];
}

- (IBAction)reviewsClicked:(id)sender {
    // Instantiates the orderViewController
    MVIOrderViewController *orderViewController = [[MVIOrderViewController alloc] initWithNibName:@"MVIOrderViewController" bundle:nil];
    // Set its title
    [orderViewController setTitle:@"Order"];
    // Prevents problems with resolutions lower than the iPhone 5's
    [orderViewController setWantsFullScreenLayout:YES];
    // Set the background
    [[orderViewController view] setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    // Pushes the view into the navigation controller
    [[self navigationController] pushViewController:orderViewController animated:YES];
}

@end

//
//  MVIOrderViewController.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIOrderViewController.h"

@interface MVIOrderViewController ()

@end

@implementation MVIOrderViewController

// Just call the super initWithNibName
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)popView
{
    // Removes this view from the navigationController
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Creates a custom backButton and sets its action as a popViewControllerAnimated:YES
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(popView)];
    
    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // Sets the brand new backButton in the left side of the NavigationBar
    [[self navigationItem] setLeftBarButtonItem:backButton];
    
    
    // Set the default values
    _selectedValue = 0;
    _isAscending = YES;
    /* Define the items in the Picker View */
    
    _items = [[NSMutableArray alloc] init];
    
    /* General Information */
    
    [_items addObject:@"Name"];
    [_items addObject:@"Rent Price"];
    [_items addObject:@"Total Price"];
    
    /* Features */
    
    [_items addObject:@"Location"];
    [_items addObject:@"Roommate(s)"];
    [_items addObject:@"Furniture"];
    [_items addObject:@"Quality"];
    [_items addObject:@"Owner"];
    [_items addObject:@"Neighborhood"];
    [_items addObject:@"Ambience"];
    [_items addObject:@"Availability"];
    [_items addObject:@"Recommendation"];
    [_items addObject:@"Price X Total Price"];
    [_items addObject:@"Support"];
    [_items addObject:@"Discount"];
    [_items addObject:@"Included Items"];
    [_items addObject:@"Laundry"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    // There are two components, the one with the options and the one for ascending
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        // The left one is the items, it returns the number of items
        return [_items count];
    } else {
        // The right one it's ascending or desceding, so it returns two
        return 2;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // Sets the title of the rows
    if (component == 0) {
        // If it is on the left it takes the corresponding items
        return [_items objectAtIndex:row];
    } else {
        // if it's on the right it is only ascending or not
        if (row == 0) {
            return @"Ascending";
        } else {
            return @"Descending";
        }
    }
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    /* 
     * If the component is zero, set the selectedValue as the position
     * but if not it sets the isAscending property, if it's the position zero it is ascending, otherwise it's not
     */
    
    if (component == 0) {
        _selectedValue = row;
    } else {
        if (row == 0) {
            _isAscending = YES;
        } else {
            _isAscending = NO;
        }
    }
}

- (IBAction)displayButtonPressed:(id)sender {
    // Instantiates the list view setting the order that the user chose (the one that is in the UIPicker right now
    MVIReviewsListViewController *reviewsListViewController = [[MVIReviewsListViewController alloc] initWithNibName:@"MVIReviewsListViewController" bundle:nil orderAttribute:_selectedValue ascending:_isAscending];
    // Set the title of the list view as the item the user chose
    [reviewsListViewController setTitle:[_items objectAtIndex:_selectedValue]];
    // Prevents problems with resolutions lower than the iPhone 5's
    [reviewsListViewController setWantsFullScreenLayout:YES];
    // Set the background as the standard background picture
    [[reviewsListViewController view] setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    // pushes the brand new list view in the controller
    [[self navigationController] pushViewController:reviewsListViewController animated:YES];
    
}
@end

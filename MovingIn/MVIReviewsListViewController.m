//
//  MVIReviewsListViewController.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIReviewsListViewController.h"

@interface MVIReviewsListViewController ()
{
    NSMutableArray *items;
    BOOL isAscending;
    int orderAttribute;
}
@end

@implementation MVIReviewsListViewController

// Just call the super initWithStyle
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

// Just call the super initWithNibName
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    
    return self;
}

// Inits the view with certain order (defined by _orderAttribute and _isAscending)
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil orderAttribute:(int)_orderAttribute ascending:(BOOL)_isAscending
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        /*
         * Set the ("private") instance variables with the values of the parameters of this init method.
         * This way everytime the view appears the values can be reloaded.
         * This is necessary because the user can change the values and the table has to be updated.
         */
        items  = [[NSMutableArray alloc] init];
        orderAttribute = _orderAttribute;
        isAscending = _isAscending;
        
        
        /* General Information */
        
        [items addObject:@"name"];
        [items addObject:@"rentPrice"];
        [items addObject:@"totalPrice"];
        
        /* Features */
        
        [items addObject:@"location"];
        [items addObject:@"roomates"];
        [items addObject:@"furniture"];
        [items addObject:@"quality"];
        [items addObject:@"owner"];
        [items addObject:@"neighborhood"];
        [items addObject:@"ambience"];
        [items addObject:@"availability"];
        [items addObject:@"recommendation"];
        [items addObject:@"priceXTotal Price"];
        [items addObject:@"support"];
        [items addObject:@"discount"];
        [items addObject:@"includedItems"];
        [items addObject:@"laundry"];
        
        // Sends a message to the singleton to return the objects in certain order and sets them to _reviews
        _reviews = [[MVIReviewStore defaultStore] allItemsOrderingBy:[items objectAtIndex:orderAttribute] ascending:isAscending];
    }
    
    return self;
}

/* Called when the Delete button is pressed: delete the cell */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Identifies which review the user pressed and gets its pointer
    MVIReview *actualReview = [_reviews objectAtIndex:[indexPath row]];
    // Remove the item from the MVIReviewStore (main memory)
    [[MVIReviewStore defaultStore] removeItem:actualReview];
    // Save the changes that are in the main memory to the database - completing the removal of the item
    [[MVIReviewStore defaultStore] saveChanges];
    // Reload the values after the removal
    _reviews = [[MVIReviewStore defaultStore] allItemsOrderingBy:[items objectAtIndex:orderAttribute] ascending:isAscending];
    // Removes the cell of the removed item
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    
 
    // Default: Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    [[self navigationItem] setRightBarButtonItem:[self editButtonItem]];
    // Sets the editButton's image
    [[self editButtonItem] setBackgroundImage:[UIImage imageNamed:@"barButton.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // There is only one section
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // The number of rows is the number of Reviews in the database (here loaded into _reviews)
    return [_reviews count];
}

/* Define the height of each cell as 140 points */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Just setting the height of the cell
    return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Instantiates a new cell or dequeue it from memory
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Takes a pointer for the review of this row
    MVIReview *actualReview = [_reviews objectAtIndex:[indexPath row]];
    // Takes the includedItemsRatior
    int actualReviewIncludedItemsCount = [actualReview includedItemsRatio];
    
    // Takes the name of the review
    NSString *actualReviewName = [actualReview name];
    if (actualReviewName == nil) {
        actualReviewName = @" ";
    }
    
    // Takes the addres of the review and sets the ratio in the beginning of it
    NSString *actualReviewAddress = [NSString stringWithFormat:@"(%d/25) - %@", actualReviewIncludedItemsCount, [actualReview address]];
    if (actualReviewAddress == nil) {
        actualReviewAddress = @" ";
    }
    
    // Sets the text label text as the name of the review
    [[cell textLabel] setText:[NSString stringWithFormat:actualReviewName, [indexPath row]]];
    // Sets the color of the text as black
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    // Set the image of the cell as the home icon
    [[cell imageView] setImage:[UIImage imageNamed:@"home.png"]];
    // sets the detailTextLabel text as the review's addres
    [[cell detailTextLabel] setText:actualReviewAddress];
    // sets the detailTextLabel color as gray
    [[cell detailTextLabel] setTextColor:[UIColor grayColor]];
    // Removes the acessory of the cell
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Takes the review that corresponds to this row
    MVIReview *actualReview = [_reviews objectAtIndex:[indexPath row]];
    // Instantiate the next view with the current row title, putting the list as the actualValue of the rawValues  and the standard nib file
    UIViewController *next = [[MVIReviewViewController alloc] initWithNibName:@"MVIReviewViewController" bundle:nil andMVIReview:actualReview];
    
    // If there is no problem instantiating the next view, push it in the ViewController
    if (next != nil) {
        [[next view] setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]]];
        [next setTitle:@"Edit"];
        // Push the view in the navigationController
        [[self navigationController] pushViewController:next animated:YES];
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    // Called to reload the table data because the user can update the name of a MVIReview when editing
    _reviews = [[MVIReviewStore defaultStore] allItemsOrderingBy:[items objectAtIndex:orderAttribute] ascending:isAscending];
    // Reloads the data of the table (in case the user changed the name, address or some included items
    [[self tableView] reloadData];
}

@end

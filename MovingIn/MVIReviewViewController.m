//
//  MVIReviewViewController.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-25.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIReviewViewController.h"

@interface MVIReviewViewController ()

@property BOOL contentSaved;

@end

@implementation MVIReviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Sets the MVIReview property as a new item from the MVIReviewStore -> "Equivalent" as [[alloc] init]
        [self setReview:[[MVIReviewStore defaultStore] createItem]];
        // Sets the BOOL variable that keeps track of whether the content was saved or not
        _contentSaved = NO;
        // If this init method was called it means it isn't an edition, so the variable is set to NO
        _isEdition = NO;
    }
    return self;
}

- (IBAction)shareOnFacebook:(UIButton *)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        // Check if Facebook Account is linked
    {
        // Initialize the Social Controller
        slComposerSheet = [[SLComposeViewController alloc] init];
        // Set Facebook as the service
        slComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        // This is the standard message to be posted (Can be edited by the user when posting
        [slComposerSheet setInitialText:[NSString
           stringWithFormat:@"I found the perfect apartment at %@! It comes with a lot of items included and                                                                        costs only $%@! Call (902) %@ if you are interested!",
                [_address text], [_totalPrice text], [_phone text]]];
        [self presentViewController:slComposerSheet animated:YES completion:nil];
    }
    [slComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action not completed";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Review Shared!";
                break;
            default:
                break;
        } //check if everythink worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil
                                              cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andMVIReview:(MVIReview *)aReview
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Sets the MVIReview property as a new item from the MVIReviewStore -> "Equivalent" as [[alloc] init]
        [self setReview:aReview];
        // Sets the BOOL variable that keeps track of whether the content was saved or not
        _contentSaved = YES;
        // If this init method was called it means it is an edition, so the variable is set to YES
        _isEdition = YES;
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

    // Create a custom save buttom in the NavigationController with the action as saveButtonPressed
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(saveButtonPressed)];
    [saveButton setBackgroundImage:[UIImage imageNamed:@"barButton.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // Set the button as the RightBarButtonItem in the navigationItem
    [[self navigationItem] setRightBarButtonItem:saveButton];
    
    // Creates a custom backButton and sets its action as a popViewControllerAnimated:YES
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(popView)];
    
    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    // Sets the brand new backButton in the left side of the NavigationBar
    [[self navigationItem] setLeftBarButtonItem:backButton];
    
    /* Set the ThumbImage to all the sliders */
    
    UIImage *sliderThumb = [UIImage imageNamed:@"sliderThumb.png"];
    
    [_location setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_roomates setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_furniture setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_quality setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_owner setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_neighborhood setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_ambience setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_availability setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_recommendation setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_priceXTotalPrice setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_support setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_discount setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_includedItems setThumbImage:sliderThumb forState:UIControlStateNormal];
    [_laundry setThumbImage:sliderThumb forState:UIControlStateNormal];
    
    if (_isEdition) {
    
        /** Sets the values of the fields **/
        
        /* General Information */
        
        [_name setText:[_review name]];
        [_address setText:[_review address]];
        [_rentPrice setText:[NSString stringWithFormat:@"%.2f",[_review rentPrice]]];
        [_totalPrice setText:[NSString stringWithFormat:@"%.2f",[_review totalPrice]]];
        [_origin setText:[_review origin]];
        [_phone setText:[NSString stringWithFormat:@"%d",[_review phone]]];
        
        /* Included Items */
        
        [_individualWashroom setOn:[_review individualWashroom]];
        [_heat setOn:[_review heat]];
        [_electricity setOn:[_review electricity]];
        [_hotWater setOn:[_review hotWater]];
        [_internet setOn:[_review internet]];
        [_toaster setOn:[_review toaster]];
        [_oven setOn:[_review oven]];
        [_stove setOn:[_review stove]];
        [_microwave setOn:[_review microwave]];
        [_potsAndPans setOn:[_review potsAndPans]];
        [_washingMachine setOn:[_review washingMachine]];
        [_dishes setOn:[_review dishes]];
        [_cleaningSupplies setOn:[_review cleaningSupplies]];
        [_bed setOn:[_review bed]];
        [_desk setOn:[_review desk]];
        [_chair setOn:[_review chair]];
        [_dresser setOn:[_review dresser]];
        [_loungingChair setOn:[_review loungingChair]];
        [_bedsideTable setOn:[_review bedsideTable]];
        [_lamp setOn:[_review  lamp]];
        [_wardrobe setOn:[_review wardrobe]];
        [_cable setOn:[_review cable]];
        [_doublesizeBed setOn:[_review doubleSizeBed]];
        [_bedding setOn:[_review bedding]];
        [_tv setOn:[_review tv]];
        
        /* Features */
        
        [_location setValue:[_review location]];
        [_roomates setValue:[_review roomates]];
        [_furniture setValue:[_review furniture]];
        [_quality setValue:[_review quality]];
        [_owner setValue:[_review owner]];
        [_neighborhood setValue:[_review neighborhood]];
        [_ambience setValue:[_review ambience]];
        [_availability setValue:[_review availability]];
        [_recommendation setValue:[_review recommendation]];
        [_priceXTotalPrice setValue:[_review priceXTotalPrice]];
        [_support setValue:[_review support]];
        [_discount setValue:[_review discount]];
        [_includedItems setValue:[_review includedItems]];
        [_laundry setValue:[_review laundry]];
        
    } else {
        // If it's not an edition, there's no need for a Share button because the Review is still not saved in the database
        [_shareButton setHidden:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    // If the the user press the Cancel button the current MVIReview is removed from the actual changes
    if (!_contentSaved) {
        [[MVIReviewStore defaultStore] removeItem:_review];
    }
}

- (void)saveButtonPressed {
    
    // Set the properties of the new MVIReview based on the fields in the view
    
    /* General Information */
    
    [_review setName:[_name text]];
    [_review setAddress:[_address text]];
    [_review setRentPrice:[[_rentPrice text] doubleValue]];
    [_review setTotalPrice:[[_totalPrice text] doubleValue]];
    [_review setOrigin:[_origin text]];
    
    int intermediatePhone = [[_phone text] intValue];
    [_review setPhone:intermediatePhone];
    
    /* Included Items */
    
    [_review setIndividualWashroom:[_individualWashroom isOn]];
    [_review setHeat:[_heat isOn]];
    [_review setElectricity:[_electricity isOn]];
    [_review setHotWater:[_hotWater isOn]];
    [_review setInternet:[_internet isOn]];
    [_review setToaster:[_toaster isOn]];
    [_review setOven:[_oven isOn]];
    [_review setStove:[_stove isOn]];
    [_review setMicrowave:[_microwave isOn]];
    [_review setPotsAndPans:[_potsAndPans isOn]];
    [_review setWashingMachine:[_washingMachine isOn]];
    [_review setDishes:[_dishes isOn]];
    [_review setCleaningSupplies:[_cleaningSupplies isOn]];
    [_review setBed:[_bed isOn]];
    [_review setDesk:[_desk isOn]];
    [_review setChair:[_chair isOn]];
    [_review setDresser:[_dresser isOn]];
    [_review setLoungingChair:[_loungingChair isOn]];
    [_review setBedsideTable:[_bedsideTable isOn]];
    [_review setLamp:[_lamp isOn]];
    [_review setWardrobe:[_wardrobe isOn]];
    [_review setCable:[_cable isOn]];
    [_review setDoubleSizeBed:[_doublesizeBed isOn]];
    [_review setBedding:[_bedding isOn]];
    [_review setTv:[_tv isOn]];
    
    /* Features */
    
    [_review setLocation:[_location value]];
    [_review setRoomates:[_roomates value]];
    [_review setFurniture:[_furniture value]];
    [_review setQuality:[_quality value]];
    [_review setOwner:[_owner value]];
    [_review setNeighborhood:[_neighborhood value]];
    [_review setAmbience:[_ambience value]];
    [_review setAvailability:[_availability value]];
    [_review setRecommendation:[_recommendation value]];
    [_review setPriceXTotalPrice:[_priceXTotalPrice value]];
    [_review setSupport:[_support value]];
    [_review setDiscount:[_discount value]];
    [_review setIncludedItems:[_includedItems value]];
    [_review setLaundry:[_laundry value]];
    
    if (_isEdition) {
        NSMutableArray *newItems = [NSMutableArray arrayWithArray:[[MVIReviewStore defaultStore] allItems]];
        
        /* Search for this object and substitute it by the new one */
        for (int x = 0; x < [newItems count]; x++) {
            if ([[newItems objectAtIndex:x] orderIdentifier] == [_review orderIdentifier]) {
                [newItems setObject:_review atIndexedSubscript:x];
            }
        }
    
    }
    
    // Save the changes in the database
    if ([[MVIReviewStore defaultStore] saveChanges]) {
        // Confirm that the changes were made
        _contentSaved = YES;
    }
    
    // Go back to the main menu
    [[self navigationController] popViewControllerAnimated:YES];
}

-  (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //  Makes the keyboard disappear
    [textField resignFirstResponder];
    return YES;
}

@end

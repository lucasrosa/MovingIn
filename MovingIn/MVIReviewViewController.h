//
//  MVIReviewViewController.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-25.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVIReviewStore.h"
#import "MVIReview.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface MVIReviewViewController : UIViewController
{
    SLComposeViewController *slComposerSheet;
}
/* General Information */

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *rentPrice;
@property (strong, nonatomic) IBOutlet UITextField *totalPrice;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *origin;

/* Included Items */

@property (strong, nonatomic) IBOutlet UISwitch *individualWashroom;
@property (strong, nonatomic) IBOutlet UISwitch *heat;
@property (strong, nonatomic) IBOutlet UISwitch *electricity;
@property (strong, nonatomic) IBOutlet UISwitch *hotWater;
@property (strong, nonatomic) IBOutlet UISwitch *internet;
@property (strong, nonatomic) IBOutlet UISwitch *toaster;
@property (strong, nonatomic) IBOutlet UISwitch *oven;
@property (strong, nonatomic) IBOutlet UISwitch *stove;
@property (strong, nonatomic) IBOutlet UISwitch *microwave;
@property (strong, nonatomic) IBOutlet UISwitch *potsAndPans;
@property (strong, nonatomic) IBOutlet UISwitch *washingMachine;
@property (strong, nonatomic) IBOutlet UISwitch *dishes;
@property (strong, nonatomic) IBOutlet UISwitch *cleaningSupplies;
@property (strong, nonatomic) IBOutlet UISwitch *bed;
@property (strong, nonatomic) IBOutlet UISwitch *desk;
@property (strong, nonatomic) IBOutlet UISwitch *chair;
@property (strong, nonatomic) IBOutlet UISwitch *dresser;
@property (strong, nonatomic) IBOutlet UISwitch *loungingChair;
@property (strong, nonatomic) IBOutlet UISwitch *bedsideTable;
@property (strong, nonatomic) IBOutlet UISwitch *lamp;
@property (strong, nonatomic) IBOutlet UISwitch *wardrobe;
@property (strong, nonatomic) IBOutlet UISwitch *cable;
@property (strong, nonatomic) IBOutlet UISwitch *doublesizeBed;
@property (strong, nonatomic) IBOutlet UISwitch *bedding;
@property (strong, nonatomic) IBOutlet UISwitch *tv;

/* Features */

@property (strong, nonatomic) IBOutlet UISlider *location;
@property (strong, nonatomic) IBOutlet UISlider *roomates;
@property (strong, nonatomic) IBOutlet UISlider *furniture;
@property (strong, nonatomic) IBOutlet UISlider *quality;
@property (strong, nonatomic) IBOutlet UISlider *owner;
@property (strong, nonatomic) IBOutlet UISlider *neighborhood;
@property (strong, nonatomic) IBOutlet UISlider *ambience;
@property (strong, nonatomic) IBOutlet UISlider *availability;
@property (strong, nonatomic) IBOutlet UISlider *recommendation;
@property (strong, nonatomic) IBOutlet UISlider *priceXTotalPrice;
@property (strong, nonatomic) IBOutlet UISlider *support;
@property (strong, nonatomic) IBOutlet UISlider *discount;
@property (strong, nonatomic) IBOutlet UISlider *includedItems;
@property (strong, nonatomic) IBOutlet UISlider *laundry;

/* The Review */

@property (nonatomic, strong) MVIReview *review;

/* The Share! button */
@property (strong, nonatomic) IBOutlet UIButton *shareButton;

/* Property to define if it is an edition (if it came from the mainMenu or from the list ) */
@property BOOL isEdition;
- (IBAction)shareOnFacebook:(UIButton *)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andMVIReview:(MVIReview *)aReview;
@end

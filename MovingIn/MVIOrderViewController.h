//
//  MVIOrderViewController.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVIReviewsListViewController.h"

@interface MVIOrderViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// The UIPickerView
@property (strong, nonatomic) IBOutlet UIPickerView *orderByItems;
// The items that the user can chose for order
@property NSMutableArray *items;
// The value that the user chose
@property int selectedValue;
// If the user chose asceding or not
@property BOOL isAscending;

// Called when the displayButton is pressed
- (IBAction)displayButtonPressed:(id)sender;

@end

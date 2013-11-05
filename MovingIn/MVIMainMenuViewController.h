//
//  MVIMainMenuViewController.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-21.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVIReviewViewController.h"
#import "MVIOrderViewController.h"

@interface MVIMainMenuViewController : UIViewController
// The New Review button (action)
- (IBAction)newReviewClicked:(id)sender;
// The Reviews button (action)
- (IBAction)reviewsClicked:(id)sender;

@end

//
//  MVIReviewsListViewController.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVIReviewStore.h"
#import "MVIReview.h"
#import "MVIReviewViewController.h"

@interface MVIReviewsListViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property NSArray *reviews;

// Inits the view with certain order (defined by _orderAttribute and _isAscending)
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil orderAttribute:(int)_orderAttribute ascending:(BOOL)_isAscending;

@end

//
//  MVIReviewStore.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24 based on BNRItemStore from The Big Nerd Ranch Book.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MVIReview.h"

/* This is the most important class in the application, it's the class that manages the model 
 * (it is part of the model), by keeping track of the MVIReviews and saving them in the database.
 */
@interface MVIReviewStore : NSObject
{
    // The array that stores all the items, it is always loaded and saved as an entire thing
    NSMutableArray *allItems;
    // The context to manage the colletion of NSManagedObjects. e.g. the MVIReviews
    NSManagedObjectContext *context;
    // The model responsible to keep the data when reading from the database
    NSManagedObjectModel *model;
}

// A getter to return the Singleton
+ (MVIReviewStore *)defaultStore;
// Creates and MVIReview and inserts it in the context by using insertNewObjectForEntityForName and add it to the allItems array
- (MVIReview *)createItem;
// Keeps all the MVIReviews in memory - it is where the changes (insertion, update and removal) are made
- (NSArray *)allItems;
// Returns the user document directory - used to the database
- (NSString *)itemArchivePath;
// Removes a certain item from the allItems array
- (void)removeItem:(MVIReview *)p;
// Saves the allItems array in the database
- (BOOL)saveChanges;
// Returns an array with the items in the defined order
- (NSMutableArray *)allItemsOrderingBy:(NSString *)orderValue ascending:(BOOL)isAscending;

@end



//
//  MVIReviewStore.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIReviewStore.h"

@implementation MVIReviewStore

+ (MVIReviewStore *)defaultStore
{
    
    static MVIReviewStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        // Read in MovingInDatabase.xcdatamodeld
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        // Define the persistentStoreCoordinator with the model
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        // SQL file location
        NSString *path = [self itemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        NSError *error = nil;
        // Sets the SQL in the storeURL as the persistentStoreWithType and raise an exception if that couldn't be done
        if (![persistentStoreCoordinator
                addPersistentStoreWithType:NSSQLiteStoreType
                            configuration:nil
                                      URL:storeURL
                                  options:nil
                                    error:&error
        ]) {
            [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        // Create the managed object context
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:persistentStoreCoordinator];
        
        // The managed object context can manage undo, but we don't need it
        [context setUndoManager:nil];
        
        [self loadAllItems];
    }
    
    return self;
}

// Setter to allItems
- (void)setAllItems:(NSMutableArray *)thisItems
{
    allItems = thisItems;
}

// Getter to allItems
- (NSArray *)allItems
{
    return allItems;
}

// Getter to the itemArchivePath, returns the user document directory
- (NSString *)itemArchivePath
{
    // Creates a list of directory search paths
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    // Return the directory string adding "store.data" to it
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

- (BOOL)saveChanges
{
    NSError *error = nil;
    // Saves the allItems array in the database
    BOOL successful = [context save:&error];
    if (!successful) {
        NSLog(@"Error saving: %@", [error localizedDescription]);
    }
    
    return successful;
}

// Load all the items in the database and "store" them in the allItems array
- (void)loadAllItems
{
    if (!allItems) {
        // allocating the fetchRequest
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        // Setting entityDescription of the request basing on the model for MVIReview
        NSEntityDescription *entityDescription = [[model entitiesByName] objectForKey:@"MVIReview"];
        [request setEntity:entityDescription];
        
        // Adding a descriptior (orderIdentifier) to the request to set the order of the arrays
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"orderIdentifier" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        
        NSError *error;
        // Executing the request in the database and defining an error if needed
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        // Setting the allItems array with the loaded values
        allItems = [[NSMutableArray alloc] initWithArray:result];
    }
}

// Returns an array with the items in the defined order
- (NSMutableArray *)allItemsOrderingBy:(NSString *)orderValue ascending:(BOOL)isAscending
{
    // Allocating the request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // Setting entityDescription of the request basing on the model for MVIReview
    NSEntityDescription *entityDescription = [[model entitiesByName] objectForKey:@"MVIReview"];
    [request setEntity:entityDescription];
    // Addin a sortDescriptor based on the parameters sent to this method (chosen by the user in the order View)
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:orderValue ascending:isAscending];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    NSError *error;
    // Executing the request in the database and defining an error if needed
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (!result) {
        [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
    }
    // Returning the results (to be used in the list view)
    return [[NSMutableArray alloc] initWithArray:result];
}

- (MVIReview *)createItem
{
    // The variable order works as the identifier of the column, it is an double because it could be used to reset the order, but it's not used for that in this application
    double order;
    if ([allItems count] == 0) {
        // If it is the first one, the order is 1
        order = 1.0;
    } else {
        // If it's not, it takes the lastObject orderIdentifier and adds 1.0 to it
        order = [[allItems lastObject] orderIdentifier] + 1.0;
    }
    
    // Instantiates a newReview and inserts it in the context
    MVIReview *review = [NSEntityDescription insertNewObjectForEntityForName:@"MVIReview" inManagedObjectContext:context];
    [review setOrderIdentifier:order];
    
    // adds the new object in the allItems array so it can be get right from the memory
    [allItems addObject:review];
    
    return review;
}

/* Removes an object */

- (void)removeItem:(MVIReview *)review
{
    // removes from the context
    [context deleteObject:review];
    //removes from the array
    [allItems removeObjectIdenticalTo:review];
}

@end

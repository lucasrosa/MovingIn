//
//  MVIReview.h
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

/* 
 * This is the class that keeps the data of the application, it is the review itself.
 * It was created based on the Database Model (CoreData -> NSManagedObject subclass)
 */

@interface MVIReview : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic) double rentPrice;
@property (nonatomic) double totalPrice;
@property (nonatomic, retain) NSString * origin;
@property (nonatomic) int32_t phone;
@property (nonatomic) BOOL individualWashroom;
@property (nonatomic) BOOL heat;
@property (nonatomic) BOOL electricity;
@property (nonatomic) BOOL hotWater;
@property (nonatomic) BOOL internet;
@property (nonatomic) BOOL toaster;
@property (nonatomic) BOOL oven;
@property (nonatomic) BOOL stove;
@property (nonatomic) BOOL microwave;
@property (nonatomic) BOOL potsAndPans;
@property (nonatomic) BOOL washingMachine;
@property (nonatomic) BOOL dishes;
@property (nonatomic) BOOL cleaningSupplies;
@property (nonatomic) BOOL bed;
@property (nonatomic) BOOL desk;
@property (nonatomic) BOOL chair;
@property (nonatomic) BOOL dresser;
@property (nonatomic) BOOL loungingChair;
@property (nonatomic) BOOL bedsideTable;
@property (nonatomic) BOOL lamp;
@property (nonatomic) BOOL wardrobe;
@property (nonatomic) BOOL doubleSizeBed;
@property (nonatomic) BOOL bedding;
@property (nonatomic) BOOL tv;
@property (nonatomic) BOOL cable;
@property (nonatomic) int32_t location;
@property (nonatomic) int32_t roomates;
@property (nonatomic) int32_t furniture;
@property (nonatomic) int32_t quality;
@property (nonatomic) int32_t owner;
@property (nonatomic) int32_t neighborhood;
@property (nonatomic) int32_t ambience;
@property (nonatomic) int32_t availability;
@property (nonatomic) int32_t recommendation;
@property (nonatomic) int32_t priceXTotalPrice;
@property (nonatomic) int32_t support;
@property (nonatomic) int32_t discount;
@property (nonatomic) int32_t includedItems;
@property (nonatomic) int32_t laundry;
@property (nonatomic) double orderIdentifier;

/* Return the count of the BOOL items that have the value equals to YES */
- (int)includedItemsRatio;

@end

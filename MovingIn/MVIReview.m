//
//  MVIReview.m
//  MovingIn
//
//  Created by Lucas Furlani on 2013-03-24.
//  Copyright (c) 2013 Lucas Furlani. All rights reserved.
//

#import "MVIReview.h"


@implementation MVIReview

/* 
 * Properties defined as dynamic instead of synthesize because it states that it's not the class
 * that will implement the getters and setters.
 */
@dynamic name;
@dynamic address;
@dynamic rentPrice;
@dynamic totalPrice;
@dynamic origin;
@dynamic phone;
@dynamic individualWashroom;
@dynamic heat;
@dynamic electricity;
@dynamic hotWater;
@dynamic internet;
@dynamic toaster;
@dynamic oven;
@dynamic stove;
@dynamic microwave;
@dynamic potsAndPans;
@dynamic washingMachine;
@dynamic dishes;
@dynamic cleaningSupplies;
@dynamic bed;
@dynamic desk;
@dynamic chair;
@dynamic dresser;
@dynamic loungingChair;
@dynamic bedsideTable;
@dynamic lamp;
@dynamic wardrobe;
@dynamic doubleSizeBed;
@dynamic bedding;
@dynamic tv;
@dynamic cable;
@dynamic location;
@dynamic roomates;
@dynamic furniture;
@dynamic quality;
@dynamic owner;
@dynamic neighborhood;
@dynamic ambience;
@dynamic availability;
@dynamic recommendation;
@dynamic priceXTotalPrice;
@dynamic support;
@dynamic discount;
@dynamic includedItems;
@dynamic laundry;
@dynamic orderIdentifier;

/* Return the count of the BOOL items that have the value equals to YES */
- (int)includedItemsRatio
{
    int includedItemsCount = 0;
    
    if ([self individualWashroom]) includedItemsCount++;
    if ([self heat]) includedItemsCount++;
    if ([self electricity]) includedItemsCount++;
    if ([self hotWater]) includedItemsCount++;
    if ([self internet]) includedItemsCount++;
    if ([self toaster]) includedItemsCount++;
    if ([self oven]) includedItemsCount++;
    if ([self stove]) includedItemsCount++;
    if ([self microwave]) includedItemsCount++;
    if ([self potsAndPans]) includedItemsCount++;
    if ([self washingMachine]) includedItemsCount++;
    if ([self dishes]) includedItemsCount++;
    if ([self cleaningSupplies]) includedItemsCount++;
    if ([self bed]) includedItemsCount++;
    if ([self desk]) includedItemsCount++;
    if ([self chair]) includedItemsCount++;
    if ([self dresser]) includedItemsCount++;
    if ([self loungingChair]) includedItemsCount++;
    if ([self bedsideTable]) includedItemsCount++;
    if ([self lamp]) includedItemsCount++;
    if ([self wardrobe]) includedItemsCount++;
    if ([self doubleSizeBed]) includedItemsCount++;
    if ([self bedding]) includedItemsCount++;
    if ([self tv]) includedItemsCount++;
    if ([self cable]) includedItemsCount++;
    
    return includedItemsCount;
}
@end

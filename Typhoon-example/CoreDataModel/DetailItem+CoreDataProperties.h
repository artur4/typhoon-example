//
//  DetailItem+CoreDataProperties.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DetailItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id_item;

@end

NS_ASSUME_NONNULL_END

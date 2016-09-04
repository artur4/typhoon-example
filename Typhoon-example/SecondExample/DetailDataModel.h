//
//  DetailDataModel.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

@import Foundation;
@import UIKit;
@import CoreData;
@class CoreDataManager;
#import "DetailDataModelConfigurator.h"

@interface DetailDataModel : NSObject <DetailDataModelConfigurator, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) CoreDataManager *coreDataManager;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

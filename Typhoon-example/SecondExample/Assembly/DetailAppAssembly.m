//
//  DetailAppAssembly.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "DetailAppAssembly.h"
#import "DetailViewController.h"
#import "CoreDataManager.h"

@implementation DetailAppAssembly

/* ---------------------------------- Second Example -------------------------------- */

- (DetailViewController *)detailViewController {
    return [TyphoonDefinition withFactory:[self mainStoryboard]
                                 selector:@selector(instantiateViewControllerWithIdentifier:)
                               parameters:^(TyphoonMethod *factoryMethod) {
                                   [factoryMethod injectParameterWith:NSStringFromClass([DetailViewController class])];
                               } configuration:^(TyphoonFactoryDefinition *definition) {
                                   [definition injectProperty:@selector(detailDataModel) with:[self detailDataModel]];
                               }];
}

- (UIStoryboard *)mainStoryboard {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition* definition) {
        [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"Main"];
            [initializer injectParameterWith:self];
            [initializer injectParameterWith:[NSBundle mainBundle]];
        }];
    }];
}


- (id <DetailDataModelConfigurator>)detailDataModel {
    return [TyphoonDefinition withClass:[DetailDataModel class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
        [definition injectProperty:@selector(coreDataManager) with:[self coreDataManager]];
        [definition injectProperty:@selector(fetchedResultsController) with:[self fetchedResultsController]];
    }];
}


- (CoreDataManager *)coreDataManager {
    return [TyphoonDefinition withClass:[CoreDataManager class]];
}

/* ------------------------------------ NSFetchedResultsController ----------------------------------------------*/

- (NSFetchedResultsController *)fetchedResultsController {
    return [TyphoonDefinition withClass:[NSFetchedResultsController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self fetchRequest]];
            [initializer injectParameterWith:[(TyphoonDefinition*)[self coreDataManager] keyPath:@"managedObjectContext"]];
            [initializer injectParameterWith:nil];
            [initializer injectParameterWith:nil];
        }];
        [definition injectMethod:@selector(performFetch:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:[self error]];
        }];
    }];
}


- (NSFetchRequest *)fetchRequest {
    return [TyphoonDefinition withClass:[NSFetchRequest class]configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithEntityName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"DetailItem"];
        }];
        [definition injectProperty:@selector(sortDescriptors) with:@[[NSSortDescriptor sortDescriptorWithKey:@"id_item" ascending:YES]]];
    }];
}

- (NSError *)error {
    return [TyphoonDefinition withClass:[NSError class]];
}

@end

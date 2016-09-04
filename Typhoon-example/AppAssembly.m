//
//  AppAssemly.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 03.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "AppAssembly.h"
#import "ViewController.h"
#import "DataModel.h"


@implementation AppAssembly


/* ---------------------------------- First Example -------------------------------- */

- (ViewController *)viewController {
    return [TyphoonDefinition withClass:[ViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(dataModel) with:[self dataModel]];
        [definition injectProperty:@selector(detailAppAssembly)];
    }];
}


- (id <DataModelConfigurator>)dataModel {
    return [TyphoonDefinition withClass:[DataModel class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}


@end

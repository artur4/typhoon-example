//
//  AppAssemly.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 03.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

@import Foundation;
#import <Typhoon/Typhoon.h>
#import "DataModel.h"
@class ViewController;


@interface AppAssembly : TyphoonAssembly

/* ---------------------------------- First Example -------------------------------- */

- (ViewController *)viewController;

- (id <DataModelConfigurator>)dataModel;


@end

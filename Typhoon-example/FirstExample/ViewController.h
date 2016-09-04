//
//  ViewController.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 03.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@class DetailAppAssembly;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id <DataModelConfigurator> dataModel;

@property (nonatomic, strong) DetailAppAssembly *detailAppAssembly;

@end


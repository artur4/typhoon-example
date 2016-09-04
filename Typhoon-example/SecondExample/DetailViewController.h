//
//  DetailViewController.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailDataModel.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id <DetailDataModelConfigurator> detailDataModel;

@end

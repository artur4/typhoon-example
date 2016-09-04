//
//  DetailDataConfigurator.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DetailDataModelConfigurator <NSObject>

- (void)setupTableView:(UITableView *)tableView;

@end

//
//  DataModelProtocol.h
//  Typhoon-example
//
//  Created by Artur Mirrov on 03.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

@import Foundation;


@protocol DataModelConfigurator <NSObject>

- (void)setupTableView:(UITableView *)tableView;

@end

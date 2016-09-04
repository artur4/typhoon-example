//
//  DataModel.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 03.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "DataModel.h"

@interface DataModel () <UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

static NSString *cellId = @"cell";

@implementation DataModel

- (void)setupTableView:(UITableView *)tableView {
    
    self.tableView = tableView;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = @"1";
    return cell;
}




@end

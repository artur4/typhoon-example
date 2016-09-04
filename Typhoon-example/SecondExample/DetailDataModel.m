//
//  DetailDataModel.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "DetailDataModel.h"

@interface DetailDataModel () <UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *detailCell = @"detailCell";

@implementation DetailDataModel

- (void)setupTableView:(UITableView *)tableView {
    
    self.tableView = tableView;
    self.tableView.dataSource = self;
}


#pragma mark - UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCell forIndexPath:indexPath];
    id object = [self objectAtIndexPath:indexPath];
    
    cell.textLabel.text = @"2";
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionIndex = self.fetchedResultsController.sections[section];
    return sectionIndex.numberOfObjects;
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

#pragma mark NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
  
    /*.......*/
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}



@end

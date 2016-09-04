//
//  ViewController.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 03.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "DetailAppAssembly.h"

@interface ViewController () <UITableViewDelegate>

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"init %@", NSStringFromClass([self class]));
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.dataModel setupTableView:self.tableView];
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailViewController = [self.detailAppAssembly detailViewController];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%@ id deallocate", NSStringFromClass([self class]));
}

@end

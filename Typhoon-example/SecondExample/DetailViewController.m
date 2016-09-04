//
//  DetailViewController.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

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
    
    [self.detailDataModel setupTableView:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%@ id deallocate", NSStringFromClass([self class]));
}


@end

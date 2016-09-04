//
//  CoreDataManager.m
//  Typhoon-example
//
//  Created by Artur Mirrov on 04.09.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager ()

@property (nonatomic) NSURL* modelURL;
@property (nonatomic) NSURL* storeURL;
@property (nonatomic, strong) NSDictionary *options;

@property (nonatomic, readwrite) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, readwrite) NSManagedObjectContext* backgroundManagedObjectContext;

@end

@implementation CoreDataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupManagedObjectContexts];
    }
    return self;
}


- (void)setupManagedObjectContexts {
    
    self.managedObjectContext = [self setupManagedObjectContextWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
    
    self.backgroundManagedObjectContext = [self setupManagedObjectContextWithConcurrencyType:NSPrivateQueueConcurrencyType];
    self.backgroundManagedObjectContext.undoManager = nil;
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NSManagedObjectContextDidSaveNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification* note) {
         NSManagedObjectContext *moc = self.managedObjectContext;
         if (note.object != moc) {
             [moc performBlock:^(){
                 [moc mergeChangesFromContextDidSaveNotification:note];
             }];
         }
     }];
}

- (NSManagedObjectContext *)setupManagedObjectContextWithConcurrencyType:(NSManagedObjectContextConcurrencyType)concurrencyType {
    
    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:concurrencyType];
    managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSError* error;
    
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption : @(YES),
                              NSInferMappingModelAutomaticallyOption : @(YES)};
    
    [managedObjectContext.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                  configuration:nil
                                                                            URL:self.storeURL
                                                                        options:options
                                                                          error:&error];
    if (error) {
        NSLog(@"error: %@", error.localizedDescription);
        NSLog(@"rm \"%@\"", self.storeURL.path);
    }
    
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
    
    return managedObjectContext;
}

- (NSURL*)storeURL {
    
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                       inDomain:NSUserDomainMask
                                                              appropriateForURL:nil
                                                                         create:YES
                                                                          error:NULL];
    
    return [documentsDirectory URLByAppendingPathComponent:@"Typhoon-example.sqlite"];
}

- (NSURL*)modelURL {
    
    return [[NSBundle mainBundle] URLForResource:@"Typhoon-example" withExtension:@"momd"];
}

- (NSManagedObjectModel*)managedObjectModel {
    
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}



#pragma mark - Core Data Saving support

- (void)saveContext {
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
}

- (void)saveBackgroundContext {
    
    NSError *error = nil;
    if (![self.backgroundManagedObjectContext save:&error]) {
        NSLog(@"error importer: %@", error.localizedDescription);
    }
}

@end

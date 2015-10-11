//
//  DCCoreDataManager.h
//  Pods
//
//  Created by Cortes Saenz, David on 10/11/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DCCoreDataManager : NSObject

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

+ (instancetype)sharedInstance;

- (instancetype)init __attribute__((unavailable("Use [CoreDataManager sharedInstance] instead")));
- (instancetype)new __attribute__((unavailable("Use [CoreDataManager sharedInstance] instead")));

- (void)setDataBaseName:(NSString *)database;
- (void)initContext;
- (NSManagedObjectContext *)contextForThread;
- (void)saveContext;

- (id)saveEntity:(NSString *)entityName withValues:(NSDictionary *)values;
- (NSArray *)getEntities:(NSString *)entityName;
- (NSArray *)getEntities:(NSString *)entityName withPredicate:(NSPredicate *)predicate;
- (void)deleteEntity:(id)entity;
- (id)updateEntity:(id)entity withValues:(NSDictionary *)values;

@end

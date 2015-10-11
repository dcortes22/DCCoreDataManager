# DCCoreDataManager

[![CI Status](http://img.shields.io/travis/David Cortes/DCCoreDataManager.svg?style=flat)](https://travis-ci.org/David Cortes/DCCoreDataManager)
[![Version](https://img.shields.io/cocoapods/v/DCCoreDataManager.svg?style=flat)](http://cocoapods.org/pods/DCCoreDataManager)
[![License](https://img.shields.io/cocoapods/l/DCCoreDataManager.svg?style=flat)](http://cocoapods.org/pods/DCCoreDataManager)
[![Platform](https://img.shields.io/cocoapods/p/DCCoreDataManager.svg?style=flat)](http://cocoapods.org/pods/DCCoreDataManager)

DCCoreDataManager is a Objective C library for iOS. It encapsulates all the Core Data Stack and give to the developeras a Thread Safe mode to use Core Data in your applications.

## Requirements
You need to add the CoreData Framework to your project if you wanto to use this pod.

## Installation

DCCoreDataManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DCCoreDataManager"
```

In your AppDelegate import the DCCoreDataManager.h file and init the instance.

```objective-c
#import "AppDelegate.h"
#import "CoreDataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[DCCoreDataManager sharedInstance]setDataBaseName:@"Your_App_Model_Name"];
    [[DCCoreDataManager sharedInstance]initContext];
    return YES;
}
@end
```

Now you are ready to use Core Data on your app.

## How to Use
### Saving Entities

To save or create a new entity you need to pass a dictionary with the keys and values that you want to add. The keys must be the same as the attributes names of your entity.

```objective-c
NSMutableDictionary *entityValues = [NSMutableDictionary dictionary];
[entityValues setObject:@"A_User_Name" forKey:@"userName"];
[entityValues setObject:@"A_Name" forKey:@"Name"];
[entityValues setObject:@"A_Name_Last_Nam" forKey:@"lastName"];
User *entity = [[DCCoreDataManager sharedInstance]saveEntity:@"User" withValues:entityValues];
[[DCCoreDataManager sharedInstance] saveContext];
```
The saveEntity:withValues: method returns the saved Entity. You can used to manually add the possible relationships.

### Retrieving Entities
To retrieve entities, you have two options, retrieve all the entities withot distinction or pass a predicate to filter your results.

```objective-c
NSArray *results = [[DCCoreDataManager sharedInstance] getEntities:@"User"];
```

With the funciton getEntities: all the NSManagedObjects are going to be on a NSArray.

If you want you can set a predicate to filter your results.

```objective-c
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"Name", @"Doe"];
NSArray *results = [[DCCoreDataManager sharedInstance] getEntities:@"User" withPredicate:predicate];
```

### Update Entities
DCCoreDataManager gives you the posibility to update entities. To do this you have to pass the entity to be updated with the values dictionary.

```objective-c
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"Name", @"Doe"];
NSArray *results = [[DCCoreDataManager sharedInstance] getEntities:@"User" withPredicate:predicate];

User *userEntity = [results objectAtIndex:0];

NSMutableDictionary *entityValues = [NSMutableDictionary dictionary];
[entityValues setObject:@"planet23" forKey:@"userName"];

userEntity = [[DCCoreDataManager sharedInstance]updateEntity:userEntity withValues:entityValues];
[[DCCoreDataManager sharedInstance] saveContext];
```

### Delete Entities
To delete a entity you only have to pass the entity to be deleted to the method deleteEntity:

```objective-c
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"Name", @"Doe"];
NSArray *results = [[DCCoreDataManager sharedInstance] getEntities:@"User" withPredicate:predicate];

User *userEntity = [results objectAtIndex:0];
[[DCCoreDataManager sharedInstance] deleteEntity:userEntity];
[[DCCoreDataManager sharedInstance] saveContext];
```

## Author

David Cortes, [@dcortes22](https://www.twitter.com/dcortes22)

## License

DCCoreDataManager is available under the MIT license. See the LICENSE file for more info.

//
//  XMLparsingEntity.m
//  XmlParsingUsingCD
//
//  Created by Suresh on 24/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import "XMLparsingEntity.h"


@implementation XMLparsingEntity

@dynamic descriptionname;
@dynamic image;
@dynamic name;

@end


/*
 context = [self managedObjectContext];
 NSMutableArray *descriptionArry_ = [self descriptionArrray:indexPath.section];
 NSString *desc = [descriptionArry_ objectAtIndex:indexPath.row];
 NSManagedObject *entityName = [NSEntityDescription insertNewObjectForEntityForName:@"XMLparsingEntity" inManagedObjectContext:context ];

 [entityName setValue:entryArray_[indexPath.row] forKey:@"name"];
 [entityName setValue:desc forKey:@"descriptionname"];
 NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
 [entityName setValue:imageData forKey:@"image"];
 [entityName setValue:[NSNumber numberWithInteger:indexPath.section] forKey:@"section"];
 [entityName setValue:[NSNumber numberWithInteger:indexPath.row] forKey:@"row"];
 NSError *SaveError = nil;
 if (![context save:&error])
 {
 NSLog(@" can't save %@",SaveError);
 }

 }
 else {

 context = [self managedObjectContext];
 cellName = (panelCellView *)[tableView dequeueReusableCellWithIdentifier:@"imageCellIdentifier"];
 if (cellName == nil) {
 cellName = [[panelCellView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"panelCellView"];
 }
 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
 NSEntityDescription *description = [NSEntityDescription entityForName:@"XMLparsingEntity" inManagedObjectContext:context];
 fetchRequest.resultType = NSDictionaryResultType;
 [fetchRequest setEntity:description];

 NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
 nameArrayCD = [array valueForKey:@"name"];
 descriptionArrayCD = [array valueForKey:@"descriptionname"];
 imageArrayCD = [array valueForKey:@"image"];

 NSMutableArray *imageArrayCoreData = [self imageArrayForCD:indexPath.section];
 NSMutableArray *titleArrayCoreData = [self titleArrayForCD:indexPath.section];

 cellName.imageView.image = [imageArrayCoreData objectAtIndex:indexPath.row];
 cellName.textLabel.text =  [titleArrayCoreData objectAtIndex:indexPath.row];

 NSLog(@"images == >%@",mainImageArray);
 }

 return cellName;

 
 
 
 
 
 
 

 isNetworkReachable= [[Reachability reachabilityForInternetConnection]isNetworkReachable];
 internetStatus  = [reachability currentReachabilityStatus];
 if ((internetStatus == !ReachableViaWiFi) || (internetStatus == !ReachableViaWWAN))
 {
 isNetworkReachable = NO;
 context = [self managedObjectContext];
 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
 NSEntityDescription *description = [NSEntityDescription entityForName:@"XMLparsingEntity" inManagedObjectContext:context];
 fetchRequest.resultType = NSDictionaryResultType;
 [fetchRequest setEntity:description];

 NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];

 nameArrayCD = [array valueForKey:@"name"];
 descriptionArrayCD = [array valueForKey:@"descriptionname"];
 imageArrayCD = [array valueForKey:@"image"];

 NSArray *noDuplicates = [[NSSet setWithArray: sectionArrayCD] allObjects];
 NSLog(@"Section Count %lu",(unsigned long)noDuplicates.count);
 isNetworkReachable = YES;
 [panelXmlParser parse];
 [panelTableView reloadData];
 }
 else
 {
 }


 */
//
//  XMLparsingEntity.h
//  XmlParsingUsingCD
//
//  Created by Suresh on 24/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface XMLparsingEntity : NSManagedObject

@property (nonatomic, retain) NSString * descriptionname;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * name;

@end

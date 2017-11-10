//
//  CoreDataManager.h
//  XmlParsingUsingCD
//
//  Created by Suresh on 24/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CoreDataManager : NSObject

- (UIImage *)downloadImageAtURL:(NSString *)imageURL toImageView:(UIImageView *)imageView;
+(CoreDataManager *)sharedInstance;
@end

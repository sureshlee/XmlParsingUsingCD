//
//  CoreDataManager.m
//  XmlParsingUsingCD
//
//  Created by Suresh on 24/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import "CoreDataManager.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "PanelCellView.h"
@implementation CoreDataManager


+(CoreDataManager *)sharedInstance{

    static CoreDataManager *instance = nil;
    if (instance == nil) {
        instance = [[CoreDataManager alloc]init];
}
return instance;
}

- (UIImage *)downloadImageAtURL:(NSString *)imageURL toImageView:(UIImageView *)imageView
{
    __block UIImage *img;

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

            NSData *image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageURL]];
            img = [UIImage imageWithData:image];

            dispatch_async(dispatch_get_main_queue(), ^{
                if (imageView) {
                    [imageView setImage:img];
                }
            });
        });
    return img;
}

@end

//dispatch_async(dispatch_get_main_queue(), ^{
//    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[imageList_ objectAtIndex:indexPath.row]]];
//    cellName.imageView.image = [UIImage imageWithData:imageData];
//});
//

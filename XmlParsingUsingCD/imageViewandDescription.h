//
//  imageViewandDescription.h
//  XmlParsing
//
//  Created by iOS on 13/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageViewandDescription : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView_;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic ,strong) NSString *url, *label;
@end

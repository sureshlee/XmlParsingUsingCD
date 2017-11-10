//
//  imageViewandDescription.m
//  XmlParsing
//
//  Created by iOS on 13/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import "imageViewandDescription.h"

@interface imageViewandDescription ()
{
    imageViewandDescription *imageDes;
}

@end

@implementation imageViewandDescription
@synthesize url,label;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self.imageView_ setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.url]]]];

     self.descriptionLabel.text = self.label;

       [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

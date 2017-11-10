//
//  ViewController.h
//  XmlParsingUsingCD
//
//  Created by Suresh on 23/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate,UITableViewDataSource,UITableViewDataSource,UIAlertViewDelegate,UIGestureRecognizerDelegate>
{
    IBOutlet UITableView * panelTableView;
    IBOutlet UIBarButtonItem * clearButton;
}

@property (nonatomic ,strong) NSManagedObjectContext * context;
@property (nonatomic ,strong) NSMutableArray * imageList_;

- (IBAction)clearButtonAction:(id)sender;

- (NSManagedObjectContext *) managedObjectContext;
@end

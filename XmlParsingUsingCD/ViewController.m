//
//  ViewController.m
//  XmlParsingUsingCD
//
//  Created by Suresh on 23/12/14.
//  Copyright (c) 2014 tringapps. All rights reserved.
//

#import "ViewController.h"
#import "PanelCellView.h"
#import "imageViewandDescription.h"
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "AsyncImageView.h"

@interface ViewController ()
{
    NSMutableString * entryTitleString, * entryTypeString;
    NSMutableArray * entryArray , * entryTypeArray;
    BOOL itemSelected, isNetworkReachable;
    NSString * element;
    NSMutableArray * datasArray , * descriptionArrayList, *mainImageArray ,*imageArray;
    NSArray * arrayName;
    NSString * currentElement;
    NSMutableString * imageString;
    NSManagedObject * managedObject;
    NSMutableArray * nameArrayCD;
    NSMutableArray * descriptionArrayCD;
    NSMutableArray * imageArrayCD;
    NSMutableArray * sectionArrayCD;
    NSMutableArray * rowArrayCD;
    NetworkStatus  internetStatus;
    Reachability * reachability;
}
@end
@implementation ViewController
@synthesize context,imageList_;

- (void)viewDidLoad
{

#pragma mark - XML parser and Delegates
    
    arrayName = [[NSArray alloc]initWithObjects:@"Panel 1", @"Panel 2",@"Panel 3",@"Panel 4",@"Panel 5", nil];
    
    descriptionArrayList = [[NSMutableArray alloc]init];
    datasArray = [[NSMutableArray alloc]init];
    mainImageArray = [[NSMutableArray alloc]init];

    nameArrayCD = [[NSMutableArray alloc]init];
    descriptionArrayCD = [[NSMutableArray alloc]init];
    imageArrayCD = [[NSMutableArray alloc]init];
    sectionArrayCD = [[NSMutableArray alloc]init];
    rowArrayCD = [[NSMutableArray alloc]init];
    imageList_ = [[NSMutableArray alloc]init];

    //    https://reuters-test.appspot.com/resources/entries/hierarchy/1/xml

    NSURL *urlName = [NSURL URLWithString:@"https://reuters-test.appspot.com/resources/entries/hierarchy/1/xml"];
    NSXMLParser *panelXmlParser = [[NSXMLParser alloc]initWithContentsOfURL:urlName];
    [panelXmlParser setDelegate:self];
    [panelXmlParser parse];
    [super viewDidLoad];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    currentElement = elementName;
    if([elementName isEqualToString:@"Panel"]) {
        itemSelected = YES;
        entryArray = [[NSMutableArray alloc]init];
        entryTypeArray = [[NSMutableArray alloc]init];
        imageArray = [[NSMutableArray alloc]init];
    }
    else if([elementName isEqualToString:@"Entry"]) {
        entryTitleString  = [attributeDict objectForKey:@"entryName"];
        entryTypeString   = [attributeDict objectForKey:@"entryType"];
        [entryArray addObject:entryTitleString];
        [entryTypeArray addObject:entryTypeString];
    }
    if ([elementName isEqualToString:@"thumbnailimageurl"]) {
        imageString = [[NSMutableString alloc]init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{

    if ([currentElement isEqualToString:@"thumbnailimageurl"]) {
        [imageString setString:string];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if ([elementName isEqualToString:@"Panel"]) {
        itemSelected = NO;
        [datasArray addObject:entryArray];
        [descriptionArrayList addObject:entryTypeArray];
        [mainImageArray addObject:imageArray];
    }

    if ([elementName isEqualToString:@"Entry"]) {
        itemSelected = NO;
        [imageArray addObject:imageString];
    }
}

#pragma mark - TableView DataSources and Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [[self arrayForSection:section]count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return datasArray.count;

}
- (IBAction)clearButtonAction:(id)sender {

    //    NSArray *stores = [__persistentStoreCoordinator persistentStores];
    //    for(NSPersistentStore *store in stores) {
    //        [__persistentStoreCoordinator removePersistentStore:store error:nil];
    //        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    //    }
    //    [__managedObjectContext unlock];
    //    __managedObjectModel    = nil;
    //    __managedObjectContext  = nil;
    //    __persistentStoreCoordinator = nil;
    //}
    //}
}
-(NSManagedObjectContext *)managedObjectContext {

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    
    return context;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    panelCellView *cellName;
    cellName = (panelCellView *)[tableView dequeueReusableCellWithIdentifier:@"imageCellIdentifier"];

    if (cellName == nil)
        cellName = [[panelCellView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"panelCellView"];

    NSMutableArray *entryArray_ = [self arrayForSection:indexPath.section];
    cellName.textLabel.text = entryArray_[indexPath.row];
    imageList_= [self imagesArray:indexPath.section];
    
   // cellName.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[imageList_ objectAtIndex:indexPath.row]]]];
    
    
    AsyncImageView *imgView=[[AsyncImageView alloc] initWithFrame:CGRectMake(20, 5, 90, 70)];
    imgView.backgroundColor=[UIColor clearColor];
    [imgView.layer setCornerRadius:8.0f];
    [imgView.layer setMasksToBounds:YES];
    
    [imgView setImage:[UIImage imageNamed:[NSString stringWithContentsOfURL:[NSURL URLWithString:[imageList_ objectAtIndex:indexPath.row]] usedEncoding:nil error:nil]]];
    
    [cellName.contentView addSubview:imgView];

//    [[CoreDataManager sharedInstance] downloadImageAtURL:[imageList_ objectAtIndex:indexPath.row] toImageView:cellName.imageView];

    return cellName;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{

    imageViewandDescription *imageViewObject = [self.storyboard instantiateViewControllerWithIdentifier:@"imageIdetifier"];
    [self.navigationController pushViewController:imageViewObject animated:YES];
    NSMutableArray *imageArray_ = [self imagesArray:indexPath.section];
    NSMutableArray *descriptionArry_ = [self descriptionArrray:indexPath.section];
    imageViewObject.url   = [imageArray_ objectAtIndex:indexPath.row];
    imageViewObject.label = [descriptionArry_ objectAtIndex:indexPath.row];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [arrayName objectAtIndex:section];
}

- (NSMutableArray *)arrayForSection:(NSInteger)section {
    return datasArray[section];
}

- (NSMutableArray *)imagesArray:(NSInteger)section {
    return mainImageArray[section];
}

-(NSMutableArray *)imageArrayForCD :(NSInteger)section
{
    return imageArrayCD[section];
}

-(NSMutableArray *)titleArrayForCD :(NSInteger)section
{
    return nameArrayCD[section];
}

- (NSMutableArray *)descriptionArrray:(NSInteger)section {
    return descriptionArrayList[section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

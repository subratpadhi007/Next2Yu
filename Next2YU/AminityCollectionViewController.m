//
//  AminityCollectionViewController.m
//  Next2YU
//
//  Created by Java Guru IOS on 29/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import "AminityCollectionViewController.h"
#import "AminityCollectionViewCell.h"
#import "parser.h"
#import "AminityListingTableViewController.h"

@interface AminityCollectionViewController ()
{

    NSArray *imagesDesc;
    NSArray *LabelDesc;
}
@end

@implementation AminityCollectionViewController

static NSString * const reuseIdentifier = @"AminityCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    imagesDesc = [NSArray arrayWithObjects:@"bank.jpg",@"hospitals.jpg",@"bus.jpg",@"park.jpg",@"restaurant.jpg",@"gym.jpg",@"shopping_mall.jpg",@"club.jpg",@"movie_theater.jpg",@"spa.jpg",@"fire_station.jpg",@"police.jpg",@"liquor_store.jpg",@"book_store.jpg",@"atm.jpg",@"library.jpg",@"electronics_store.jpg",@"train_station.jpg",@"pet_store.jpg",@"florist.jpg",@"gas_station.jpg",nil];
    LabelDesc = [NSArray arrayWithObjects:@"Hospitals",@"Banks",@"Bus Stations",@"Parks",@"Resturants",@"Gyms",@"Shopping Malls",@"Clubs",@"Movie Theater",@"Spa",@"Fire Station",@"Police Station",@"Liquor Store",@"Book Store",@"Atm",@"Library",@"Electronics Store",@"Train Station",@"Pet Store",@"Florist",@"Petrol Bunk",nil];
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return imagesDesc.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AminityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    [[cell aminityImage]setImage:[UIImage imageNamed:[imagesDesc objectAtIndex:indexPath.row]]];
    [[cell amintyLabelDesc]setText:[LabelDesc objectAtIndex:indexPath.row]];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    switch (indexPath.row) {
        case 0:
            [self createRquest:@"bank"];
            break;
        case 1:
          [self createRquest:@"hospital"];
            break;
        case 2:
           [self createRquest:@"bus_station"];
            break;
        case 3:
             [self createRquest:@"park"];
            break;
        case 4:
              [self createRquest:@"restaurant"];
            break;
        case 5:
            [self createRquest:@"gym"];
            break;
        case 6:
            [self createRquest:@"shopping_mall"];
            break;
        case 7:
            [self createRquest:@"night_club"];
            break;
        case 8:
            [self createRquest:@"movie_theater"];
            break;
        case 9:
            [self createRquest:@"spa"];
            break;
        case 10:
            [self createRquest:@"fire_station"];
            break;
        case 11:
            [self createRquest:@"police"];
            break;
        case 12:
            [self createRquest:@"liquor_store"];
            break;
        case 13:
            [self createRquest:@"book_store"];
            break;
        case 14:
            [self createRquest:@"atm"];
            break;
        case 15:
            [self createRquest:@"library"];
            break;
        case 16:
            [self createRquest:@"electronics_store"];
            break;
        case 17:
            [self createRquest:@"train_station"];
            break;
        case 18:
            [self createRquest:@"pet_store"];
            break;
        case 19:
            [self createRquest:@"florist"];
            break;
        case 20:
            [self createRquest:@"gas_station"];
            break;
            
        default:
            break;
    }
    
    
    
    }





#pragma mark coonection method

-(void)createRquest:(NSString*)aString
{
     NSString *theUrlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=12.9345,77.6113&radius=1000&type=%@&key=AIzaSyDRpSssMwn200X-jxfpL3olqgoPAjikKTg",aString];
    //AIzaSyDdZwaymGMf7cGNAk3J9q2gCbsVA1OZUuQ";
    [self createConnectionWithRequest:[self createUrlWithString:theUrlString]];
}
-(NSURL*)createUrlWithString:(NSString*)aString
{
    NSURL *theUrl = [NSURL URLWithString:aString];
    return theUrl;
}

-(void)createConnectionWithRequest:(NSURL*)aUrlString
{
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:aUrlString];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    [conn start];
    
    
}



#pragma mark ###NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    parser *theParser  = [[parser alloc]init];
    theParser.delegate = self;
    [theParser parseWithData:_responseData];
    //[theParser parseXmlData:_responseData];
    
}

-(void)onParsedData:(NSMutableArray*)aArray
{
    _mArray = aArray;
    [self performSegueWithIdentifier:@"aminityDetailListing" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AminityListingTableViewController *dest = [segue destinationViewController];
    dest.mDetailListingArray = _mArray;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout *)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//          return CGSizeMake(130.f, 130.f);
//}




-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int numberOfCellInRow = 4;
    CGFloat cellWidth = [[UIScreen mainScreen] bounds].size.width/numberOfCellInRow;
    return CGSizeMake(cellWidth, cellWidth);
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

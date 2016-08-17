//
//  AminityDescriptionTVController.m
//  Next2YU
//
//  Created by Java Guru IOS on 29/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import "AminityDescriptionTVController.h"
#import "AminityDecriptionTVCell.h"
#import "AminityListingTableViewController.h"
#import <MapKit/MapKit.h>


@interface AminityDescriptionTVController ()



@end

static NSString * const reuseIdentifier1 = @"DescriptionToDetailVC";




@implementation AminityDescriptionTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"the dic is %@", _mDetailDict);
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AminityDecriptionTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier1" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    
    cell.mAminityTitle.text= [_mDetailDict objectForKey:@"name" ];
    cell.mAminityAddrs.text =[_mDetailDict objectForKey:@"vicinity"];
    
    NSString *string =[_mDetailDict valueForKey:@"iconn"];;
    
    
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.mAminityIcon.image = [UIImage imageWithData:data];
    
    CLLocationCoordinate2D coord;
    NSString *lat1 = [_mDetailDict objectForKey:@"latitude"];
    NSString *longtitude =  [_mDetailDict objectForKey:@"long"];
    
    coord.latitude= [lat1 doubleValue];
    coord.longitude= [longtitude doubleValue];
    MKCoordinateRegion region1;
    region1.center=coord;
    region1.span.longitudeDelta=0.08 ;
    region1.span.latitudeDelta=0.08;
    [cell.mMapView setRegion:region1  animated:YES];
    //// Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coord;
    point.title = [_mDetailDict objectForKey:@"name"];
    
    [cell.mMapView addAnnotation:point];
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  AminityListingTableViewController.m
//  Next2YU
//
//  Created by Java Guru IOS on 03/08/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import "AminityListingTableViewController.h"
#import "AminityDetailCellTableViewCell.h"
#import "AminityDescriptionTVController.h"

@interface AminityListingTableViewController ()

@end


@implementation AminityListingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return _mDetailListingArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AminityDetailCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailListingIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.mDetailNameLabel.text = [[_mDetailListingArray objectAtIndex:indexPath.row] valueForKey:@"name"];
   cell.latituuu.text = [[_mDetailListingArray objectAtIndex:indexPath.row] valueForKey:@"latitude"];
    cell.logituu.text = [[_mDetailListingArray objectAtIndex:indexPath.row] valueForKey:@"long"];
    NSString *string = [[_mDetailListingArray objectAtIndex:indexPath.row] valueForKey:@"iconn"];
    NSURL *url = [NSURL URLWithString:string];

//    NSData *data = [NSData dataWithContentsOfURL:url];
//    cell.imageView.image = [UIImage imageWithData:data];
    
  //cell.imageView.image =
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background Thread
          NSData *data = [NSData dataWithContentsOfURL:url];
       // NSLog(@"data is %@",data);
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            if (data != nil) {
                  cell.imageView.image = [UIImage imageWithData:data];
                
            }
        });
    });
  
    
    
    
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"DescriptionToDetailVC" sender:indexPath];


}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexpath = (NSIndexPath*)sender;
    AminityDescriptionTVController *vc = (AminityDescriptionTVController*)segue.destinationViewController;
    vc.mDetailDict = [_mDetailListingArray objectAtIndex:indexpath.row];
    
    
    
    
    
    
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

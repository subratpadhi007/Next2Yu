//
//  AminityDecriptionTVCell.h
//  Next2YU
//
//  Created by Java Guru IOS on 29/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AminityDecriptionTVCell : UITableViewCell
{
    
    MKMapView *mapview;
}

@property (weak, nonatomic) IBOutlet UILabel *mAminityTitle;
@property (weak, nonatomic) IBOutlet UIImageView *mAminityIcon;
@property (weak, nonatomic) IBOutlet UILabel *mAminityAddrs;
@property (weak, nonatomic) IBOutlet MKMapView *mMapView;



@end

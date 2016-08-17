//
//  AminityDecriptionTVCell.m
//  Next2YU
//
//  Created by Java Guru IOS on 29/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import "AminityDecriptionTVCell.h"

@implementation AminityDecriptionTVCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)mapSegment:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mMapView.mapType =MKMapTypeStandard;
            break;
            
        case 1:
            _mMapView.mapType = MKMapTypeSatellite;
            break;
            
        case 2:
            _mMapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
        }
}
@end

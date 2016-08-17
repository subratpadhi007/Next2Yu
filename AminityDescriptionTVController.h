//
//  AminityDescriptionTVController.h
//  Next2YU
//
//  Created by Java Guru IOS on 29/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface AminityDescriptionTVController : UITableViewController<MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>

 

@property(nonatomic,strong)NSMutableArray *mDetailArray;

@property(nonatomic,strong)NSDictionary *mDetailDict;

@property(nonatomic,strong)CLLocationManager *locationManager;

@end

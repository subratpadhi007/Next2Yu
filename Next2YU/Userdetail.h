//
//  Userdetail.h
//  Next2YU
//
//  Created by Java Guru IOS on 21/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Userdetail : NSManagedObject

@property (nonatomic, retain) NSString * mobile;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * fullname;

@end

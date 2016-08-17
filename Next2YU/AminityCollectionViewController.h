//
//  AminityCollectionViewController.h
//  Next2YU
//
//  Created by Java Guru IOS on 29/07/16.
//  Copyright (c) 2016 subrat's LAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "parser.h"

@interface AminityCollectionViewController : UICollectionViewController<SearchParserDelegate>

@property(nonatomic,strong) NSMutableData *responseData;
@property(nonatomic,strong)NSMutableArray *mArray;

    



@end

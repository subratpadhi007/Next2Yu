//
//  parser.h
//  Amazing Karnatakka
//
//  Created by Java Guru IOS on 11/09/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchParserDelegate

-(void)onParsedData:(NSMutableArray*)aArray;

@end

@interface parser : NSObject<NSXMLParserDelegate>
{
    NSXMLParser *xmlParser;
    NSMutableString *foundValue;
    NSMutableDictionary *dictTempDataStorage;
    NSString *currentElement;
    NSMutableArray  *inputArray;
}

@property(nonatomic,weak)id <SearchParserDelegate> delegate;
    
-(void)parseWithData:(NSMutableData*)aData;

-(void)parseXmlData:(NSData*)responseData;

@end


//
//  parser.m
//  Amazing Karnatakka
//
//  Created by Java Guru IOS on 11/09/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import "parser.h"

@implementation parser

# pragma mark JSON PARSER
-(void)parseWithData:(NSData*)aData
{
    //        NSError *error;
    //        NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:aData options:0 error:&error];
    [self ParseJsonDatawitDictionary:aData];
    
    
}

-(void)ParseJsonDatawitDictionary:(NSData*)responseData
{
    //NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    // NSMutableArray *FinalresultArray = [[NSMutableArray alloc]init];
    //NSMutableDictionary *mResultDic  = [[NSMutableDictionary alloc]init];
    NSError *error;
    NSDictionary *json= [NSJSONSerialization JSONObjectWithData:responseData options:nil error:&error];
    
    NSMutableArray *response = [json valueForKey:@"results"];
    inputArray=[[NSMutableArray alloc]init];
    
    
    for(NSDictionary *dict in response)
    {
        NSMutableDictionary * myInternalDict = [[NSMutableDictionary alloc]init];
        
        NSString *latstring = [NSString stringWithFormat:@"%@",[[[dict valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"]] ;
        
        NSString *longstring = [NSString stringWithFormat:@"%@",[[[dict valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"]] ;
        
        [myInternalDict setValue: latstring forKey:@"latitude"];
        [myInternalDict setValue: longstring forKey:@"long"];
        
//        [myInternalDict setValue: [[[dict valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"] forKey:@"latitude"];
//        [myInternalDict setValue: [[[dict valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"] forKey:@"long"];
//        
        
        
        [myInternalDict setValue:[dict valueForKey:@"name"] forKey:@"name"];
        [myInternalDict setValue:[dict valueForKey:@"vicinity"] forKey:@"vicinity"];
        
        NSString *iconstring = [NSString stringWithFormat:@"%@",[dict valueForKey:@"icon"]];
        
        [myInternalDict setValue:iconstring forKey:@"iconn"];
        
        //[myInternalDict setValue:[[dict valueForKey:@"photos"]valueForKey:@"photo_reference"] forKey:@"PPimage"];
        
        
        [inputArray addObject:myInternalDict];
    }
    
    
    
    NSLog(@"final esult array is %@", inputArray);
    [_delegate onParsedData:inputArray];
    
}



# pragma mark XML PARSER



-(void)parseXmlData:(NSData*)responseData
{
    xmlParser = [[NSXMLParser alloc] initWithData:responseData];
    xmlParser.delegate = self;
    NSString *string = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"the XML string is %@", string);
    foundValue = [[NSMutableString alloc] init];
    [xmlParser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"result"])
    {
        dictTempDataStorage = [[NSMutableDictionary alloc] init];
    }
    currentElement = elementName;
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"result"])
    {
        [inputArray addObject:[[NSDictionary alloc] initWithDictionary:dictTempDataStorage]];
        
    }
    else if ([elementName isEqualToString:@"name"])
    {
        [dictTempDataStorage setObject:[NSString stringWithString:foundValue] forKey:@"name"];
    }
    else if ([elementName isEqualToString:@"vicinity"])
    {
        [dictTempDataStorage setObject:[NSString stringWithString:foundValue] forKey:@"vicinity"];
    }
    
    else if ([elementName isEqualToString:@"lat"])
    {
        [dictTempDataStorage setObject:[NSString stringWithString:foundValue] forKey:@"latitude"];
    }
    
    else if ([elementName isEqualToString:@"lng"])
    {
        [dictTempDataStorage setObject:[NSString stringWithString:foundValue] forKey:@"long"];
    }
    
    else if ([elementName isEqualToString:@"icon"])
    {
        [dictTempDataStorage setObject:[NSString stringWithString:foundValue] forKey:@"iconn"];
    }
    [foundValue setString:@""];
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([currentElement isEqualToString:@"name"] ||
        [currentElement isEqualToString:@"vicinity"])
    {
        [foundValue appendString:string];
    }
}



-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    inputArray = [[NSMutableArray alloc]init];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"the array is %@",inputArray);
    [_delegate onParsedData:inputArray];
}



@end


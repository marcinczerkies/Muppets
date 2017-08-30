//
//  DataImport.m
//  Muppets
//
//  Created by Marcin Czerkies on 30/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//

#import "DataImport.h"
#import "Muppet.h"

@interface DataImport()
@end

@implementation DataImport

-(NSMutableArray*)importData {
    
    self.dataArray = [[NSMutableArray alloc]init];
    
    NSURL *url = [NSURL URLWithString:@ImportPath];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if( data == nil){
          NSLog(@"Nie ma pliku");
    }
    
    NSError *error = nil;
    
    NSDictionary *muppets = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if(muppets) {
        for (NSDictionary *object in muppets[@"items"]) {
            Muppet *muppet = [[Muppet alloc]init];
            
            muppet.thumbUrl = object[@"thumbnail"];
            muppet.desc = object[@"abstract"];
            muppet.title = object[@"title"];
            muppet.uid = object[@"id"];
            muppet.urlWeb = object[@"url"];
            
            [self.dataArray addObject:muppet];
        }
    }
    return self.dataArray;

    
}

@end

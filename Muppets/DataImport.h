//
//  DataImport.h
//  Muppets
//
//  Created by Marcin Czerkies on 30/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//
#define BasePath "http://muppet.wikia.com"
#define ImportPath "http://muppet.wikia.com/api/v1/Articles/Top?expand=1&category=The_Muppets_Characters&limit=75"

@import Foundation;
@interface DataImport : NSObject
@property (nonatomic,strong) NSMutableArray *dataArray;
-(NSMutableArray*)importData;
@end


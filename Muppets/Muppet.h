//
//  Muppet.h
//  Muppets
//
//  Created by Marcin Czerkies on 22/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//

@import Foundation;

@interface Muppet : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *thumbUrl;
@property (strong, nonatomic) NSNumber *uid;
@property (strong, nonatomic) NSString *urlWeb;
#define BASEPATH @"http://muppet.wikia.com"
@end

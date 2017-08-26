//
//  QASharedModel.h
//  Soluciones
//
//  Created by Marcin Czerkies on 28/09/15.
//  Copyright © 2015 Marcin Czerkies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QASharedModel : NSObject
@property NSMutableArray* FavouritesList;
+ (QASharedModel *) qaSharedModel;
@end

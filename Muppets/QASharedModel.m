//
//  QASharedModel.m
//  Soluciones
//
//  Created by Marcin Czerkies on 28/09/15.
//  Copyright © 2015 Marcin Czerkies. All rights reserved.
//

#import "QASharedModel.h"


@implementation QASharedModel
static QASharedModel *qaSharedModel = nil;
+ (QASharedModel *) qaSharedModel
{
   
    @synchronized(self)
    {
        if (qaSharedModel == nil)
        {
            qaSharedModel = [[QASharedModel alloc] init];
        }
    }
    return qaSharedModel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _FavouritesList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)clear {
    
    qaSharedModel = nil;
}



@end

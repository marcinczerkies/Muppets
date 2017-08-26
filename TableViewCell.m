//
//  TableViewCell.m
//  Muppets
//
//  Created by Marcin Czerkies on 22/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//

#import "TableViewCell.h"
#import "QASharedModel.h"
#import "Muppet.h"
#import "TableVC.h"
#import <Foundation/Foundation.h>

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addToFavoruites:(UIButton *)sender {

    NSNumber *uid = [NSNumber numberWithInt:[self.uid.text integerValue]];

    if ( [[QASharedModel qaSharedModel].FavouritesList containsObject:uid] ) {

            [[QASharedModel qaSharedModel].FavouritesList removeObject:uid];
            [self.favoruiteStar setTitleColor:[UIColor colorWithRed:9/255.0 green:80/255.0 blue:208/255.0 alpha:1.0] forState:UIControlStateNormal];
        
         }
    else {
            [self.favoruiteStar setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [[QASharedModel qaSharedModel].FavouritesList addObject:uid];
    }

    UITableView *parentTable = (UITableView *)self.superview;
    if (![parentTable isKindOfClass:[UITableView class]]) {
        parentTable = (UITableView *) parentTable.superview;
    }
    
    [parentTable reloadData];
}

@end

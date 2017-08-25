//
//  TableViewCell.h
//  Muppets
//
//  Created by Marcin Czerkies on 22/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIButton *favoruiteStar;
@property (weak, nonatomic) IBOutlet UILabel *uid;
@property (weak, nonatomic) IBOutlet UILabel *urlImage;

@end

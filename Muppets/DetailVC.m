//
//  DetailVC.m
//  Muppets
//
//  Created by Marcin Czerkies on 23/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//

#import "DetailVC.h"
#import "TableVC.h"
#import "QASharedModel.h"


@interface DetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIButton *favoruiteStar;



@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

      if ( [[QASharedModel qaSharedModel].FavouritesList containsObject:_muppet.uid] ) {
          [self.favoruiteStar setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
      }
    
    self.name.text = self.muppet.title;
    self.desc.text = self.muppet.desc;
    NSLog(@"%@",self.muppet.desc);
    self.image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.muppet.thumbUrl]]];

}

- (IBAction)backToTableVC:(UIButton *)sender {
    
    TableVC *mainViewController = [[TableVC alloc] initWithNibName:@"TableVC" bundle:nil];
    
    [self presentViewController:mainViewController animated:YES completion:nil];
    
}
- (IBAction)addToFavoruite:(UIButton *)sender {
    
    NSNumber *uid = self.muppet.uid;
    
    if ( [[QASharedModel qaSharedModel].FavouritesList containsObject:uid] ) {
        
        [[QASharedModel qaSharedModel].FavouritesList removeObject:uid];
        [self.favoruiteStar setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
        
    }
    else {
        [self.favoruiteStar setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [[QASharedModel qaSharedModel].FavouritesList addObject:uid];
        NSLog(@"dodano");
    }

}

@end

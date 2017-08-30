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
#import "DataImport.h"


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
        [self.favoruiteStar setTitleColor:[UIColor colorWithRed:9/255.0 green:80/255.0 blue:208/255.0 alpha:1.0] forState:UIControlStateNormal];
        
    }
    else {
        [[QASharedModel qaSharedModel].FavouritesList addObject:uid];
        [self.favoruiteStar setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    
    
    [[NSUserDefaults standardUserDefaults] setObject:[QASharedModel qaSharedModel].FavouritesList forKey:@"favoruites"];


}
- (IBAction)openUrl:(UIButton *)sender {
    
    NSString *urlWeb = [NSString stringWithFormat:@"%@%@", @BasePath, self.muppet.urlWeb];

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlWeb]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlWeb] options:@{} completionHandler:nil];
    }
    
}

@end

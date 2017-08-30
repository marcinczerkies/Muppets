//
//  TableVC.m
//  Muppets
//
//  Created by Marcin Czerkies on 20/08/2017.
//  Copyright © 2017 Marcin Czerkies. All rights reserved.
//

#import "TableVC.h"
#import "TableViewCell.h"
#import "Muppet.h"
#import "DetailVC.h"
#import "QASharedModel.h"
#import "DataImport.h"

@interface TableVC ()

@property (strong, nonatomic) NSMutableArray *muppets;
@end

@implementation TableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
    UIView *customView;
    
    customView = (UIView *)[nib objectAtIndex:0];
    
    return customView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.muppets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TableViewCell";
    
     Muppet *muppet = self.muppets[indexPath.row];
 
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (TableViewCell *)[nib objectAtIndex:0];
    }
    
   
    cell.title.text = muppet.title;
    cell.desc.text = muppet.desc;
    cell.uid.text = [muppet.uid stringValue];
    cell.urlImage.text = muppet.thumbUrl;
    if ( [[QASharedModel qaSharedModel].FavouritesList containsObject:muppet.uid] ) {
       [cell.favoruiteStar setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
    }
    else {
               [cell.favoruiteStar setTitleColor:[UIColor colorWithRed:56/255.0 green:106/255.0 blue:217/255.0 alpha:1.0] forState:UIControlStateNormal];
    }

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", muppet.thumbUrl]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    TableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell)
                        updateCell.image.image = image;
                });
            }
        }
    }];
    [task resume];
    
    return cell;
}
- (IBAction)showOnlyStarred:(UIButton *)sender {
  
    NSArray *tempArray = [self.muppets copy];
    [self.muppets removeAllObjects];
    for (Muppet *object in tempArray) {
        
        for (NSNumber *objectIN in [QASharedModel qaSharedModel].FavouritesList) {
            if([objectIN intValue] == [object.uid intValue]){
                [self.muppets addObject:object];
            }
        }
    }
    
    [self.tableView reloadData];
}
- (IBAction)showAll:(UIButton *)sender {
    [self initData];
    [self.tableView reloadData];
}

-(void)initData {
    
    self.muppets = [[NSMutableArray alloc]init];
    DataImport *dataImport = [[DataImport alloc]init];
    self.muppets = [dataImport importData];
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailVC *detailViewController = [[DetailVC alloc] initWithNibName:@"DetailVC" bundle:nil];
    detailViewController.muppet = self.muppets[indexPath.row];
    
    [self presentViewController:detailViewController animated:YES completion:nil];
}




@end

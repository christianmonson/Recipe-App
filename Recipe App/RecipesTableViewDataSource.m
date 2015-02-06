//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Christian Monson on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"
#import "RecipeViewController.h"

static NSString * const CellIdentifier = @"Cell";


@interface RecipesTableViewDataSource ()
@property (nonatomic, strong) UITableView *tableView;
@end
@implementation RecipesTableViewDataSource



- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    [tableView registerClass:[UITableViewCell class]
      forCellReuseIdentifier:@"cell"];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [RARecipes count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [RARecipes titleAtIndex: indexPath.row];
    
    return cell;

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    
//    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [RARecipes descriptionAtIndex:indexPath.row];
//    cell.detailTextLabel.numberOfLines = 5;
//    
//    return cell;


}



@end

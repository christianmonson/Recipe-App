//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Christian Monson on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDataSource.h"
#import "DetailViewController.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableViewDataSource *recipesDataSource;
@property (nonatomic, strong) DetailViewController *dvc;


@end

@implementation RecipeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.recipesDataSource = [RecipesTableViewDataSource new];
    
    [self.recipesDataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.recipesDataSource;
    
    
    
    self.tableView.delegate = self;
    
    
    
    
    [self.view addSubview:self.tableView];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.indexPathSelected = indexPath;
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    NSLog(@"%@", indexPath);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

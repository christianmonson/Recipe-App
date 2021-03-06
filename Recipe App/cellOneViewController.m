//
//  cellOneViewController.m
//  Recipe App
//
//  Created by Gamaliel Tellez on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "cellOneViewController.h"
#import "RecipesTableViewDataSource.h"

#import "RecipeViewController.h"


@interface cellOneViewController ()
@property (nonatomic, strong) UITableView *tableView;



@end

@implementation cellOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.recipesDataSource = [RecipesTableViewDataSource new];
    
    [self.recipesDataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.recipesDataSource;
    
    [self.view addSubview:self.tableView];

    
    
    
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

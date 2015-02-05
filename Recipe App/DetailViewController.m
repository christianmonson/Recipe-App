//
//  DetailViewController.m
//  Recipe App
//
//  Created by Gamaliel Tellez on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(15,64,self.view.frame.size.width-30,100)];
    description.text=[RARecipes descriptionAtIndex:self.indexPathSelected.row];
    description.numberOfLines=0;

    [self.view addSubview:description];

    
    UILabel *ingredients = [[UILabel alloc] initWithFrame:CGRectMake(15,64,self.view.frame.size.width-30,100)];
    ingredients.text=[RARecipes ingredientsAtIndex:self.indexPathSelected.row];
    ingredients.numberOfLines=0;
    
    [self.view addSubview:ingredients];
    
    
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

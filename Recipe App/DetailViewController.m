//
//  DetailViewController.m
//  Recipe App
//
//  Created by Gamaliel Tellez on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"
#import "RecipesTableViewDataSource.h"

static CGFloat margin = 15;
static NSString * const ingredientKey = @"ingredientType";;
static NSString * const ingredientVolumeKey = @"ingredientVolume";
@interface DetailViewController ()

@property (nonatomic, )  CGFloat lengthOfPreviousFeild;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat widthWithMargin = self.view.frame.size.width - (2 * margin);
    
    self.lengthOfPreviousFeild = margin;
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.scrollView];
    
    
//navigation bar title
    
    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
    
//description
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(margin,self.lengthOfPreviousFeild,widthWithMargin,100)];
    description.text = [RARecipes descriptionAtIndex:self.indexPathSelected.row];
    description.numberOfLines=0;
    [description sizeToFit];
    self.lengthOfPreviousFeild += description.frame.size.height;

    [self.scrollView addSubview:description];
    
//title
    
    UILabel *ingredientsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.lengthOfPreviousFeild, widthWithMargin, 20)];
    ingredientsTitleLabel.text = @"Ingredients";
    self.view.backgroundColor = [UIColor whiteColor];
    [ingredientsTitleLabel sizeToFit];
    self.lengthOfPreviousFeild += ingredientsTitleLabel.frame.size.height;
    [self.scrollView addSubview:ingredientsTitleLabel];

    
//ingredients
    
    NSArray * ingredients = [RARecipes ingredientArrayAtIndex:self.indexPathSelected.row];
    for (int i = 0; i < ingredients.count; i++)
    {
        UILabel *quantityLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.lengthOfPreviousFeild, widthWithMargin, 20)];
        quantityLabel.text = ingredients[i][ingredientVolumeKey];
        [quantityLabel sizeToFit];
        CGFloat quantityHeight = quantityLabel.frame.size.height;
        [self.scrollView addSubview:quantityLabel];
        
        UILabel *ingredientLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + (widthWithMargin * .25) , self.lengthOfPreviousFeild, widthWithMargin * .75, 20)];
        ingredientLabel.numberOfLines = 0;
        ingredientLabel.text = ingredients[i][ingredientKey];
        [ingredientLabel sizeToFit];
        CGFloat ingredientHeight = ingredientLabel.frame.size.height;
        [self.scrollView addSubview:ingredientLabel];
        
        //Determine which label is taller
        if (ingredientHeight > quantityHeight)
        {
            self.lengthOfPreviousFeild += ingredientHeight;
        }
        else
        {
            self.lengthOfPreviousFeild += quantityHeight;
        }
    }
    
    UILabel *directionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.lengthOfPreviousFeild, widthWithMargin, 20)];
    directionTitleLabel.text = @"Directions";
    [directionTitleLabel sizeToFit];
    self.lengthOfPreviousFeild += directionTitleLabel.frame.size.height;
    [self.scrollView addSubview:directionTitleLabel];
    
//directions

    NSArray *directions = [RARecipes directionsAtIndex:self.indexPathSelected.row];
    for (int i = 0; i < directions.count; i++)
    {
        UILabel *numberedListLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.lengthOfPreviousFeild, widthWithMargin * .10, 20)];
        
        //i+1 to start ingredients direction numbering at 1
        
        numberedListLabel.text = [NSString stringWithFormat:@"%d.", i + 1];
        [numberedListLabel sizeToFit];
        CGFloat numberedListHeight = numberedListLabel.frame.size.height;
        [self.scrollView addSubview:numberedListLabel];
        
        UILabel *directionTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + (widthWithMargin* .10), self.lengthOfPreviousFeild, widthWithMargin * .90, 20)];
        directionTextLabel.numberOfLines = 0;
        directionTextLabel.text = directions[i];
        [directionTextLabel sizeToFit];
        CGFloat directionTextHeight = directionTextLabel.frame.size.height;
        [self.scrollView addSubview:directionTextLabel];
        
//even out labels
        
        if (directionTextHeight > numberedListHeight)
        {
            self.lengthOfPreviousFeild += directionTextHeight;
        }
        else
        {
            self.lengthOfPreviousFeild += numberedListHeight;
        }
    }
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.lengthOfPreviousFeild);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

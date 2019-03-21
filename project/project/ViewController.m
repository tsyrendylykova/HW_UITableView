//
//  ViewController.m
//  project
//
//  Created by Цырендылыкова Эржена on 19/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"
#import "AnimalObject.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<AnimalObject *> *animalsObjects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Gallery of animals";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style: UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerClass:[AnimalTableViewCell class] forCellReuseIdentifier:NSStringFromClass([AnimalTableViewCell class])];
    self.tableView.rowHeight = 72.f;
    
    [self fillArrayObjectsData];
    
    [self.view addSubview: self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animalsObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimalTableViewCell class]) forIndexPath:indexPath];
    
    AnimalObject *animalObject = self.animalsObjects[indexPath.row];
    [cell setDataFromAnimalModel: animalObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.animalsObjects[indexPath.row].animalTitle;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *confirmActionButton = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:confirmActionButton];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void) fillArrayObjectsData {
    self.animalsObjects = [NSMutableArray new];
    
    AnimalObject *catObject = [AnimalObject new];
    catObject.animalImage = [UIImage imageNamed:@"cat"];
    catObject.animalTitle = @"Cat";
    catObject.animalDescription = @"Myu";
    [self.animalsObjects addObject: catObject];
    
    AnimalObject *dogObject = [AnimalObject new];
    dogObject.animalImage = [UIImage imageNamed:@"dog"];
    dogObject.animalTitle = @"Dog";
    dogObject.animalDescription = @"Gav-gav";
    [self.animalsObjects addObject: dogObject];
    
    AnimalObject *giraffeObject = [AnimalObject new];
    giraffeObject.animalImage = [UIImage imageNamed:@"giraffe"];
    giraffeObject.animalTitle = @"Giraffe";
    giraffeObject.animalDescription = @"Giraffe says something";
    [self.animalsObjects addObject: giraffeObject];
}



@end

//
//  ViewController.m
//  project
//
//  Created by Цырендылыкова Эржена on 19/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"
#import "BirdTableViewCell.h"
#import "AnimalObject.h"
#import "BirdObject.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<AnimalObject *> *animalsObjects;
@property (nonatomic, strong) NSMutableArray<BirdObject *> *birdsObjects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Animals and birds";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style: UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerClass:[AnimalTableViewCell class] forCellReuseIdentifier:NSStringFromClass([AnimalTableViewCell class])];
    [self.tableView registerClass:[BirdTableViewCell class] forCellReuseIdentifier:NSStringFromClass([BirdTableViewCell class])];
    self.tableView.rowHeight = 72.f;
    
    [self fillArrayAnimalObjectsData];
    [self fillArrayBirdObjectsData];
    
    [self.view addSubview: self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animalsObjects.count + self.birdsObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimalTableViewCell class]) forIndexPath:indexPath];
        AnimalObject *animalObject = self.animalsObjects[indexPath.row / 2];
        [cell setDataFromAnimalModel: animalObject];
        cell.backgroundColor = [UIColor colorWithRed:((float) 233.0f / 255.f)
                                                        green:((float) 235.f / 255.f)
                                                         blue:((float) 232.0f / 255.f)
                                               alpha:1.0f];
        return cell;
    }
    else {
        BirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BirdTableViewCell class]) forIndexPath:indexPath];
        BirdObject *birdObject = self.birdsObjects[indexPath.row / 2];
        [cell setDataFromBirdModel: birdObject];
        cell.backgroundColor = [UIColor colorWithRed:((float) 219.0f / 255.f)
                                               green:((float) 205.f / 255.f)
                                                blue:((float) 200.0f / 255.f)
                                               alpha:0.3f];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [NSString new];
    if (indexPath.row % 2 == 0) {
        title = self.animalsObjects[indexPath.row / 2].animalTitle;
        
    } else {
        title = self.birdsObjects[indexPath.row / 2].birdTitle;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *confirmActionButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:confirmActionButton];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void) fillArrayAnimalObjectsData {
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

-(void) fillArrayBirdObjectsData {
    self.birdsObjects = [NSMutableArray new];
    
    BirdObject *owlObject = [BirdObject new];
    owlObject.birdImage = [UIImage imageNamed:@"sova"];
    owlObject.birdTitle = @"Owl";
    owlObject.birdDescription = @"Uhu - Uhu";
    [self.birdsObjects addObject: owlObject];
    
    BirdObject *peacockObject = [BirdObject new];
    peacockObject.birdImage = [UIImage imageNamed:@"pavlin"];
    peacockObject.birdTitle = @"Peacock";
    peacockObject.birdDescription = @"I dont know";
    [self.birdsObjects addObject: peacockObject];
    
    BirdObject *eagleObject = [BirdObject new];
    eagleObject.birdImage = [UIImage imageNamed:@"orel"];
    eagleObject.birdTitle = @"Eagle";
    eagleObject.birdDescription = @"Eagle says something";
    [self.birdsObjects addObject: eagleObject];
}



@end

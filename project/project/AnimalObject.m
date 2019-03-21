//
//  AnimalObject.m
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "AnimalObject.h"

@implementation AnimalObject

- (instancetype)initWithData:(NSString*)animalTitle animalDescription:(NSString *)animalDescription animalImage:(UIImage *)animalImage {
    self = [super init];
    if (self) {
        _animalTitle = animalTitle;
        _animalDescription = animalDescription;
        _animalImage = animalImage;
    }
    return self;
}

@end

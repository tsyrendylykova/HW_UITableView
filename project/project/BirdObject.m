//
//  BirdObject.m
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "BirdObject.h"

@implementation BirdObject

-(instancetype)initWithData:(NSString *)birdTitle birdDescription:(NSString *)birdDescription birdImage:(UIImage *)birdImage {
    self = [super init];
    if (self) {
        _birdTitle = birdTitle;
        _birdDescription = birdDescription;
        _birdImage = birdImage;
    }
    return self;
}

@end

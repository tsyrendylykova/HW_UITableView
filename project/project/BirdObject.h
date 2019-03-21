//
//  BirdObject.h
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BirdObject : NSObject

@property (nonatomic, strong) NSString *birdTitle;
@property (nonatomic, strong) NSString *birdDescription;
@property (nonatomic, strong) UIImage *birdImage;

@end

NS_ASSUME_NONNULL_END

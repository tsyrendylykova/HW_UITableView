//
//  BirdTableViewCell.h
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirdObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface BirdTableViewCell : UITableViewCell

- (void)setDataFromBirdModel:(BirdObject *)bird;

@end

NS_ASSUME_NONNULL_END

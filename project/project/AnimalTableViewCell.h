//
//  AnimalTableViewCell.h
//  project
//
//  Created by Цырендылыкова Эржена on 19/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface AnimalTableViewCell : UITableViewCell

- (void)layoutSubviews;

- (void)setDataFromAnimalModel:(AnimalObject *)animal;

@end



NS_ASSUME_NONNULL_END

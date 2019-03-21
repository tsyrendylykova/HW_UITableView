//
//  AnimalTableViewCell.m
//  project
//
//  Created by Цырендылыкова Эржена on 19/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "AnimalTableViewCell.h"
#import "AnimalObject.h"

@interface AnimalTableViewCell ()

@property (nonatomic, strong, readwrite) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* subtitleLabel;

@end

@implementation AnimalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _coverImageView = [UIImageView new];
        [self.contentView addSubview: _coverImageView];
        
        _titleLabel = [UILabel new];
        [self.contentView addSubview: _titleLabel];
        
        _subtitleLabel = [UILabel new];
        [self.contentView addSubview: _subtitleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.coverImageView.frame = CGRectMake(16.f, 16.f, 40.f, 40.f);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + 16.f, 16.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
    self.subtitleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + 16.f, CGRectGetMaxY(self.titleLabel.frame) + 8.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
}

- (void)setDataFromAnimalModel:(AnimalObject *)animal {
    [self.coverImageView setImage:animal.animalImage];
    self.titleLabel.text = animal.animalTitle;
    self.subtitleLabel.text = animal.animalDescription;
}

@end

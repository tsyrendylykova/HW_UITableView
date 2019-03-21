//
//  BirdTableViewCell.m
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "BirdTableViewCell.h"
#import "BirdObject.h"

@interface BirdTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *coverImageView;

@end

@implementation BirdTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    self.coverImageView.frame = CGRectMake(CGRectGetWidth(self.frame) - 56.f, 16.f, 40.f, 40.f);
    self.titleLabel.frame = CGRectMake(16.f, 16.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
    self.subtitleLabel.frame = CGRectMake(16.f, CGRectGetMaxY(self.titleLabel.frame) + 8.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
}

- (void)setDataFromBirdModel:(BirdObject *)bird {
    [self.coverImageView setImage:bird.birdImage];
    self.titleLabel.text = bird.birdTitle;
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.subtitleLabel.text = bird.birdDescription;
    self.subtitleLabel.textAlignment = NSTextAlignmentRight;
}

@end

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
@property (nonatomic, strong) NSLayoutConstraint *topCoverImageConstraint;

@end

@implementation BirdTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _coverImageView = [UIImageView new];
        _coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview: _coverImageView];
        
        
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview: _titleLabel];
        
        _subtitleLabel = [UILabel new];
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _subtitleLabel.numberOfLines = 0;
        [self.contentView addSubview: _subtitleLabel];
        
        [self makeConstraints];
    }
    return self;
}

- (void)setDataFromBirdModel:(BirdObject *)bird {
    [self.coverImageView setImage:bird.birdImage];
    self.titleLabel.text = bird.birdTitle;
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.subtitleLabel.text = bird.birdDescription;
    self.subtitleLabel.textAlignment = NSTextAlignmentRight;
}

- (void)makeConstraints {
    NSLayoutConstraint *bottomConstraint = [_subtitleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16.f];
    bottomConstraint.priority = UILayoutPriorityDefaultHigh;
    self.topCoverImageConstraint = [_coverImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f];
    [NSLayoutConstraint activateConstraints:@[
                                              [_coverImageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
                                              self.topCoverImageConstraint,
                                              [_coverImageView.widthAnchor constraintEqualToConstant:40.f],
                                              [_coverImageView.heightAnchor constraintEqualToConstant:40.f],
                                              
                                              [_titleLabel.rightAnchor constraintEqualToAnchor:_coverImageView.leftAnchor constant:-16.f],
                                              [_titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f],
                                              [_titleLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16.f],
                                              [_titleLabel.heightAnchor constraintEqualToConstant:16.f],
                                              
                                              [_subtitleLabel.rightAnchor constraintEqualToAnchor:_coverImageView.leftAnchor constant:-16.f],
                                              [_subtitleLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:16.f],
                                              [_subtitleLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16.f],
                                              bottomConstraint
                                              ]
     ];
}

@end

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
@property (nonatomic, strong) NSLayoutConstraint *topCoverImageConstraint;

@end

@implementation AnimalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        UITapGestureRecognizer *tapOnCoverImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapWithImage)];
        _coverImageView = [UIImageView new];
        _coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverImageView.userInteractionEnabled = YES;
        [_coverImageView addGestureRecognizer:tapOnCoverImage];
        [self.contentView addSubview: _coverImageView];
        
        _titleLabel = [UILabel new];
        [self.contentView addSubview: _titleLabel];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _subtitleLabel = [UILabel new];
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _subtitleLabel.numberOfLines = 0;
        [self.contentView addSubview: _subtitleLabel];
        
        [self makeConstraints];
    }
    return self;
}

- (void)setDataFromAnimalModel:(AnimalObject *)animal {
    [self.coverImageView setImage:animal.animalImage];
    self.titleLabel.text = animal.animalTitle;
    self.subtitleLabel.text = animal.animalDescription;
}

-(void) didTapWithImage{
    [self.contentView removeConstraint:self.topCoverImageConstraint];
    NSLayoutConstraint *alignCenterYConstraint = [self.coverImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor];
    [self.contentView addConstraint:alignCenterYConstraint];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}

-(void)makeConstraints {
    NSLayoutConstraint *bottomConstraint = [_subtitleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16.f];
    bottomConstraint.priority = UILayoutPriorityDefaultHigh;
    
    self.topCoverImageConstraint = [_coverImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f];
    [NSLayoutConstraint activateConstraints:@[
                                              [_coverImageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16.f],
                                              self.topCoverImageConstraint,
                                              [_coverImageView.widthAnchor constraintEqualToConstant:40.f],
                                              [_coverImageView.heightAnchor constraintEqualToConstant:40.f],
                                              
                                              [_titleLabel.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant:16.f],
                                              [_titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f],
                                              [_titleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
                                              [_titleLabel.heightAnchor constraintEqualToConstant:16.f],
                                              
                                              [_subtitleLabel.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant:16.f],
                                              [_subtitleLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:16.f],
                                              [_subtitleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
                                              bottomConstraint
                                              ]
     ];
}

@end

//
//  BirdCollectionViewCell.swift
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

import UIKit

final internal class BirdCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    let birdImage: UIImageView = {
        let birdImage = UIImageView()
        birdImage.translatesAutoresizingMaskIntoConstraints = false
        birdImage.contentMode = .scaleAspectFill
        birdImage.clipsToBounds = true
        return birdImage
    }()
    
    weak var delegate: BirdCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(birdImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func shakeIcons() {
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.duration = 0.2
        shakeAnimation.repeatCount = 10000
        shakeAnimation.autoreverses = true
        let startAngle: Float = (-2) * 3.14159/180
        let stopAngle = -startAngle
        shakeAnimation.fromValue = NSNumber(value: startAngle as Float)
        shakeAnimation.toValue = NSNumber(value: 3 * stopAngle as Float)
        shakeAnimation.timeOffset = 290 * drand48()
        
        self.layer.add(shakeAnimation, forKey:"shakeIcons")
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            birdImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            birdImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            birdImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -50),
            birdImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: birdImage.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20)
            ])
    }
}

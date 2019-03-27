//
//  BirdViewController.swift
//  project
//
//  Created by Цырендылыкова Эржена on 21/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

import UIKit

open class BirdViewController: UIViewController {
    
    let layout = BirdLayout()
    
    fileprivate lazy var collectionView: UICollectionView = {
        layout.delegate = self
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.register(BirdCollectionViewCell.self, forCellWithReuseIdentifier: "BirdCollectionViewCell")
        return collectionView
    }()
    
    fileprivate let dataSource: [String] = ["Воробей", "Павлин", "Орел", "Синица", "Воробей", "Павлин", "Воробей", "Павлин", "Орел", "Синица", "Воробей", "Павлин", "Воробей", "Павлин", "Орел", "Синица", "Воробей", "Павлин", "Воробей", "Павлин", "Орел", "Синица", "Воробей", "Павлин"]
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(collectionView)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        layout.invalidateLayout()
        print("View did appear")
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.frame
    }
}

extension BirdViewController: UICollectionViewDataSource {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let birdName = dataSource[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BirdCollectionViewCell", for: indexPath) as? BirdCollectionViewCell {
            cell.titleLabel.text = birdName
            cell.backgroundColor = UIColor.green
            cell.delegate = self
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 6
            cell.shakeIcons()
            return cell
        }
        return UICollectionViewCell()
    }
}


extension BirdViewController: BirdCellDelegate {
    func didTap(cell: BirdCollectionViewCell) {
        let alertController = UIAlertController(title: "Bang", message: cell.titleLabel.text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension BirdViewController: BirdLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 3 == 0 {
            return 100
        } else if indexPath.row % 5 == 0 {
            return 170
        } else if indexPath.row % 7 == 0 {
            return 130
        } else {
            return 200
        }
    }
}

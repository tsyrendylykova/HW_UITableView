//
//  Photos.swift
//  project
//
//  Created by Цырендылыкова Эржена on 25/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

import UIKit

struct Photos {
    var caption: String
    var comment: String
    var image: UIImage
    
    init(caption: String, comment: String, image: UIImage) {
        self.caption = caption
        self.comment = comment
        self.image = image
    }
    
    init?(dictionary: [String: String]) {
        guard let caption = dictionary["Caption"], let comment = dictionary["Comment"], let photo = dictionary["Photo"],
            let image = UIImage(named: photo) else {
                return nil
        }
        self.init(caption: caption, comment: comment, image: image)
    }
    
    static func allPhotos() -> [Photos] {
        var photos = [Photos]()
        guard let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return photos
        }
        for dictionary in photosFromPlist {
            if let photo = Photos(dictionary: dictionary) {
                photos.append(photo)
            }
        }
        return photos
    }
}

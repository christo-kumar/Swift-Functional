//
//  CustomImageView.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import UIKit

class CustomImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(imageUrl: URL) {
        self.image = UIImage(named: "CheckMark")
        if let cachedImage = imageCache.object(forKey: imageUrl as AnyObject) {
            self.image = cachedImage
        } else {
            DispatchQueue.global().async { [weak self] in
                if let imageData = try? Data(contentsOf: imageUrl) {
                    if let remoteImage = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self?.imageCache.setObject(remoteImage, forKey: imageUrl as AnyObject)
                            self?.image = remoteImage
                        }
                    }
                }
            }
        }
    }

}

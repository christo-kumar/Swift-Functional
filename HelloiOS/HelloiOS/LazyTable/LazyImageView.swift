//
//  LazyImageView.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import UIKit

class LazyImageView: UIImageView {
    let cache = NSCache<AnyObject, UIImage>()
    func loadPlaceHolder() {
        self.image = UIImage(named: "CheckMark")
    }
    func loadImage(withUrl: URL) {
        self.image = UIImage(named: "CheckMark")
        if let cachedImage = cache.object(forKey: withUrl as AnyObject) {
            self.image = cachedImage
        } else {
            //url to data
            //data to image
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: withUrl) {
                    if let remote = UIImage(data: data) {
                        self?.cache.setObject(remote, forKey: withUrl as AnyObject)
                        DispatchQueue.main.async {
                            self?.image = remote
                        }
                    }
                }
            }
        }
    }
        


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

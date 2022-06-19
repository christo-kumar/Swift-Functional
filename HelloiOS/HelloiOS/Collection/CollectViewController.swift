//
//  CollectViewController.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import Foundation
import UIKit

class CollectViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var collectionData: [String] = []
    
    /* Called in case view controller is initialised from storyboard
     required init?(coder: NSCoder) {
        collectionData = []
        super.init(coder: coder)
       
    }*/
    
    func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(CollectCell.self, forCellWithReuseIdentifier: "collectCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension CollectViewController: UICollectionViewDelegateFlowLayout {
    
}

extension CollectViewController: UICollectionViewDelegate {
    
}

extension CollectViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
    
    
}


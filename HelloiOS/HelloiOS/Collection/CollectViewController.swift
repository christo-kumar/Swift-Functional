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
    let viewModel = CollectViewModel()
    var collectionData: [Animal] = []
    
    /* Called in case view controller is initialised from storyboard
     required init?(coder: NSCoder) {
        collectionData = []
        super.init(coder: coder)
       
    }*/
    
    func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectCell")
    }
    
    func getData() {
        viewModel.getImages { [weak self] result in
            switch result {
            case .success(let animalResponse):
                self?.collectionData = animalResponse.animals
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                break
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectCell", for: indexPath)
        return cell
    }
    
    
}


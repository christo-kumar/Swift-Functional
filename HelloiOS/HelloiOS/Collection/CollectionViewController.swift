//
//  CollectionViewController.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = CollectViewModel()
    var animals:[Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getImages { result in
            switch result {
            case .success(let animalResponse):
                self.animals = animalResponse.animals
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
        let animal = self.animals[indexPath.row]
        if let url = URL(string: animal.image) {
            cell.imageView.loadImage(imageUrl: url)
        } else {
            cell.imageView.image = UIImage(named: "CheckMark")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(((collectionView.bounds.width/2)-2))
        return CGSize(width: (collectionView.bounds.width/2)-2, height: (collectionView.bounds.width/2)-2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}

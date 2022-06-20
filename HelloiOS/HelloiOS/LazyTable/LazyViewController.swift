//
//  LazyViewController.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import UIKit

class LazyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let netRepo = NetRepo()
    var animals:[Animal] = []
    
    func getData() {
        Task.init() {
            let result = await netRepo.getPosts()
            switch result {
            case .success(let animalRes):
                self.animals = animalRes.animals
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    override func viewDidLoad()  {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        getData()
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

extension LazyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LazyTableViewCellID", for: indexPath) as! LazyTableViewCell
       
        let animal = self.animals[indexPath.row]
        if let url = URL(string: animal.image) {
            cell.lazyImageView.loadImage(withUrl: url)
        } else {
            cell.lazyImageView.loadPlaceHolder()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}

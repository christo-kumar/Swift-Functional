//
//  TBViewController.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import UIKit

class ResultController : UIViewController {
    override func viewDidLoad() {
    }
}

class TBViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    func setupSearchBar() {
        //let resultController = ResultController()
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBar()
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

extension TBViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let someArray = ["Mumbai","Calcutta"]
        guard let searchText = searchController.searchBar.text else {
            return
        }
        if searchText == "" {
            
        } else {
            let filter = someArray.filter { val in
                return val.contains(searchText)
            }
            print(filter)
        }
        
    }
}

extension TBViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        cell.customImageView.image = UIImage(named: "CheckMark")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

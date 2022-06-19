//
//  ViewController.swift
//  HelloiOS
//
//  Created by Christo Kumar on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let rowData = ["Collect View", "Practice Table View", "Lazy Table", "Custom Navigation", "Search Controller", "Scroll View","POP","Core Data", "Realm"
    ]

    func setupView() {
        navigationItem.title = "iOS Controls"
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)    
        cell.textLabel?.text = rowData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "collectionSegue", sender: indexPath)
        } else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "tableSegue", sender: indexPath)
        }
        
    }
    
}


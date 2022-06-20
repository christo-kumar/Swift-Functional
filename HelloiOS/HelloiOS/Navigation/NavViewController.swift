//
//  NavViewController.swift
//  HelloiOS
//
//  Created by Christo Kumar on 20/06/22.
//

import UIKit

class NavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting up the title image
        let image = UIImage(named: "CheckMark")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 35)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        let customView = UIView()
        customView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let someButton = UIButton(type: .system)
        someButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        someButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        customView.addSubview(someButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customView)
        
        

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

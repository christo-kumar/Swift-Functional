//
//  LazyTableViewCell.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import UIKit

class LazyTableViewCell: UITableViewCell {

    @IBOutlet weak var lazyImageView: LazyImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

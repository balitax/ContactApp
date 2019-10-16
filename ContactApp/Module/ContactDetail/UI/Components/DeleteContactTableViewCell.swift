//
//  DeleteContactTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol didDeleteDelegate {
    func deleteContact()
}

class DeleteContactTableViewCell: UITableViewCell {

    var delegate: didDeleteDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didDeleteContact(_ sender: UIButton) {
        self.delegate?.deleteContact()
    }
    
}

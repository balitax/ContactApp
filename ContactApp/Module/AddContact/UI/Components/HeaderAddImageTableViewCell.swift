//
//  HeaderAddImageTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol HeaderAddImageDelegate {
    func didSelectPhoto()
}

class HeaderAddImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatarContact: CircularImageView!
    @IBOutlet weak var btnAddPhoto: UIButton!
    
    
    var delegate: HeaderAddImageDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSelectPhoto(_ sender: UIButton) {
        self.delegate?.didSelectPhoto()
    }
    
}

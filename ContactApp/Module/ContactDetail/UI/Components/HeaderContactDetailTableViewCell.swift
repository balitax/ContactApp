//
//  HeaderContactDetailTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class HeaderContactDetailTableViewCell: UITableViewCell, CellConfigurable {
    
    
    @IBOutlet weak var avatarContact: UIImageView!
    @IBOutlet weak var fullnameContact: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.avatarContact.layer.cornerRadius = self.avatarContact.frame.size.width / 2
        self.avatarContact.clipsToBounds = true
        // Initialization code
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? HeaderContactDetailTableViewCellViewModel {
            
            if let avatarURL = data.imageContact {
                let fullURL = EnvironmentURL.baseURL + avatarURL
                self.avatarContact.loadImageUsingCacheWithURLString(fullURL, placeHolder: nil)
            }
            
            if let firstname = data.firstname, let lastname = data.lastname {
                self.fullnameContact.text = firstname + " " + lastname
            }
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
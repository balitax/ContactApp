//
//  ContactListsTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ContactListsTableViewCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var avatarContact: UIImageView!
    @IBOutlet weak var fullnameContact: UILabel!
    @IBOutlet weak var staredContact: SwiftyStarRatingView!
    

    let loading = LoadingPlaceholderView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.loading.cover(self)
        
        self.avatarContact.layer.cornerRadius = self.avatarContact.frame.size.width / 2
        self.avatarContact.clipsToBounds = true
        
        // Initialization code
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? ContactListsTableViewCellViewModel {
            
            if let avatarURL = data.avatarURL {
                let fullURL = EnvironmentURL.baseURL + avatarURL
                self.avatarContact.loadImageUsingCacheWithURLString(fullURL, placeHolder: UIImage(named: "default_img"))
            }
            
            if let firstname = data.firstname, let lastname = data.lastname {
                self.fullnameContact.text = firstname + " " + lastname
            }
            
            if let isFav = data.isFavorite {
                if isFav {
                    self.staredContact.isHidden = false
                } else {
                     self.staredContact.isHidden = true
                }
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loading.uncover()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

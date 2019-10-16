//
//  HeaderContactDetailTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol HeaderContactDelegate {
    func didSendMessage()
    func didCallContact()
    func didSendEmail()
}

class HeaderContactDetailTableViewCell: UITableViewCell, CellConfigurable {
    
    
    @IBOutlet weak var avatarContact: UIImageView!
    @IBOutlet weak var fullnameContact: UILabel!
    
    var delegate: HeaderContactDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .lightGrayApp
        
        self.avatarContact.layer.cornerRadius = self.avatarContact.frame.size.width / 2
        self.avatarContact.clipsToBounds = true
        // Initialization code
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? HeaderContactDetailTableViewCellViewModel {
            
            if let avatarURL = data.imageContact {
                let fullURL = EnvironmentURL.baseURL + avatarURL
                self.avatarContact.loadImageUsingCacheWithURLString(fullURL, placeHolder: UIImage(named: "default_img"))
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
    
    @IBAction func didOpenMessage(_ sender: UIButton) {
        self.delegate?.didSendMessage()
    }
    
    @IBAction func didCallContact(_ sender: UIButton) {
        self.delegate?.didCallContact()
    }
    
    @IBAction func didSendEmail(_ sender: Any) {
        self.delegate?.didSendEmail()
    }
    
    @IBAction func didStarContact(_ sender: Any) {
        
    }
}

//
//  AddFormContactTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class AddFormContactTableViewCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var wordingFormKey: UILabel!
    @IBOutlet weak var textfieldForm: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? AddFormContactTableViewCellViewModel {
            
            self.wordingFormKey.text = data.listType?.rawValue
            self.textfieldForm.placeholder = data.listType?.rawValue
            
            if data.listType == .email {
                self.textfieldForm.keyboardType = .emailAddress
            } else if data.listType == .mobile {
                self.textfieldForm.keyboardType = .phonePad
            } else {
                self.textfieldForm.keyboardType = .default
            }
        }
    }
    
}

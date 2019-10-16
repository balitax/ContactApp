//
//  ListDetailContactTableViewCell.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ListDetailContactTableViewCell: UITableViewCell, CellConfigurable {
    
    
    @IBOutlet weak var wording: UILabel!
    @IBOutlet weak var valueContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? ListDetailContactTableViewCellViewModel {
            
            wording.text = data.listType?.rawValue
            valueContact.text = data.value
            
        }
    }
    
}

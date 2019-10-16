//
//  DeleteContactTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct DeleteContactTableViewCellViewModel: CellRepresentable {
    
    
    init() {
        
    }
    
    var type: String = {
        return ContactDetailCellType.delete.rawValue
    }()
    
}

//
//  HeaderAddImageTableViewCellViewModel.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation


struct HeaderAddImageTableViewCellViewModel: CellRepresentable {
    
    init() {
        
    }
    
    var type: String = {
        return AddContactCellType.header.rawValue
    }()
    
}

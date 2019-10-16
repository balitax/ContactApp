//  
//  AddContactInteractor.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class AddContactInteractor {
    // TODO: Declare view methods
    weak var output: AddContactInteractorOutput!
    private var disposeBag = DisposeBag()
    
}

extension AddContactInteractor: AddContactUseCase {
    
    func saveContact(firstname: String, lastname: String, phone: String, email: String, isfavorite: Bool) {
        
        APIClient.request(with: APIRouter.saveContact(
            firstname: firstname,
            lastname: lastname,
            phone_number: phone,
            email: email,
            isfavorite: isfavorite))
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.output.onContacSaved()
                }, onError: { error in
                    self.output.onError(error: error)
            })
            .disposed(by: disposeBag)
        
    }
    
}

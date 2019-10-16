//  
//  ContactListInteractor.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class ContactListInteractor {
    // TODO: Declare view methods
    weak var output: ContactListInteractorOutput!
    private var disposeBag = DisposeBag()
    
}

extension ContactListInteractor: ContactListUseCase {
    
    func getContactList() {
        APIClient.request(with: APIRouter.listContact, codable: ContactResponse.self)
        .map ({ (response) -> [ContactStorage] in
            
            // delete first
            APIClient.deleteLocalDatabase(ContactStorage.self)
            
            var contact = [ContactStorage]()
            
            let items = response
            
            for (index, item) in items.enumerated() {
                let save = ContactStorage().apply { ct in
                    ct.id = item.id ?? 0
                    ct.firstName = item.firstName
                    ct.lastName = item.lastName
                    ct.profilePic = item.profilePic
                    ct.favorite = item.favorite ?? false
                    ct.url = item.url
                }
                contact.append(save)
            }
            
            return contact
            
        })
        .asObservable()
        .flatMapLatest({ (contacts) -> Single<[ContactStorage]> in
            return Database.shared.rxsave(objects: contacts)
        })
        .subscribe(onNext: { contacts in
            self.output.onContactLoaded(data: contacts)
        }, onError: { error in
            self.output.onError(error: error)
        }).disposed(by: disposeBag)
    }
    
}

//  
//  ContactDetailInteractor.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class ContactDetailInteractor {
    // TODO: Declare view methods
    weak var output: ContactDetailInteractorOutput!
    private var disposeBag = DisposeBag()
    
}

extension ContactDetailInteractor: ContactDetailUseCase {
    
    func getDetailContact(id: Int) {
        
        APIClient.request(with: APIRouter.detailContact(id: id), codable: ContactDetailResponse.self)
        .asObservable()
            .subscribe(onNext: { response in
                print("RES ", response)
                self.output.onDetailContactLoaded(data: response)
            }, onError: { error in
                self.output.onError(error: error)
            })
        .disposed(by: disposeBag)
        
    }
    
}

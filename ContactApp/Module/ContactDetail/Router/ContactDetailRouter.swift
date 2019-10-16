//  
//  ContactDetailRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit
import MessageUI

class ContactDetailRouter: NSObject, MFMessageComposeViewControllerDelegate {

    weak var viewController: UIViewController?

}

extension ContactDetailRouter: ContactDetailWireframe {
    
    static func assembleModule(_ data: ContactStorage) -> UIViewController {
        
        let view = ContactDetailUI()
        let viewModel = ContactDetailViewModel()
        let router = ContactDetailRouter()
        let interactor = ContactDetailInteractor()
        
        viewModel.contact = data
        
        let presenter = ContactDetailPresenter(
            view: view,
            viewModel: viewModel,
            interactor: interactor,
            wireframe: router)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
    func popViewController(from view: PresentableView) {
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func sendMessage(to phone: String, from view: PresentableView) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = [phone]
        composeVC.body = "Contact App - GoJek"

        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            if let navigationController = view.presentedViewController() as? UINavigationController {
                navigationController.present(composeVC, animated: true, completion: nil)
            }
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
}

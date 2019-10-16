//  
//  ContactDetailUI.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ContactDetailUI: UIViewController {
    
    var presenter: ContactDetailPresentation!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 66
        tableView.backgroundColor = .lightGrayApp
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: ContactDetailCellType.header.rawValue, bundle: nil), forCellReuseIdentifier: ContactDetailCellType.header.rawValue)
        tableView.register(UINib(nibName: ContactDetailCellType.list.rawValue, bundle: nil), forCellReuseIdentifier: ContactDetailCellType.list.rawValue)
        tableView.register(UINib(nibName: ContactDetailCellType.delete.rawValue, bundle: nil), forCellReuseIdentifier: ContactDetailCellType.delete.rawValue)
        
        presenter.getDetailContact()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            // Fallback on earlier versions
        }
        self.addBarButtonItem()
    }
    
    fileprivate func addBarButtonItem() {
        let rightBarButtonEdit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.didEditContact(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonEdit
        
    }
    
    @objc func didEditContact(_ sender: UIBarButtonItem) {
        
    }
    
}


extension ContactDetailUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.type, for: indexPath)
        (cell as? CellConfigurable)?.configure(with: item)
        cell.accessibilityLabel = item.type
        
        (cell as? DeleteContactTableViewCell)?.delegate = self
        
        return cell
    }
    
    
}

extension ContactDetailUI: didDeleteDelegate {
    
    func deleteContact() {
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.presenter.deleteContact()
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { _ in
            
        }
        self.showAlert(viewController: self, prefferedStyle: .alert, title: "Delete?", message: "Are you sure want to delete contact ?", alertActions: [okAction, cancelAction])
    }
    
}

extension ContactDetailUI: ContactDetailView {
    
    func configureView(with state: ViewStateKind) {
        switch state {
        case .success:
            self.tableView.reloadData()
        case .error(let error):
            let ok = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Error!", message: error, alertActions: [ok])
        default:
            self.tableView.reloadData()
        }
    }
    
}



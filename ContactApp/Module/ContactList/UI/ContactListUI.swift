//  
//  ContactListUI.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ContactListUI: UIViewController {

    var presenter: ContactListPresentation!
    
    @IBOutlet weak var tableView: UITableView!
    let sections: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 66
        tableView.sectionIndexColor = UIColor.lightGray
        
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: ContactListCellType.list.rawValue, bundle: nil), forCellReuseIdentifier: ContactListCellType.list.rawValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        presenter.getContactList()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            // Fallback on earlier versions
        }
        self.navigationItem.title = "Contact"
        self.addBarButtonItem()
    }
    
    fileprivate func addBarButtonItem() {
        let rightBarButtonAddGroup = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.didAddContact(_:)))
        let leftBarButtonPlus = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(self.didAddGroupContact(_:)))
        
        self.navigationItem.leftBarButtonItem = leftBarButtonPlus
        self.navigationItem.rightBarButtonItem = rightBarButtonAddGroup
        
    }
    
    @objc func didAddContact(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func didAddGroupContact(_ sender: UIBarButtonItem) {
        
    }
    
}

extension ContactListUI: UITableViewDelegate, UITableViewDataSource {
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sections
    }
    
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter.selectedContact(indexPath)
        presenter.presentDetailContact(data: data)
    }
    
}


extension ContactListUI: ContactListView {
    
    func configureView(with state: ViewStateKind) {
        switch state {
        case .success:
            self.tableView.reloadData()
        case .error(let error):
            self.tableView.reloadData()
            let ok = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Error!", message: error, alertActions: [ok])
        default:
            self.tableView.reloadData()
        }
    }
    
}



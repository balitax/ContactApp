//  
//  AddContactUI.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class AddContactUI: UIViewController {
    
    var presenter: AddContactPresentation!
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var tableView: UITableView!
    
    var imgSelected: UIImage? = UIImage(named: "default_img")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 66
        tableView.backgroundColor = .lightGrayApp
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: AddContactCellType.header.rawValue, bundle: nil), forCellReuseIdentifier: AddContactCellType.header.rawValue)
        tableView.register(UINib(nibName: AddContactCellType.form.rawValue, bundle: nil), forCellReuseIdentifier: AddContactCellType.form.rawValue)
        
    }
    
}

extension AddContactUI: UITableViewDelegate, UITableViewDataSource {
    
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
        
        (cell as? HeaderAddImageTableViewCell)?.delegate = self
        (cell as? HeaderAddImageTableViewCell)?.imgAvatarContact.image = self.imgSelected
        
        (cell as? AddFormContactTableViewCell)?.textfieldForm.delegate = self
        
        return cell
    }
    
}

extension AddContactUI: HeaderAddImageDelegate, UITextFieldDelegate {
    
    func didSelectPhoto() {
        self.dialogSelectPhoto()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
    }
    
}

extension AddContactUI: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func dialogSelectPhoto() {
        let camera = GSCameraHandler(delegate_: self)
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        optionMenu.popoverPresentationController?.sourceView = self.view
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { (alert : UIAlertAction!) in
            camera.getCameraOn(self, canEdit: true)
        }
        let sharePhoto = UIAlertAction(title: "Photo Library", style: .default) { (alert : UIAlertAction!) in
            camera.getPhotoLibraryOn(self, canEdit: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert : UIAlertAction!) in
        }
        optionMenu.addAction(takePhoto)
        optionMenu.addAction(sharePhoto)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage {
            self.imgSelected = pickedImage
            self.tableView.reloadData()
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension AddContactUI: AddContactView {
    
}



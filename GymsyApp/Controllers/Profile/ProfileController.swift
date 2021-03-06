//
//  ProfileController.swift
//  GymsyApp
//
//  Created by Mauricio Chirino on 24/8/17.
//  Copyright © 2017 3CodeGeeks. All rights reserved.
//

import UIKit

final class ProfileController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var ageButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var heightButton: UIButton!
    @IBOutlet weak var pickerVerticalLayoutConstraint: NSLayoutConstraint!
    
    let profileImagePicker = UIImagePickerController()
    var pickerKind = Constants.pickerKind.gender
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(navigationController)
        profileImagePicker.delegate = self
        let userProfile = Singleton.dataSource.objects(Profile.self)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAction)))
        if !userProfile.isEmpty {
            guard let userInfo = userProfile.first else {
                print(Constants.errorMessages.invalidUserInfo)
                return
            }
            nameTextField.text = userInfo.name
            if let profileImage = userInfo.image {
                profileImageButton.setImage(UIImage(data: profileImage), for: .normal)
            }
            if let gender = userInfo.gender {
                genderButton.setTitle(gender, for: .normal)
            }
            if let age = userInfo.age {
                ageButton.setTitle(age, for: .normal)
            }
            if let weight = userInfo.weight {
                weightButton.setTitle(weight, for: .normal)
            }
            if let height = userInfo.height {
                heightButton.setTitle(height, for: .normal)
            }
        }
    }
    
    //# Save any changes in the profile in Realm
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let updateProfile = Profile()
        let profileImage = profileImageButton.currentBackgroundImage
        updateProfile.name = nameTextField.text
        if profileImage != #imageLiteral(resourceName: "Male") && profileImage != #imageLiteral(resourceName: "Female") {
            updateProfile.image = UIImageJPEGRepresentation(profileImageButton.currentImage!, 1)
        }
        if ageButton.currentTitle != Constants.uiElements.agePlaceholder {
            updateProfile.age = ageButton.currentTitle
        }
        if genderButton.currentTitle != Constants.uiElements.genderPlaceholder {
            updateProfile.gender = genderButton.currentTitle
        }
        if heightButton.currentTitle != Constants.uiElements.heightPlaceholder {
            updateProfile.height = heightButton.currentTitle
        }
        if weightButton.currentTitle != Constants.uiElements.weightPlaceholder {
            updateProfile.weight = weightButton.currentTitle
        }
        do {
            try Singleton.dataSource.write {
                Singleton.dataSource.add(updateProfile, update: true)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @objc func dismissKeyboardAction() {
        view.endEditing(true)
    }
    
    @IBAction func imagePickerAction() {
        profileImagePicker.allowsEditing = false
        profileImagePicker.sourceType = .photoLibrary
        present(profileImagePicker, animated: true)
    }

    @IBAction func pickerAction(_ sender: UIButton) {
        dismissKeyboardAction()
        pickerKind = Constants.pickerKind(rawValue: sender.tag)!
        pickerView.reloadAllComponents()
        pickerViewAnimation(showingPicker: true)
    }
    
    @IBAction func okButton() {
        switch pickerKind {
            case .age:
                ageButton.setTitle(getPickerLabel(row: pickerView.selectedRow(inComponent: 0)), for: .normal)
                break
            case .gender:
                setPlaceholderProfileImage()
                genderButton.setTitle(Constants.uiElements.genders[pickerView.selectedRow(inComponent: 0)], for: .normal)
                break
            case .weight:
                weightButton.setTitle(getPickerLabel(row: pickerView.selectedRow(inComponent: 0)), for: .normal)
                break
            default: // height picker
                let shortenHeight = getPickerLabel(row: pickerView.selectedRow(inComponent: 0), component: 0, shorten: true) + getPickerLabel(row: pickerView.selectedRow(inComponent: 1), component: 1, shorten: true)
                heightButton.setTitle(shortenHeight, for: .normal)
                break
        }
        pickerViewAnimation(showingPicker: false)
    }
}

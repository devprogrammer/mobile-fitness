//
//  Helper.swift
//  GymsyApp
//
//  Created by Mauricio Chirino on 7/1/18.
//  Copyright © 2018 3CodeGeeks. All rights reserved.
//

import UIKit
import Moya

func setNavigationBar(_ navigationController: UINavigationController?) {
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
}

func customBackButton(_ navigationItem: UINavigationItem) {
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
}

func getPopupAlert(message: String, title: String = Constants.ErrorMessages.popupTitle, buttonText: String = Constants.ErrorMessages.popupButton) -> UIAlertController {
    let popupAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    popupAlert.addAction(UIAlertAction(title: buttonText, style: .default))
    return popupAlert
}

func questionPopup(title: String, message: String, style: UIAlertControllerStyle, afirmativeAction: ((UIAlertAction) -> Void)?) -> UIAlertController {
    let questionAlert = UIAlertController(title: title, message: message, preferredStyle: style)
    let logOutAction = UIAlertAction(title: Constants.UIMessages.affirmative, style: .destructive, handler: afirmativeAction)
    questionAlert.addAction(logOutAction)
    questionAlert.addAction(UIAlertAction(title: Constants.UIMessages.negative, style: .default))
    return questionAlert
}

func JSONResponseData(kindOfService: Services, completion: @escaping (_ response: Data?) ->()) {
    Singleton.provider.request(kindOfService, completion: { data in
        switch data {
        case let .success(moyaResponse):
            do {
                let _ = try moyaResponse.filterSuccessfulStatusCodes()
                do {
                    let JSONdata = try moyaResponse.mapString().data(using: .utf8)
                    completion(JSONdata)
                    print("\(kindOfService.path) loaded")
                } catch {
                    print("Something went wrong mapping \(kindOfService.path) JSON request")
                    print(data.debugDescription)
                    print("Error code: ", moyaResponse.statusCode)
                    failureInConnectionAlert(invalidCompletion: completion)
                }
            } catch {
                print("Something went wrong on \(kindOfService.path) request, code: ", data.value!.statusCode)
                failureInConnectionAlert(invalidCompletion: completion)
            }
        case let .failure(error):
            print(error.localizedDescription)
            failureInConnectionAlert(invalidCompletion: completion)
        }
    })
}

private func failureInConnectionAlert(invalidCompletion: ((Data?) -> Void)) {
    if var topController = UIApplication.shared.keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        invalidCompletion(nil)
        topController.present(getPopupAlert(message: Constants.ErrorMessages.internetConnection), animated: true)
    } else {
        print("Impossible to access current view controller")
    }
}
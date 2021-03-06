//
//  Constants.swift
//  GymsyApp
//
//  Created by Mauricio Chirino on 23/8/17.
//  Copyright © 2017 3CodeGeeks. All rights reserved.
//

import CoreGraphics.CGFunction

enum Constants {
    
    enum file: String {
        case dictionary = "Dictionary"
    }
    
    enum typeOfExtension: String {
        case plist
    }
    
    enum kindOfResult: Int {
        case mainMuscle = 1
        case secondaryMuscles
        case equipment
    }
    
    enum pickerKind: Int {
        case gender = 1
        case age
        case weight
        case height
    }
    
    enum randomKind {
        static let alphabetic: UInt32 = 26
        static let numeric: UInt32 = 10
    }
    
    enum listingResult: Int {
        case muscles, exercises, routine
    }
    
    enum api: String {
        case development = "https://stage.gymsyapp.com/api/v1/"
        case apiKeyUser = "b327e1a950bc2c22498c6e84f904e95fa2536853"
    }
    
    enum apiConfiguration {
        static let rootURL = "https://wger.de/api/v2"
        static let development = "https://stage.gymsyapp.com/api/v1/"
        static let apiKeyUser = "b327e1a950bc2c22498c6e84f904e95fa2536853"
    }
    
    enum language: String {
        case english = "EN"
        case spanish = "ES"
    }
    
    enum parameterKey {
        static let contentType = "Content-type"
        
        static let status = "status"
        static let language = "language"
        static let category = "category"
        
        static let userID = "id_user"
    }
    
    enum parametersKey {
        static let accessKey = "X-AccessKey"
        static let randomKey = "X-RandomKey"
        static let language = "language"
    }
    
    enum parametersValue {
        static let accessKey = "29d0b2b249f06558b877f365cb57bc5ef824b355"
        static let randomKey = "16541135"
    }
    
    enum parameterValue {
        static let contentType = "application/json"
        static let status = 2
        static let language = 2
    }
    
    enum jsonResponseKey {
        static let results = "results"
        
        enum exerciseCategory {
            static let id = "id"
            static let name = "name"
        }
        
        enum exercises {
            static let description = "description"
            static let mainMuscle = "muscles"
            static let secondaryMuscles = "muscles_secondary"
            static let neededEquipment = "equipment"
            static let imageJSON = "medium_cropped"
            static let imageURL = "url"
        }
    }
    
    enum path {
        static let exerciseGroup = "/exercisecategory"
        static let exerciseList = "/exercise"
        static let exerciseDetails = "/exerciseinfo/"
        static let exerciseImage = "/exerciseimage/"
        static let exerciseImageSize = "/thumbnails"
    }
    
    enum endPoints {
        static let categories = "category"
    }
    
    enum storyboard {
        static let cellId = "detailCell"
        static let exerciseListSegue = "muscleDetailsSegue"
        static let exerciseDetailSegue = "specificDetailSegue"
        static let routineDetailSegue = "routinesDetailesSegue"
        static let routineCell = "routineCell"
    }
    
    enum uiElements {
        static let title = "Gym App"
        static let genders = ["Male", "Female"]
        static let placeholderNames = ["John Doe", "Jane Doe"]
        static let appFont = "Copperplate"
        static let regularFontSize:CGFloat = 25
        static let animationDuration = 0.3
        static let exerciseGIF = 2
        static let exerciseGenericTag = "General exercise"
        static let nonApplicable = "N/A"
        static let connector = " and "
        static let genderPlaceholder = "Your gender"
        static let agePlaceholder = "Your age"
        static let weightPlaceholder = "Your weight"
        static let heightPlaceholder = "Your height"
        static let reloadButton = "Refresh"
    }
    
    enum units {
        static let topAge = 100
        static let minAge = 18
        static let topWeight = 301
        static let minWeight = 90
        static let topFootHeight = 10
        static let minFootHeight = 3
        static let age = " years"
        static let weight = " pounds"
        static let height = " feet"
        static let inch = " inches"
        static let heightSh = " ft "
        static let inchSh = " in"
        static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    enum errorMessages {
        static let internetConnection = "It seems you don't have an active internet connection right now. Make sure you do before you try again please"
        static let parsingJSON = "Could not parse the data as JSON: "
        static let noData = "No data was returned by the request!"
        static let generic = "There was an error with your request: "
        static let popupTitle = "Oops!"
        static let popupButton = "Ok"
        static let wrongImageFormat = "There was an error retrieving the selected image from the Library"
        static let noProfilePlaceholder = "There aren't any profile images placeholders"
        static let tabItemError = "Unable to access first item in tab"
        static let noImage = "No image data"
        static let noJSONfile = "No JSON file in specified route"
        static let invalidJSON = "Misformatted JSON file"
        static let invalidUserInfo = "Unable to retrieved previously stored user data"
    }
    
    enum uiMessages {
        static let affirmative = "Yes"
        static let negative = "No"
    }
    
    enum utilities {
        enum json {
            static let fileName = "ExercisesImages"
            static let fileExtension = "json"
        }
    }
    
    enum muscleView {
        static let title = "Training"
    }
    
    enum exerciseView {
        static let title = "Exercises"
    }
    
    enum detailView {
        static let title = "Details"
    }
}

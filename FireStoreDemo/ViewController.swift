//
//  ViewController.swift
//  FireStoreDemo
//
//  Created by apple on 17/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveDataIntoFirestoreBtnPressed(_ sender: UIButton) {
        
        if let name = nameTextField.text, let age = ageTextField.text, let gender = genderTextField.text, let address = addressTextField.text, let phone = phoneTextField.text, let country = countryTextField.text {
            
            var userData = ["name": name, "age": age, "gender": gender, "address": address, "phone": phone, "country": country]
            
            
            // To create or overwrite a single document, use the set() method
            /*FirestoreReferenceManager.root.collection("users").document("user1").setData(userData) { (error) in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                print("Data successfully saved in firestore")
            }*/
            
            
            
            
            // If the document doesnot exist, it will be created. If the document does exist, its content will be overwritten with the newly provided data, unless you specify that the data should be merged into the existing document, as follows
            /*FirestoreReferenceManager.root.collection("users").document("user1").setData(["name": "Akshay"], merge: true) { (error) in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                print("New data successfully saved in firestore")
            }*/
            
            
            
            // When you use set() to create a document you must specify an id for the document to create. But sometimes there is not a meaningful ID for the document, and it's more convenient to let Cloud Firestore auto-generate an ID for you. You can do this by calling add()
            /*FirestoreReferenceManager.root.collection("users").addDocument(data: userData) { (error) in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                print("Create new data with autogenerate id")
            }*/
            
            
            
            // In some cases, it can be useful to create a document reference with an auto-generated ID, then use the reference later.
            /*let userRef = FirestoreReferenceManager.root.collection("users").document()
            let userId = userRef.documentID
            print(userId)*/
            
            
            // Save a new user
            let reference = FirestoreReferenceManager.root.collection(FirebaseKeys.CollectionPath.users).document()
            let userId = reference.documentID
            
            userData["uid"] = userId
            
            FirestoreReferenceManager.referenceForUserPublicData(uid: userId).setData(userData, merge: true) { (error) in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                print("Data successfully saved in firestore")
            }
            
        }
    }
}


//
//  FirestoreReferenceManager.swift
//  FireStoreDemo
//
//  Created by apple on 17/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//


import Firebase


struct FirestoreReferenceManager {
    
    static let db = Firestore.firestore()
    
    static let environment  = "dev"
    
    static let root = db.collection(environment).document(environment)
    
    static func referenceForUserPublicData(uid: String) -> DocumentReference {
        return root
                .collection(FirebaseKeys.CollectionPath.users)
                .document(uid)
    }
}

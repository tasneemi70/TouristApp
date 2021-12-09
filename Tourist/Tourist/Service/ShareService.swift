//
//  ShareService.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 04/05/1443 AH.
//
//

//import UIKit
//import FirebaseFirestore
//class shareService {
//  static let shared = shareService()
//  let criminalCollection = Firestore.firestore().collection("Places")
//  func addC(PlaceNew: abhPlace) {
//    criminalCollection.document("SharePlace").setData([
//      "name": PlaceNew.name
//    ])
//  }
//    func listenToNotes(completion: @escaping (([abhPlace]) -> Void)) {
//    criminalCollection.addSnapshotListener { snapshot, error in
//      if error != nil {
//        return
//      }
//      guard let documents = snapshot?.documents else { return }
//      var sharePlace1: Array<abhPlace>
//      for document in documents {
//        let data = document.data()
//        let criminal = abhPlace(
//            image: (data["image"] as? String ) ?? "No name",
//            name: (data["name"] as? String) ?? "No name",
//            placeA: []
//         
//        )
//          sharePlace1.append(criminal)
//      }
//      completion(sharePlace1)
//    }
//  }
//}






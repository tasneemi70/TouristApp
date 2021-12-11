//
//  Favorite.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 05/05/1443 AH.
//
//
import UIKit
import FirebaseFirestore



class FavoriteServiceVisitor {


  static let shared = FavoriteServiceVisitor()
  let favoriteCollection = Firestore.firestore().collection("Favorite")


  func addToFavorite(favPlace: FavArabic) {
      favoriteCollection.document(favPlace.name).setData([
        "image": favPlace.image ,
        "name": favPlace.name

    ])
  }

  func listenToFavoriteBook(completion: @escaping (([FavArabic]) -> Void)) {
      favoriteCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      var favorite: Array<FavArabic> = []
      for document in documents {
        let data = document.data()
        let fBook = FavArabic(
            image:(data["image"] as? String) ?? "No Image" ,
            name:(data["name"] as? String) ?? "No Name"

        )
          favorite.append(fBook)
      }
      completion(favorite)
    }
  }
}


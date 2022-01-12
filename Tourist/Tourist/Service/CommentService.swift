

//  Tourist
//
//  Created by Tsnim Alqahtani on 05/05/1443 AH.
//
//


import UIKit
import FirebaseFirestore


class commentService {
  static let shared = commentService()
  let CommentCollection = Firestore.firestore().collection("Comments1")
    
  func addH(hostels: Message) {
      CommentCollection.document(hostels.id!).setData([
      "content": hostels.content,
      "id": hostels.id,
    ])
  }
 
  func listenToComment(completion: @escaping (([Message]) -> Void)) {
    CommentCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      var CommentV: Array<Message> = []
      for document in documents {
        let data = document.data()
        let TextComment = Message(
          content: (data["content"] as? String) ?? "No content",
          id: (data["id"] as? String) ?? "No id"
        //  timestamp: (data[“timestamp”] as? Timestamp) ?? Timestamp()
        )
        CommentV.append(TextComment)
      }
      completion(CommentV)
    }
  }
}











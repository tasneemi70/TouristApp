





import UIKit
import FirebaseFirestore
class RenterService {
  static let shared = RenterService()
  let hostelsCollection = Firestore.firestore().collection("Comments1")
    
  func addH(hostels: Message) {
      hostelsCollection.document(hostels.id!).setData([
      "content": hostels.content,
      "id": hostels.id,
     // “timestamp”: hostels.timestamp
    ])
  }
 
  func listenToRenters(completion: @escaping (([Message]) -> Void)) {
    hostelsCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      var hostels: Array<Message> = []
      for document in documents {
        let data = document.data()
        let criminal = Message(
          content: (data["content"] as? String) ?? "No content",
          id: (data["id"] as? String) ?? "No id"
        //  timestamp: (data[“timestamp”] as? Timestamp) ?? Timestamp()
        )
        hostels.append(criminal)
      }
      completion(hostels)
    }
  }
}











//
//  CoffeeDetails.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 14/05/1443 AH.
//


import UIKit
import Firebase
import FirebaseFirestore

   class CoffeeDetailsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
 
       
//       var taskArray = [task]()
       var messagess: Array<Message> = []
    var user : User?
    var messages = [Message]()
    var Places: abhPlace?
       var message : Message?
    var PlacesC: abhPlace?
   

    override func viewDidLoad() {
        super.viewDidLoad()
  
        RenterService.shared.listenToRenters { newRenter in
            self.messagess = newRenter
              self.chatTableView.reloadData()
            }
        setupUI()
        getAllMessages()
        chatTableView.register(CommentCell.self, forCellReuseIdentifier: "commentCell")
        
        //under cell
      view.backgroundColor = UIColor(    #colorLiteral(red: 0.7699097991, green: 0.661706686, blue: 0.7322302461, alpha: 1)   )
         setGradientBackground()

        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoffeeCell1.self,
                                forCellWithReuseIdentifier: "CoffeeCell1")
        setupCollectionConstraints()
        
        collectionView.frame = view.bounds
        collectionView.reloadData()
        view.backgroundColor = UIColor(named: "setGradientBackground")

        setGradientBackground()

    }
       
       
    let chatTableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        return $0
    }(UITableView())
       
    let messageTextField : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Comment..."
        $0.backgroundColor = .init(white: 0.85, alpha: 1)
        $0.layer.cornerRadius = 15
        return $0
    }(UITextField())
       
       
    let sendButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(UIImage(systemName: "paperplane.circle.fill"), for: .normal)
        $0.tintColor = .brown
        $0.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        return $0
        
    }(UIButton(type: .system))
       
    func setupUI() {
        view.backgroundColor = .red
        navigationItem.title = user?.name
        chatTableView.delegate = self
        chatTableView.dataSource = self
        view.addSubview(chatTableView)
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            
            chatTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -95),
            chatTableView.self.heightAnchor.constraint(equalToConstant: 100),
            chatTableView.self.widthAnchor.constraint(equalToConstant: 170),
            chatTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            
            
            messageTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 250),
            messageTextField.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
            messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            messageTextField.heightAnchor.constraint(equalToConstant: 50),
            messageTextField.widthAnchor.constraint(equalToConstant: 80),
            
            
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            sendButton.heightAnchor.constraint(equalTo: messageTextField.heightAnchor),
            sendButton.widthAnchor.constraint(equalTo: sendButton.heightAnchor),
            sendButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor)
        ])
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame:.zero , collectionViewLayout: layout)
        cv.backgroundColor = UIColor(named: "setGradientBackground")
        return cv
    }()
    
    
       func setupCollectionConstraints() {
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
           collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
           collectionView.widthAnchor.constraint(equalToConstant: 10).isActive = true
           collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
           collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
           collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150).isActive = true
       }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return  PlacesC?.placeA.count ?? 0
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           let cell2  = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeCell1", for: indexPath) as! CoffeeCell1
           let a = PlacesC!.placeA[indexPath.item]
           cell2.PlaceImageC1.image = UIImage(named: a.PlaceImage1)
           cell2.PlaceImageC2.image = UIImage(named: a.PlaceImage0)
           cell2.PlaceImageC3.image = UIImage(named: a.PlaceImage2)
           cell2.PlaceImageC4.image = UIImage(named: a.PlaceImage3)
           cell2.placeDetailC.text = a.placeDetail
           cell2.PlaceNameC.text = a.PlaceName

          cell2.layer.cornerRadius = 35
           return cell2
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 400, height: 600)
       }
      

    
    }

extension CoffeeDetailsVC {
  
    @objc func sendMessage() {
        
//        if messageTextField.hasText {
//              let newTask = task(taskTitle: messageTextField.text, iscomplatid: false)
//            taskArray.insert(newTask, at: 0)
//              chatTableView.reloadData()
//            }
//        messageTextField.text = " "
        messageTextField.resignFirstResponder()
//        let messageId = UUID().uuidString
//        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//        guard let message = messageTextField.text else {return}
//        guard let user = user else {return}


        //setdata
//        Firestore.firestore().document("messages/\(messageId)").setData([
////            "sender" : currentUserID,
////            "receiver" : user.id,
//            "content" : message,
////            "id": messageId,
//            //"timestamp":Timestamp,
//        ])
//        messageTextField.text = ""
//
        
        
        let content = messageTextField.text ?? ""
        let id = UUID().uuidString
         
            RenterService.shared.addH(
              hostels: Message(content: content, id: id)
            )
        
        messageTextField.text = ""
    }
    
    func getAllMessages() {
        guard let chatID = user?.id else {return}
        guard let userID = Auth.auth().currentUser?.uid else {return}
        self.messages.removeAll()
        //self.chatTableView.reloadData()
        // self.messages = []
        Firestore.firestore()
            .collection("messages")
            .whereField("receiver", isEqualTo: userID)
            .whereField("sender", isEqualTo: chatID)
            .addSnapshotListener { snapshot, error in
                guard let userID = Auth.auth().currentUser?.uid else {return}
                if error == nil {
                    for document in snapshot!.documents{
                        let data = document.data()
//                        let newMsg = Message(
//                            content: data["content"] as? String,
//                            sender: data["sender"] as? String,
//                            reciever: data["receiver"] as? String,
//                            id: (data["id"] as? String) ?? ""
//                            //timestamp: (data["timestamp"] as? Timestamp) ?? Timestamp()
//                        )
//                        let isMsgAdded = self.messages.contains { msg in
//                            return msg.id == newMsg.id
//                        }
//                        if !isMsgAdded {
//                            self.messages.append(newMsg)
//                        }
                    }
                    self.chatTableView.reloadData()
                }
                //self.chatTableView.reloadData()
            }
//        Firestore.firestore()
//            .collection("messages")
//            .whereField("sender", isEqualTo: userID)
//            .whereField("receiver", isEqualTo: chatID)
//            .addSnapshotListener { snapshot, error in
//                if error == nil {
//                    for document in snapshot!.documents{
//                        let data = document.data()
//                        let newMsg = Message(
//                            content: data["content"] as? String,
//                            sender: data["sender"] as? String,
//                            reciever: data["receiver"] as? String,
//                            id: (data["id"] as? String) ?? ""
//                            //timestamp: (data["timestamp"] as? Timestamp) ?? Timestamp()
//                        )
//                        let isMsgAdded = self.messages.contains { msg in
//                            return msg.id == newMsg.id
//                        }
//                        if !isMsgAdded {
//                            self.messages.append(newMsg)
//                        }
//                        self.chatTableView.reloadData()
//                    }
//                }
//                // self.chatTableView.reloadData()
//            }
    }
}

extension CoffeeDetailsVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagess.count
//        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
        
        let a = messagess[indexPath.row]
//        cell.comment.text = messageTextField.text ?? "YY"
        
        cell.comment.text = a.content
//        cell.backgroundColor = .cyan
        
        let currentUserID = Auth.auth().currentUser?.uid
//        cell.textLabel?.text = messagess[indexPath.row].content
//        print(messages[indexPath.row].content)
//        if messages[indexPath.row].sender == currentUserID {
//            cell.textLabel?.textAlignment = .right
//            cell.textLabel?.textColor = .blue
//        } else {
//            cell.textLabel?.textAlignment = .left
//            cell.textLabel?.textColor = .red
//        }
        return cell
    }
}

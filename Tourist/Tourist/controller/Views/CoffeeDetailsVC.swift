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
 
       
       var comments: Array<Message> = []
       var user : User?
       var messages = [Message]()
       var Places: abhPlace?
       var message : Message?
       var PlacesC: abhPlace?
   

    override func viewDidLoad() {
        super.viewDidLoad()
  
    

        
        commentService.shared.listenToComment { newComment in
            self.comments = newComment
              self.commentTableView.reloadData()
            }
        setupUI()
        getAllComments()
        commentTableView.register(CommentCell.self, forCellReuseIdentifier: "commentCell")
        
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
       
       
    let commentTableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        return $0
    }(UITableView())
       
    let commentTextField : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = NSLocalizedString("Comment...", comment: "")
        $0.textColor = .black
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
       
     let sharePlace: UIButton = {
     let share = UIButton()
     
                 share.translatesAutoresizingMaskIntoConstraints = false
                 share.setTitleColor(.darkGray, for: .normal)
                 share.setImage(UIImage(named: "send"), for: .normal)
                 share.layer.cornerRadius = 20
                 share.layer.masksToBounds = true
                 share.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)
     
                   return share
     
             }()
       let LocationBtn: UIButton = {
                   let LocationBtn = UIButton()
       
                    LocationBtn.translatesAutoresizingMaskIntoConstraints = false
                    LocationBtn.setTitleColor(.darkGray, for: .normal)
                    LocationBtn.setImage(UIImage(named: "Location"), for: .normal)
                    LocationBtn.layer.cornerRadius = 20
                    LocationBtn.layer.masksToBounds = true
                   LocationBtn.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
       
                   return LocationBtn
       
                }()
    
        func setupUI() {
        navigationItem.title = user?.name
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        
        
         view.addSubview(commentTableView)
         view.addSubview(sharePlace)
         view.addSubview(LocationBtn)
         view.addSubview(commentTextField)
         view.addSubview(sendButton)
        
        
        
        
        NSLayoutConstraint.activate([
            
            commentTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -95),
            commentTableView.self.heightAnchor.constraint(equalToConstant: 200),
            commentTableView.self.widthAnchor.constraint(equalToConstant: 170),
            commentTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 620),
            
            
            commentTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 230),
            commentTextField.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
            commentTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            commentTextField.heightAnchor.constraint(equalToConstant: 40),
            commentTextField.widthAnchor.constraint(equalToConstant: 100),
            
            
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            sendButton.heightAnchor.constraint(equalTo: commentTextField.heightAnchor),
            sendButton.widthAnchor.constraint(equalTo: sendButton.heightAnchor),
            sendButton.centerYAnchor.constraint(equalTo: commentTextField.centerYAnchor),
            
            
            
            sharePlace.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 270),
            sharePlace.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
            sharePlace.heightAnchor.constraint(equalToConstant: 40),
            sharePlace.widthAnchor.constraint(equalToConstant: 50),
            sharePlace.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250),
            
            
            LocationBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 320),
            LocationBtn.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
            LocationBtn.heightAnchor.constraint(equalToConstant: 50),
            LocationBtn.widthAnchor.constraint(equalToConstant: 50),
            LocationBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250),
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
           collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -250).isActive = true
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
      
       //share
      @objc func sharePressed (_ sender: Any) {
          let sharePlace = UIActivityViewController(activityItems: [self.PlacesC?.name ?? ""], applicationActivities: nil)
          sharePlace.popoverPresentationController?.sourceView = self.view
        self.present(sharePlace, animated: true, completion: nil)
      }
       @objc func locationPressed (_ sender: Any) {
           if let url4 = URL(string: "https://goo.gl/maps/tPDLy7tWz2RReKox6") {
                      UIApplication.shared.open(url4)
           

                     }
    
    }
}

extension CoffeeDetailsVC {
  
    @objc func sendMessage() {

        commentTextField.resignFirstResponder()

        
        
        let content = commentTextField.text ?? ""
        let id = UUID().uuidString
         
            commentService.shared.addH(
              hostels: Message(content: content, id: id)
            )
        
        commentTextField.text = ""
    }
    
    func getAllComments() {
        guard let chatID = user?.id else {return}
        guard let userID = Auth.auth().currentUser?.uid else {return}
        self.messages.removeAll()

        Firestore.firestore()
            .collection("messages")
            .whereField("receiver", isEqualTo: userID)
            .whereField("sender", isEqualTo: chatID)
            .addSnapshotListener { snapshot, error in
                guard let userID = Auth.auth().currentUser?.uid else {return}
                if error == nil {
                    for document in snapshot!.documents{
                        let data = document.data()
}
                    }
                    self.commentTableView.reloadData()
                }
            }

    }


extension CoffeeDetailsVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
        
        let a = comments[indexPath.row]
        
        cell.comment.text = a.content
        
        let currentUserID = Auth.auth().currentUser?.uid

        return cell
    }
}

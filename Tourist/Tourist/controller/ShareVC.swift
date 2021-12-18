//

//  tourist
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//
//
//import AVFoundation
//import UIKit
//
//
////share Place class
//class ShareVC : UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate {
//
//    
//    func callSegueFromCell(prodIndex: IndexPath) {
//        performSegue(
//            withIdentifier: "update_page",
//            sender: prodIndex
//        )
//    }
//    var newP: Array<abhPlace> = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        //gradienView Page
//        setGradientBackground()
//
//
//      view.backgroundColor = .white
//            setUpImage()
//        
//        //Sup view
//        view.addSubview(btnPlace)
//        view.addSubview(fieldPlace)
//   }
//    
//    
//    // Image Piker
//  let imagePicker = UIImagePickerController()
//    
//  var Image: UIImageView = {
//    let pI = UIImageView()
//    pI.image = UIImage(named: "12")
//      pI.layer.cornerRadius = 50
//    return pI
//  }()
//    
//    // description
//    var fieldPlace: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.backgroundColor = UIColor(named: "Color")
//        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
//        tf.textColor = .black
//
//        tf.placeholder = (NSLocalizedString(" Place Name....", comment: ""))
//        return tf
//    }()
//
//    // button to chare place in visitor vc
//    var btnPlace: UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
////        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
//        btn.setTitleColor(.black, for: .normal)
//        btn.setTitle(NSLocalizedString("Share", comment: ""), for: .normal)
//        btn.backgroundColor = UIColor(named: "Color")
//        btn.addTarget(self, action: #selector(sharePlace), for: .touchUpInside)
//        btn.layer.cornerRadius = 25
//        btn.layer.masksToBounds = true
//        return btn
//    }()
//    
//    
//  override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//      
//      
//      
//      //constraint
//      
//       Image.translatesAutoresizingMaskIntoConstraints = false
//      btnPlace.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        
//
//      Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//      Image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//      Image.widthAnchor.constraint(equalToConstant: 200),
//      Image.heightAnchor.constraint(equalToConstant: 200),
//      
//      
//      btnPlace.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
//      btnPlace.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//      btnPlace.widthAnchor.constraint(equalToConstant: 100),
//      btnPlace.heightAnchor.constraint(equalToConstant: 100),
//      
//      
//      fieldPlace.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
//      fieldPlace.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//      fieldPlace.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//      fieldPlace.heightAnchor.constraint(equalToConstant: 40),
//
//        ])
//  }
//    
//    
//    
//    // function action when pressed button
//  @objc private func presentPhotoInputActionsheet() {
//      let actionSheet = UIAlertController(title: "Attach Photo camera ",
//                        message: "Where would you like to attach a photo from",
//                        preferredStyle: .actionSheet)
//      
//      
//      actionSheet.addAction(UIAlertAction(title: "Take A photo ", style: .default, handler: { [weak self] _ in
//        let picker = UIImagePickerController()
//        picker.sourceType = .camera
//        picker.delegate = self
//        picker.allowsEditing = true
//        self?.present(picker, animated: true)
//      }))
//      
//      
//      
//      actionSheet.addAction(UIAlertAction(title: "Add Photo for a place  ", style: .default, handler: { [weak self] _ in
//        let picker = UIImagePickerController()
//        picker.sourceType = .photoLibrary
//        picker.delegate = self
//        picker.allowsEditing = true
//        self?.present(picker, animated: true)
//      }))
//      actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//      present(actionSheet, animated: true)
//    }
//    
//    
//    
//    // action present photo
//  func setUpImage() {
//    Image.isUserInteractionEnabled = true
//    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentPhotoInputActionsheet))
//    Image.addGestureRecognizer(tapRecognizer)
//      //add subview
//    view.addSubview(Image)
//  }
//    
//    // image piker
//  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//   picker.dismiss(animated: true, completion: nil)
//   guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
//    return
//   }
//      
//      
//   self.Image.image = selectedImage
//  }
//    var indexPath: IndexPath!
//
//
//    // function to move image and descripton to visior page
//    @objc func sharePlace() {
//        
//        _ = fieldPlace.text ?? ""
//        _ = Image.image
//        
//        
//        let updatedPlace = abhPlace(image:  "\(String(describing: Image.image))" ,
//            name: fieldPlace.text ?? "",
//            placeA: [])
//
//        PlaceList.append(updatedPlace)
//        
//        // alert Done
//        let alert1 = UIAlertController(
//            title: ("Done ✅"),message: "Thnak you for sharing ",preferredStyle: .alert)
//        alert1.addAction(UIAlertAction(title: "OK",style: .default,handler: { action in
//            print("OK")
//        }
//                                      )
//       )
//        present(alert1, animated: true, completion: nil)
//
//
//    }
//}

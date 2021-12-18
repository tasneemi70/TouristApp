//
//  MyProfileVC.swift
//  snapchatt
//
//  Created by sally asiri on 08/04/1443 AH.
//
import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth



////profile class
///
class ProfileVC : UIViewController, UIImagePickerControllerDelegate,UITextFieldDelegate, UINavigationControllerDelegate{

    
    
    // image profile
    lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        view.layer.cornerRadius = 50
        view.isUserInteractionEnabled = true
        return view
    }()

    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        return imagePicker
    }()
    
    // name profile
    let name : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = NSLocalizedString("Write your name", comment: "")
        $0.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 23)
      
        return $0
    }(UITextField())

    // sign out from tourist app
    let signOutButton : UIButton = {
        $0.backgroundColor = UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        $0.setTitle(NSLocalizedString(NSLocalizedString("sign out", comment: ""), comment: ""), for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //change language to english and arabic
    let changeLanguage : UIButton = {
        let change = UIButton()
        change.backgroundColor = UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        change.translatesAutoresizingMaskIntoConstraints = false
        change.layer.cornerRadius = 20
        change.setTitle(NSLocalizedString("Change Language", comment: ""), for: .normal)
        change.setTitleColor(.black, for: .normal)
        change.addTarget(self, action: #selector(btnChangeLangauge), for: .touchUpInside)
        
      
        return change
    }()
    
    // sharr app
    let shareApp : UIButton = {
        let shareApp = UIButton()
        shareApp.backgroundColor = UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
        shareApp.translatesAutoresizingMaskIntoConstraints = false
        shareApp.layer.cornerRadius = 20
        shareApp.setTitle(NSLocalizedString("Share App", comment: ""), for: .normal)
        shareApp.setTitleColor(.black, for: .normal)
        shareApp.addTarget(self, action: #selector(shareTheApp), for: .touchUpInside)
        
        return shareApp
    }()
    
    // function to share app
    @objc func shareTheApp(sender:UIView){
           UIGraphicsBeginImageContext(view.frame.size)
           view.layer.render(in: UIGraphicsGetCurrentContext()!)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()

           let textToShare = "Check out my app"
                   //Enter the link app here
           if let myWebsite = URL(string: "http://itunes.apple.com/app/idXXXXXXXXX") {
               let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
               let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

               //Excluded Activities
               activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]

               activityVC.popoverPresentationController?.sourceView = sender
               self.present(activityVC, animated: true, completion: nil)
           }    }
    // function change language
   @objc func btnChangeLangauge() {
       let currentLangauge = Locale.current.languageCode
       print("currentLangauge: \(currentLangauge ?? "")")
       let newLanguage = currentLangauge == "en" ? "er" : "en"
       UserDefaults.standard.setValue([newLanguage], forKey: "AppleLangauges")
        exit(0)
    }
    
// function to open image
    @objc func OpenImage(_ sender: Any) {
        let pick = UIImagePickerController()
        pick.allowsEditing = true
        pick.delegate = self
        present(pick, animated: true)
    }
// image piket
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
        profileImage.image = image
        dismiss(animated: false)
    }
    
    
    
// view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // gradient color
      setGradientBackground()
      view.backgroundColor =  UIColor(displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)

        self.title = NSLocalizedString("Profile", comment: "")
        view.backgroundColor = UIColor(named: "Color")
    
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))

        profileImage.addGestureRecognizer(tapRecognizer)
        profileImage.image = .init(systemName: "455")
        profileImage.tintColor = UIColor(ciColor: .black)
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 50
        profileImage.contentMode = .scaleAspectFit
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        
// constraint
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200)
        ])

        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 470),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 80),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            name.heightAnchor.constraint(equalToConstant: 40),
            name.widthAnchor.constraint(equalToConstant: 290),
       
        ])
        
        view.addSubview(changeLanguage)
        NSLayoutConstraint.activate([
            changeLanguage.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            changeLanguage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            changeLanguage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            changeLanguage.heightAnchor.constraint(equalToConstant: 40),

        ])
        
        view.addSubview(shareApp)
        NSLayoutConstraint.activate([
            shareApp.topAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            shareApp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            shareApp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            shareApp.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        view.addSubview(signOutButton)
        NSLayoutConstraint.activate([
            signOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 680),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            signOutButton.heightAnchor.constraint(equalToConstant: 40)
        ])


// firestore connect
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                self.name.text = doucument?.data()?["name"] as? String
                self.profileImage.image = doucument?.data()?["image"] as? UIImage

            }
    }
// function action
    @objc func imageTapped() {
        print("Image tapped")
        present(imagePicker, animated: true)
    }
    
    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let vc = LogInVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
         
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
         
        }
    }
    
    private func setupGradientView3() {
        let _ = GradientView(self)
    }
}


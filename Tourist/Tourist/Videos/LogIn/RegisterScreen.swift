///
//  videoVC.swift
//  Tourist
//
//  Created by Tsnim Alqahtani on 24/04/1443 AH.
//

import UIKit
import FirebaseAuth


class RegisterVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
	
	var users: Array<User> = []
	
	lazy var profileImage: UIImageView = {
	   let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.backgroundColor = .white
		image.isUserInteractionEnabled = true
		image.layer.cornerRadius = 25

	   return image
   }()
	lazy var imagePicker : UIImagePickerController = {
	   let imagePicker = UIImagePickerController()
	   imagePicker.delegate = self
	   imagePicker.sourceType = .photoLibrary
	   imagePicker.allowsEditing = true

	   return imagePicker
   }()
	
	lazy var firstName: UITextField = {
	  let firstName = UITextField()
		firstName.translatesAutoresizingMaskIntoConstraints = false
		firstName.layer.cornerRadius = 12
		firstName.layer.borderWidth = 1
		firstName.layer.borderColor = UIColor.lightGray.cgColor
        firstName.placeholder = NSLocalizedString(" First Name...", comment: "")
		firstName.backgroundColor = .secondarySystemBackground
	  return firstName
  }()
	
	lazy var lastName: UITextField = {
	  let lastName = UITextField()
		lastName.translatesAutoresizingMaskIntoConstraints = false
		lastName.layer.cornerRadius = 12
		lastName.layer.borderWidth = 1
		lastName.layer.borderColor = UIColor.lightGray.cgColor
		lastName.placeholder = NSLocalizedString("  Last Name...", comment: "") 
		lastName.backgroundColor = .secondarySystemBackground
	  return lastName
  }()
	  lazy var userEmail: UITextField = {
		let userEmail = UITextField()
		  userEmail.translatesAutoresizingMaskIntoConstraints = false
		  userEmail.layer.cornerRadius = 12
		  userEmail.layer.borderWidth = 1
		  userEmail.layer.borderColor = UIColor.lightGray.cgColor
		  userEmail.placeholder = NSLocalizedString("  Email Address...", comment: "")
		  userEmail.backgroundColor = .secondarySystemBackground
		return userEmail
	}()

	private let userPassword: UITextField = {
		let userPassword = UITextField()
		userPassword.translatesAutoresizingMaskIntoConstraints = false
		userPassword.layer.cornerRadius = 12
		userPassword.layer.borderWidth = 1
		userPassword.layer.borderColor = UIColor.lightGray.cgColor
		userPassword.isSecureTextEntry = true
        userPassword.isSecureTextEntry = true

		userPassword.placeholder = NSLocalizedString("  Password...", comment: "")
		userPassword.backgroundColor = .secondarySystemBackground
		return userPassword
	}()

	private let registerButton: UIButton = {
		let registerButton = UIButton()
		registerButton.translatesAutoresizingMaskIntoConstraints = false
		registerButton.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
		registerButton.setTitleColor(.black, for: .normal)
		registerButton.backgroundColor = .systemTeal
		registerButton.layer.cornerRadius = 12
		registerButton.layer.masksToBounds = true
		registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
		registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		return registerButton
	}()
	
	lazy var labelToRegister: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
//		label.backgroundColor = .white
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		label.text = NSLocalizedString("did you have account? ", comment: "")
		return label
	  }()
	  lazy var logInButton: UIButton = {
		let logInBtn = UIButton()
		logInBtn.translatesAutoresizingMaskIntoConstraints = false
		logInBtn.setTitle(NSLocalizedString("Sign in", comment: ""), for: .normal)
		logInBtn.setTitleColor(.white, for: .normal)
//		logInBtn.backgroundColor = .white
		logInBtn.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
		logInBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
		return logInBtn
	  }()
	
	override func viewDidLoad() {
		super.viewDidLoad()
        setGradientBackground()

		RegisterService1.shared.listenToUsers { newUsers in
			self.users = newUsers
		}
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
		 profileImage.addGestureRecognizer(tapRecognizer)
		
		//view.backgroundColor = .white
		title = NSLocalizedString("Register", comment: "")
		
		
		//Constraint firstName
		view.addSubview(profileImage)
		NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            profileImage.heightAnchor.constraint(equalToConstant: 180),
            profileImage.widthAnchor.constraint(equalToConstant: 200)
		])
		view.addSubview(firstName)
		NSLayoutConstraint.activate([
            firstName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            firstName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 200),
            firstName.widthAnchor.constraint(equalToConstant: 350),
            firstName.heightAnchor.constraint(equalToConstant: 40),

		])
		
		//Constraint lastName
		view.addSubview(lastName)
		NSLayoutConstraint.activate([
            lastName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 16),
            lastName.widthAnchor.constraint(equalToConstant: 350),
            lastName.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint userEmail
		view.addSubview(userEmail)
		NSLayoutConstraint.activate([
            userEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            userEmail.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 16),
            userEmail.widthAnchor.constraint(equalToConstant: 350),
            userEmail.heightAnchor.constraint(equalToConstant: 40),
		])
		
		//Constraint userPassword
		view.addSubview(userPassword)
		NSLayoutConstraint.activate([
            userPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            userPassword.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 16),
            userPassword.widthAnchor.constraint(equalToConstant: 350),
            userPassword.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint loginButton
		view.addSubview(registerButton)
		NSLayoutConstraint.activate([
            registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            registerButton.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 16),
            registerButton.widthAnchor.constraint(equalToConstant: 300),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
		])
		
		view.addSubview(labelToRegister)
			NSLayoutConstraint.activate([
                labelToRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
                labelToRegister.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 40),
                labelToRegister.widthAnchor.constraint(equalToConstant: 300),
                labelToRegister.heightAnchor.constraint(equalToConstant: 40),
			])
			//Constraint LogInButton
			view.addSubview(logInButton)
			NSLayoutConstraint.activate([
                logInButton.rightAnchor.constraint(equalTo: labelToRegister.leftAnchor, constant: 200),
                logInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 40),
                logInButton.widthAnchor.constraint(equalToConstant: 50),
                logInButton.heightAnchor.constraint(equalToConstant: 40),
			])
		
  
	}
	
	@objc private func registerButtonTapped() {
		
		// linke with firebase
		let email = userEmail.text ?? ""
		let password = userPassword.text ?? ""
		let firstNam = firstName.text ?? ""
		let lastNam = lastName.text ?? ""
		let image = profileImage.image
		
		if email.isEmpty || password.isEmpty || firstNam.isEmpty || lastNam.isEmpty {
			return
		}
		Auth.auth().createUser(withEmail: email, password: password) { result, error in
			if error != nil {
				print(error as Any)
				return
			}
		}
		
		guard let userId = Auth.auth().currentUser?.uid else { return }
		RegisterService1.shared.addUser(
			user: User(id: userId, name: firstNam,status: NSLocalizedString("busy", comment: ""), image: "gs://snapapp-e0267.appspot.com", location: "")
		)
		//open TabVC bage
		let vc = TabVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	}
	
// image picker in register page
  @objc func imageTapped() {
	print("Image tapped")
	  present(imagePicker, animated: true)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
	let image = info[.editedImage] ?? info [.originalImage] as? UIImage
	  profileImage.image = image as? UIImage
	dismiss(animated: true)
  }
	
	@objc private func logInButtonTapped() {
		let vc = LogInVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	  }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            firstName.resignFirstResponder()
            lastName.resignFirstResponder()
            userEmail.resignFirstResponder()
            userPassword.resignFirstResponder()
               return true
           }
}

import UIKit
import FirebaseFirestore

class RegisterService1 {
	
	static let shared = RegisterService1()
	
	let usersCollection = Firestore.firestore().collection("users")
	
	// Add user to firestor
	func addUser(user: User) {
		usersCollection.document(user.id).setData([
			"name": user.name,
			"id": user.id,
			"image": user.image,
			"status": user.status,
			"location" : user.location
		])
	}
	
	func listenToUsers(completion: @escaping (([User]) -> Void)) {
		
		usersCollection.addSnapshotListener { snapshot, error in
			if error != nil { // if there's any error
				return
			}
			guard let documents = snapshot?.documents else { return }
			
			var users: Array<User> = []
			for document in documents {
				let data = document.data()
				let user = User(
					id: (data["id"] as? String) ?? "No id",
					name: (data["name"] as? String) ?? "No name",
					status: (data["status"] as? String ?? "No status"),
					image: (data["image"] as? String ?? "No image"),
					location: (data["status"] as? String ?? "No status")
				)
				users.append(user)
			}
			
			completion(users)
		}
	}
	func updateUserInfo(user: User) {
		usersCollection.document(user.id).setData([
			"id": user.id,
			"name": user.name,
			"image": user.image,
			"status": user.status,
		], merge: true)
	}

}

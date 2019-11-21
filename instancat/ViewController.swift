//
//  ViewController.swift
//  instancat
//
//  Created by Raul Aliaga Shapiama on 11/20/19.
//  Copyright © 2019 RaulAliaga. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var loginButton: UIBarButtonItem!
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var loginInfoLabel: UILabel!
    
    @IBOutlet weak var imageCollection: UICollectionView!
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImages()
        // Do any additional setup after loading the view.
    }
    
    func loadImages(){
        images.append(UIImage(named:"Imagen1")!)
        self.imageCollection.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.loginButton.isEnabled = false
            self.logoutButton.isEnabled = true
            self.loginInfoLabel.text = "Hello " + (Auth.auth().currentUser?.email)!
        } else {
            self.loginButton.isEnabled = true
            self.logoutButton.isEnabled = false
            self.loginInfoLabel.text = "Hello, please Login to see your photos"
        }
    }

    @IBAction func logoutClicked(_ sender: Any) {
        print("hola mundo")
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                print("salio de sesion")
                self.loginButton.isEnabled = true
                self.logoutButton.isEnabled = false
                self.loginInfoLabel.text = "Hello, please Login to see your photos"
                
            } catch let signOutError as NSError {
                print("Error signing out: ", signOutError)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image;
        return cell
    }
    
}


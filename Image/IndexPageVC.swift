//
//  IndexPageVC.swift
//  Image
//
//  Created by Nguyen Hoang Viet on 17/09/2021.
//

import UIKit
import Firebase
import Toast_Swift
class IndexPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func OnTapLogOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
}

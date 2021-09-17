//
//  RegisterVC.swift
//  Image
//
//  Created by Nguyen Hoang Viet on 17/09/2021.
//

import UIKit
import Firebase
import Toast_Swift

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBOutlet weak var txtTaiKhoan: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtRePassword: UITextField!
    
    @IBAction func OnTapRegister(_ sender: Any) {
        view.endEditing(true)
        if txtTaiKhoan.text == "" || txtPassword.text == "" || txtRePassword.text == ""
        {
            self.view.makeToast("Bạn chưa điền đầy đủ thông tin")
        }
        else if txtPassword.text != txtRePassword.text
        {
            self.view.makeToast("Điền lại mật khẩu không đúng")
        }
        else
        {
            Auth.auth().createUser(withEmail: txtTaiKhoan.text! , password: txtPassword.text!) { Audata, erros in
                if erros != nil {
                    self.view.makeToast(erros!.localizedDescription)
                }
                else
                {
                    Audata?.user.sendEmailVerification(completion: { erros in
                        if erros != nil
                        {
                            self.view.makeToast(erros!.localizedDescription)
                        }
                        else
                        {
                            self.view.makeToast("Send Verification")
                        }
                    })
                }
                
            }
        }
    }
}

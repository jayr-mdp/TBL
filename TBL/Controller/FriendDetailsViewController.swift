//
//  FriendDetailsViewController.swift
//  TBL
//
//  Created by JayR- Mac-mini on 9/3/21.
//

import UIKit
import MessageUI

class FriendDetailsViewController: UIViewController {

    @IBOutlet weak var portraitImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var cellPhone: UILabel!
    
    var friend : Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(FriendDetailsViewController.tapFunction))
        email.isUserInteractionEnabled = true
        email.addGestureRecognizer(tap)
    }
    

    func updateUI() {
        if let avatar = friend.picture?.large {
            portraitImage.imageFromServerURL(avatar, placeHolder: UIImage(named: "avatar"))
        }
        var strName = ""
        if let title = friend?.name?.title {
            strName.append("\(title) ")
        }
        if let first = friend?.name?.first {
            strName.append("\(first) ")
        }
        if let last = friend?.name?.last {
            strName.append("\(last) ")
        }
        var strAddress = ""
        if let number = friend?.location?.street?.number {
            strAddress.append("\(number) ")
        }
        if let name = friend?.location?.street?.name {
            strAddress.append("\(name) ")
        }
        var strCity = ""
        if let city = friend?.location?.city {
            strCity.append("\(city) ")
        }
        if let state = friend?.location?.state {
            strCity.append("\(state) ")
        }
        if let country = friend?.location?.country {
            strCity.append("\(country) ")
        }
        fullName.text = strName
        address.text = strAddress
        city.text = strCity
        email.text = friend.email
        cellPhone.text = friend.cell
    }
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        if let email = friend.email {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([email])
                mail.setSubject("Message Subject")
                mail.setMessageBody("Message content.", isHTML: false)
                
                self.present(mail, animated: true, completion: nil)
            } else {
                print("Sending email not available")
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

extension FriendDetailsViewController : MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

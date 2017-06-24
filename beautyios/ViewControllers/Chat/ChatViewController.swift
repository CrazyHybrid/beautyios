//
//  StoreEmptyViewController.swift
//  beautyios
//
//  Created by Michael on 6/22/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit
import Photos
import CoreLocation
import Kingfisher

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,  UIImagePickerControllerDelegate {
    
    //MARK: Properties
    @IBOutlet var inputBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var chatUserLabel: UILabel!
    
    override var inputAccessoryView: UIView? {
        get {
            self.inputBar.frame.size.height = self.barHeight
            self.inputBar.clipsToBounds = true
            return self.inputBar
        }
    }
    override var canBecomeFirstResponder: Bool{
        return true
    }
    let locationManager = CLLocationManager()
    var items = [ChatMessage]()
    let imagePicker = UIImagePickerController()
    let barHeight: CGFloat = 50
//    var currentUser: ChatUser?
    var canSendLocation = true
    

    //MARK: Methods
    func customization() {
        self.imagePicker.delegate = self
        self.tableView.estimatedRowHeight = self.barHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.contentInset.bottom = self.barHeight
        self.tableView.scrollIndicatorInsets.bottom = self.barHeight
        self.navigationItem.title = "1:1문의"
        self.navigationItem.setHidesBackButton(true, animated: false)
        let icon = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        
    }
    
    //Downloads messages
    func fetchData() {
//        Message.downloadAllMessages(forUserID: self.currentUser!.id, completion: {[weak weakSelf = self] (message) in
//            weakSelf?.items.append(message)
//            weakSelf?.items.sort{ $0.timestamp < $1.timestamp }
//            DispatchQueue.main.async {
//                if let state = weakSelf?.items.isEmpty, state == false {
//                    weakSelf?.tableView.reloadData()
//                    weakSelf?.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: false)
//                }
//            }
//        })
//        Message.markMessagesRead(forUserID: self.currentUser!.id)
    }
    
    
    func composeMessage(type: MessageType, content: Any)  {
//        let message = Message.init(type: type, content: content, owner: .sender, timestamp: Int(Date().timeIntervalSince1970), isRead: false)
//        Message.send(message: message, toID: self.currentUser!.id, completion: {(_) in
//        })
    }
    
    func animateExtraButtons(toHide: Bool)  {
        switch toHide {
        case true:
            self.bottomConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.inputBar.layoutIfNeeded()
            }
        default:
            self.bottomConstraint.constant = -50
            UIView.animate(withDuration: 0.3) {
                self.inputBar.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func showMessage(_ sender: Any) {
       self.animateExtraButtons(toHide: true)
    }
    
    @IBAction func selectGallery(_ sender: Any) {
        self.animateExtraButtons(toHide: true)
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == .authorized || status == .notDetermined) {
            self.imagePicker.sourceType = .savedPhotosAlbum;
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func selectCamera(_ sender: Any) {
        self.animateExtraButtons(toHide: true)
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        if (status == .authorized || status == .notDetermined) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func showOptions(_ sender: Any) {
        self.animateExtraButtons(toHide: false)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        if let text = self.inputTextField.text {
            if text.characters.count > 0 {
                self.composeMessage(type: .text, content: self.inputTextField.text!)
                self.inputTextField.text = ""
            }
        }
    }
    
    //MARK: NotificationCenter handlers
    func showKeyboard(notification: Notification) {
        
//        if let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
//            let height = frame.cgRectValue.height
//            self.tableView.contentInset.bottom = height
//            self.tableView.scrollIndicatorInsets.bottom = height
//            if self.items.count > 0 {
//                self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
//            }
//        }
    }

    //MARK: Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.items[indexPath.row].send_or_receive {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "Receiver", for: indexPath) as! ReceiverCell
            cell.clearCellData()
            if self.items[indexPath.row].messagetype == 0 {
            
                cell.message.text = self.items[indexPath.row].message
            }
            else if self.items[indexPath.row].messagetype == 10{
                let url = self.items[indexPath.row].message
                
                cell.messageBackground.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
                }

            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sender", for: indexPath) as! SenderCell
            cell.clearCellData()
            
            if self.items[indexPath.row].messagetype == 0{
                cell.message.text = self.items[indexPath.row].message
            }
            else if self.items[indexPath.row].messagetype == 10{
                let url = self.items[indexPath.row].message
                
                cell.messageBackground.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "banner"), options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, cacheType, url) in
                }
            
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.inputTextField.resignFirstResponder()
        if self.items[indexPath.row].messagetype == 10 {
//            if let photo = self.items[indexPath.row].message {
//                let info = ["viewType" : ShowExtraView.preview, "pic": photo] as [String : Any]
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
//                self.inputAccessoryView?.isHidden = true
//            }

        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.composeMessage(type: .photo, content: pickedImage)
        } else {
            let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.composeMessage(type: .photo, content: pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    


    //MARK: ViewController lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.inputBar.backgroundColor = UIColor.clear
        self.view.layoutIfNeeded()
//        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.showKeyboard(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
//        Message.markMessagesRead(forUserID: self.currentUser!.id)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customization()
        self.fetchData()
    }
    
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNotiButton(_ sender: Any) {
    }
}




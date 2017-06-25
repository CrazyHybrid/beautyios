//  MIT License

//  Copyright (c) 2017 Haik Aslanyan

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import Foundation
import UIKit


class SenderCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var messagetime: UILabel!

    @IBOutlet weak var message: UITextView!
    
    func clearCellData()  {
        self.message.text = nil
        self.message.isHidden = false
        self.messagetime.text = nil
        self.messagetime.isHidden = false
        self.logo.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.logo.layer.cornerRadius = 25
        self.logo.clipsToBounds = true
    }
}

class SenderImageCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var messagetime: UILabel!

    @IBOutlet weak var imgmessage: UIImageView!
    
    func clearCellData()  {
        self.messagetime.text = nil
        self.messagetime.isHidden = false
        self.imgmessage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.logo.layer.cornerRadius = 25
        self.logo.masksToBounds = true
    }
}


class ReceiverCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var messagetime: UILabel!

    @IBOutlet weak var message: UITextView!
    
    func clearCellData()  {
        self.message.text = nil
        self.message.isHidden = false
        self.messagetime.text = nil
        self.messagetime.isHidden = false
        
        self.logo.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.logo.layer.cornerRadius = 25
        self.logo.clipsToBounds = true
    }
}

class DefaulReceiverCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var messagetime: UILabel!
    
    @IBOutlet weak var message: UITextView!
    
    func clearCellData()  {
        self.message.text = nil
        self.message.isHidden = false
        self.messagetime.text = nil
        self.messagetime.isHidden = false
        
        self.logo.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.logo.layer.cornerRadius = 25
        self.logo.clipsToBounds = true
    }
}

class ReceiverImageCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var messagetime: UILabel!

    @IBOutlet weak var imgmessage: UIImageView!
    
    
    func clearCellData()  {
        self.messagetime.text = nil
        self.messagetime.isHidden = false
        self.imgmessage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.logo.layer.cornerRadius = 25
        self.logo.masksToBounds = true
    }
}

class ConversationsTBCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: RoundedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func clearCellData()  {
        self.nameLabel.font = UIFont(name:"AvenirNext-Regular", size: 17.0)
        self.messageLabel.font = UIFont(name:"AvenirNext-Regular", size: 14.0)
        self.timeLabel.font = UIFont(name:"AvenirNext-Regular", size: 13.0)
        self.profilePic.layer.borderColor = GlobalVariables.purple.cgColor
        self.messageLabel.textColor = UIColor.rbg(r: 111, g: 113, b: 121)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profilePic.layer.borderWidth = 2
        self.profilePic.layer.borderColor = GlobalVariables.purple.cgColor
    }
    
}

class ContactsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var profilePic: RoundedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}





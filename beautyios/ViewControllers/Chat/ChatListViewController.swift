//
//  ChatListViewController.swift
//  beautyios
//
//  Created by Michael on 6/23/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class ChatListViewController: ViewController{
    
    
    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var notiLabel: UILabel!
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onBack(_ sender: Any) {
    }
    
    @IBAction func onClickNotiButton(_ sender: Any) {
    }
    
    
}

extension ChatListViewController{
    
    
}

extension ChatListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreViewCell
        
        return cell
    }
    
}

extension ChatListViewController: UITableViewDelegate{
    
}

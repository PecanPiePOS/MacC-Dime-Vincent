//
//  MessageViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/08.
//

import UIKit

import SnapKit
import Then

class MessageViewController: BaseViewController {
    lazy var channelTableView: UITableView = {
        let view = UITableView()
        view.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.className)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    var channels = [Channel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.addSubview(channelTableView)
        channelTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        title = "Channel"
        channels = getChannelMocks()
    }
    
}

extension MessageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.className, for: indexPath) as! MessageTableViewCell
        cell.chatRoomLabel.text = channels[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = channels[indexPath.row]
        let viewController = ChatViewController(channel: channel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

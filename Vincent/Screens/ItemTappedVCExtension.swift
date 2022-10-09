//
//  ItemTappedVCExtension.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/09.
//
import SnapKit
import UIKit
import Then

extension ItemTappedViewController {
    @objc func didPressLikeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "heart.fill", withConfiguration: symbolConfiguration), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "heart", withConfiguration: symbolConfiguration), for: .normal)
        }
    }

    @objc func didPressBuyButton(_ sender: UIButton) {
        print("should navigate to ChatView")
    }
}

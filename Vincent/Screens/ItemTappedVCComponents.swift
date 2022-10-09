//
//  ItemTappedVCComponents.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/10.
//

import SnapKit
import UIKit
import Then


// MARK: 테스트용 라벨로 추후 이미지뷰가 대체함
let testLabel = UILabel().then {
    $0.text = "Image would be here"
}

let bottomUIView = UIView(frame: .zero).then {
    $0.backgroundColor = .mainBlack
}

let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

let likeButton = UIButton().then {
    let image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
    $0.setImage(image, for: .normal)
    $0.tintColor = .white
}

// MARK: 추후 setTitle부분에 변수가 들어가야함
let buyButton = UIButton().then {
    $0.setTitle("33000원에 살게요", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    $0.setTitleColor(.black, for: .normal)
    $0.backgroundColor = .mainYellow
    $0.layer.cornerRadius = 15
}

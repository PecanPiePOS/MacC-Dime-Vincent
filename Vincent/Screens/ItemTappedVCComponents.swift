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

let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

let likeButton = UIButton().then {
    let image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
    $0.setImage(image, for: .normal)
}

let bottomUIView = UIView(frame: .zero).then {
    $0.backgroundColor = .gray
}

let buyButton = UIButton(configuration: .filled()).then {
    $0.setTitle("33000원에 살게요", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.tintColor = .systemYellow
}

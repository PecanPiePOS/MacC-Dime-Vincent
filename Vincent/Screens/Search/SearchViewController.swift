//
//  SearchViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import UIKit

import SnapKit
import Then

    // TODO: ArtItemViewController 로 잇기
    // TODO: ⭐️ 상품들이 보이는 뷰가 search 에서 왔는지, category 에서 왔는지에 따라 UI 가 다르기 때문에 수정 사항이 필요해 보인닷.
final class SearchViewController: BaseViewController {

    // MARK: - property

    private let screenText = UILabel().then {
        $0.textColor = .red
        $0.text = "검색"
    }
    
    override func render() {
        view.addSubview(screenText)
        screenText.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

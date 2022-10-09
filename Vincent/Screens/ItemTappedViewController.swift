//
//  ItemTappedViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/09.
//
import SnapKit
import UIKit
import Then

class ItemTappedViewController: BaseViewController {

    // MARK: dynamic size로 변경 필요
    lazy private var scrollView = UIScrollView(frame: .zero).then {
        var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 400)
        $0.backgroundColor = .systemBlue
        $0.frame = view.bounds
        $0.contentSize = scrollContentViewSize
    }

    lazy private var scrollContentView = UIView(frame: .zero).then {
        $0.backgroundColor = .orange
        $0.frame.size = scrollView.frame.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
    }

    // layout
    override func render() {
        //scroll
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)

        scrollContentView.addSubviews(testLabel, bottomUIView)
        testLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollContentView.snp.centerX)
            $0.top.equalTo(scrollContentView.snp.top).offset(100)
        }

        bottomUIView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
            $0.height.equalTo(116)
            $0.width.equalToSuperview()
        }

        bottomUIView.addSubviews(buyButton, likeButton)
        likeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
        buyButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
    }
    // configuration
    override func configUI() {
    }

    private func setFunctionAndDelegate() {
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(didPressBuyButton(_:)), for: .touchUpInside)
    }
}




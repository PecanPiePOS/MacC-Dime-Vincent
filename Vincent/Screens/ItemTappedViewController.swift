//
//  ItemTappedViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/09.
//
import UIKit
import Then
import SnapKit

class ItemTappedViewController: BaseViewController {

    lazy private var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 400)

    lazy var scrollView = UIScrollView(frame: .zero).then {
        $0.backgroundColor = .systemBlue
        $0.frame = view.bounds
        $0.contentSize = scrollContentViewSize
    }

    lazy var scrollContentView = UIView(frame: .zero).then {
        $0.backgroundColor = .orange
        $0.frame.size = scrollView.frame.size
    }

    let testLabel = UILabel().then {
        $0.text = "Image would be here"
    }

    let bottomUIView = UIView(frame: .zero).then {
        $0.backgroundColor = .gray
    }

    let buyButton = UIButton(configuration: .filled()).then {
        $0.setTitle("33000원에 살게요", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .systemYellow
    }

    let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    lazy var likeButton = UIButton().then {
        let image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        $0.setImage(image, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
    }

    // layout
    override func render() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)

        scrollContentView.addSubview(testLabel)
        testLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollContentView.snp.centerX)
            $0.top.equalTo(scrollContentView.snp.top).offset(100)
        }

        scrollContentView.addSubview(bottomUIView)
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
        }
    }
    // configuration
    override func configUI() {
    }

    func setFunctionAndDelegate() {
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
    }

    @objc func didPressLikeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "heart.fill", withConfiguration: symbolConfiguration), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "heart", withConfiguration: symbolConfiguration), for: .normal)
        }
    }
}




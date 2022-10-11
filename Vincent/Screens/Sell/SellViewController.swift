//
//  SellViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/08.
//

import UIKit
import SnapKit
import Then

final class SellViewController: BaseViewController {
    
    // MARK: - Dummy Model for Adding Photos
    let dummyPhotos: [UIImage]? = []

    // MARK: - Head Components
    
    private let closeButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
    }
    
    private let headTitleLabel = UILabel().then {
        $0.text = "중고 물품 올리기"
        $0.font = UIFont.preferredFont(forTextStyle: .title3, weight: .semibold)
    }
    
    private let completeButton = UIButton(type: .system).then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3, weight: .semibold)
        $0.tintColor = .red
    }
    
    // MARK: - Photo Component
    
    // TODO: 눌러서 사진 등록 -> 버튼? UIView?
    private let photoAddView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    // MARK: - Sell Item Properties Compononts
    
    private let itemDescInfoTitle = "여기에 게시할 내용을 작성해주세요! 물건에 대한 상세한 정보가 담길수록 구매자는 물건에 대한 신뢰도를 얻어요. 그리고 구매가 더 잘 이루어져요!"
    
    private let sellItemTitleTextField = SellTextFieldView().then {
        $0.setLabelTextField.placeholder = "글 제목 *"
    }
    
    private let sellItemPriceTextField = SellTextFieldView().then {
        $0.setLabelTextField.keyboardType = .numberPad
        $0.setLabelTextField.placeholder = "가격 (원) *"
    }
    
    private let sellCheckBoxFree = SellCheckBoxView().then {
        $0.checkTitle.text = "나눔할래요!"
    }
    
    private let sellCheckBoxNego = SellCheckBoxView().then {
        $0.checkTitle.text = "가격 제안 좋아요!"
    }
    
    private let sellItemCategoryTapped = SellSelectView().then {
        $0.selectButtonTitle.text = "카테고리 선택 *"
    }
    
    private let sellItemBrandTapped = SellSelectView().then {
        $0.selectButtonTitle.text = "브랜드 (선택 사항)"
    }
    
    // MARK: - TextView
    
    private let itemDetailSectionTitle = UILabel().then {
        $0.text = "상세 설명"
        $0.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold)
    }
    
    private lazy var itemDetailTextView = UITextView().then {
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.textInputView.backgroundColor = .white
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline, weight: .light)
        $0.textContainerInset = UIEdgeInsets(top: 5, left: -5, bottom: 30, right: 20)
        $0.textColor = .gray
        $0.isEditable = true
        $0.dataDetectorTypes = .all
        $0.backgroundColor = .white
        $0.text = itemDescInfoTitle
        $0.textAlignment = .left
    }
    
    // MARK: - StackViews
    
    private let stackViewPhotoAdd = UIStackView().then {
        $0.axis = .horizontal
    }
    
    private let stackViewTextField = UIStackView().then {
        $0.spacing = 0
        $0.backgroundColor = .white
        $0.axis = .vertical
    }
    
    private let stackViewSelect = UIStackView().then {
        $0.spacing = 0
        $0.backgroundColor = .white
        $0.axis = .vertical
    }
    
    private let stackViewCheck = UIStackView().then {
        $0.backgroundColor = .white
        $0.axis = .horizontal
    }
    
    private let stackViewTextView = UIStackView().then {
        $0.spacing = 10
        $0.axis = .vertical
        $0.backgroundColor = .white
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        sellItemTitleTextField.setLabelTextField.delegate = self
        sellItemPriceTextField.setLabelTextField.delegate = self
        itemDetailTextView.delegate = self
        checkBoxToggle()
    }
    
    // MARK: - Constraints
    
    override func render() {
        super.render()
        view.addSubview(closeButton)
        view.addSubview(headTitleLabel)
        view.addSubview(completeButton)
        view.addSubview(photoAddView)
        
        stackViewTextField.addArrangedSubview(sellItemTitleTextField)
        stackViewTextField.addArrangedSubview(sellItemPriceTextField)
        stackViewSelect.addArrangedSubview(sellItemCategoryTapped)
        stackViewSelect.addArrangedSubview(sellItemBrandTapped)
        stackViewCheck.addArrangedSubview(sellCheckBoxFree)
        stackViewCheck.addArrangedSubview(sellCheckBoxNego)
        stackViewTextView.addArrangedSubview(itemDetailSectionTitle)
        stackViewTextView.addArrangedSubview(itemDetailTextView)
        
        
        view.addSubview(stackViewTextField)
        view.addSubview(stackViewSelect)
        view.addSubview(stackViewCheck)
        view.addSubview(stackViewTextView)
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).inset(20)
        }
        
        headTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(-5)
            $0.right.equalTo(self.view.safeAreaInsets.right).inset(20)
        }
        
        photoAddView.snp.makeConstraints {
            $0.top.equalTo(self.headTitleLabel.snp.bottom).offset(18)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        sellItemTitleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
        }
        
        NSLayoutConstraint.activate([
            sellCheckBoxFree.widthAnchor.constraint(equalToConstant: self.view.frame.width/2.8),
            sellCheckBoxFree.leftAnchor.constraint(equalTo: self.stackViewCheck.leftAnchor, constant: 20)
        ])
        
        stackViewTextField.snp.makeConstraints {
            $0.top.equalTo(self.photoAddView.snp.bottom).offset(15)
            $0.left.right.equalToSuperview()
        }
        
        stackViewSelect.snp.makeConstraints {
            $0.top.equalTo(self.stackViewTextField.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        stackViewCheck.snp.makeConstraints {
            $0.top.equalTo(self.stackViewSelect.snp.bottom).inset(5)
            $0.left.right.equalToSuperview()
        }
        
        stackViewTextView.snp.makeConstraints {
            $0.top.equalTo(self.stackViewCheck.snp.bottom).offset(12)
            $0.left.right.bottom.equalToSuperview()
        }
        
        itemDetailSectionTitle.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(15)
        }
//
//        itemDetailTextView.snp.makeConstraints {
//            $0.left.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
//            $0.top.equalTo(self.itemDetailSectionTitle.snp.bottom).offset(12)
//        }
    }

    override func configUI() {
        super.configUI()
    }
}
    // MARK: - Action functions

extension SellViewController {
    func checkBoxToggle() {
        let freeBoxTapped = UITapGestureRecognizer(target: self, action: #selector(freeBoxToggle))
        let negotiationBoxTapped = UITapGestureRecognizer(target: self, action: #selector(negotiationBoxToggle))
        sellCheckBoxFree.stackView.addGestureRecognizer(freeBoxTapped)
        sellCheckBoxNego.stackView.addGestureRecognizer(negotiationBoxTapped)
    }
    
    @objc func freeBoxToggle() {
        sellCheckBoxFree.checkBool.toggle()
        print("나눔할래요 : \(sellCheckBoxFree.checkBool)")
    }
    
    @objc func negotiationBoxToggle() {
        sellCheckBoxNego.checkBool.toggle()
        print("네고할래요 : \(sellCheckBoxNego.checkBool)")
    }
}

    // MARK: - TextViewDelegate

extension SellViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == itemDescInfoTitle {
            textView.font = UIFont.preferredFont(forTextStyle: .body, weight: .regular)
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.font = UIFont.preferredFont(forTextStyle: .subheadline, weight: .light)
            textView.text = itemDescInfoTitle
            textView.textColor = .gray
        }
    }
}

    // MARK: - TextField Delegate

extension SellViewController {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

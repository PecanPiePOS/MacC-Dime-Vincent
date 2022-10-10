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
    
    private let itemDescInfoTitle = "여기에 게시할 내용을 작성해주세요!\n물건에 대한 상세한 정보가 담길수록 구매자는 물건에 대한 신뢰도를 얻어요.\n그리고 구매가 더 잘 이루어져요!"
    
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
    
    private let sellItmeCategoryTapped = SellSelectView().then {
        $0.selectButtonTitle.text = "카테고리 선택 *"
    }
    
    private let sellItemBrandTapped = SellSelectView().then {
        $0.selectButtonTitle.text = "브랜드 (선택 사항)"
    }
    
    // MARK: - TextView
    private lazy var itemDetailTextView = UITextView().then {
        $0.textInputView.backgroundColor = .red
        $0.font = UIFont.preferredFont(forTextStyle: .caption1, weight: .light)
        $0.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.textColor = .gray
        $0.isEditable = true
        $0.dataDetectorTypes = .all
        $0.backgroundColor = .green
        $0.text = itemDescInfoTitle
        $0.textAlignment = .left
    }
    
    // MARK: - StackViews
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
        view.addSubview(itemDetailTextView)
        
        stackViewTextField.addArrangedSubview(sellItemTitleTextField)
        stackViewTextField.addArrangedSubview(sellItemPriceTextField)
        stackViewSelect.addArrangedSubview(sellItmeCategoryTapped)
        stackViewSelect.addArrangedSubview(sellItemBrandTapped)
        stackViewCheck.addArrangedSubview(sellCheckBoxFree)
        stackViewCheck.addArrangedSubview(sellCheckBoxNego)
        
        view.addSubview(stackViewTextField)
        view.addSubview(stackViewSelect)
        view.addSubview(stackViewCheck)
        
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
            $0.top.equalTo(self.headTitleLabel.snp.bottom).offset(24)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        NSLayoutConstraint.activate([
            sellCheckBoxFree.widthAnchor.constraint(equalToConstant: self.view.frame.width/2.8),
            sellCheckBoxFree.leftAnchor.constraint(equalTo: self.stackViewCheck.leftAnchor, constant: 20)
        ])
        
        stackViewTextField.snp.makeConstraints {
            $0.top.equalTo(self.photoAddView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview()
        }
        
        stackViewSelect.snp.makeConstraints {
            $0.top.equalTo(self.stackViewTextField.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        stackViewCheck.snp.makeConstraints {
            $0.top.equalTo(self.stackViewSelect.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        itemDetailTextView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(self.stackViewCheck.snp.bottom).offset(12)
        }
        
    }
    
    override func configUI() {
        super.configUI()
        
    }

}

    // MARK: - TextViewDelegate

extension SellViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == itemDescInfoTitle {
            textView.text = nil
            textView.textColor = .black
        }
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

    // MARK: - TextField Delegate

extension SellViewController {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

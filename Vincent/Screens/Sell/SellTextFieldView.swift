//
//  SellTextFieldView.swift
//  Vincent
//
//  Created by KYUBO A. SHIM on 2022/10/09.
//

import UIKit
import SnapKit
import Then

class SellTextFieldView: UIView, UITextFieldDelegate {
    
    
    let setLabelTextField = UITextField().then {
//        $0.backgroundColor = .red
//        $0.clearButtonMode = .whileEditing
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.enablesReturnKeyAutomatically = true
        $0.textColor = UIColor(white: 0, alpha: 0.8)
        $0.font = UIFont.preferredFont(forTextStyle: .body, weight: .bold)
    }
    
    let dividerView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    let stackView = UIStackView().then {
        $0.spacing = 9
        $0.axis = .vertical
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        updateConstraints()
    }
    
    override func updateConstraints() {
        render()
        super.updateConstraints()
    }
    
    func render() {
        stackView.addArrangedSubview(setLabelTextField)
        stackView.addArrangedSubview(dividerView)
        
        self.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
        setLabelTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.left.equalToSuperview().inset(24)
        }
        
        dividerView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    func configUI(){
        setLabelTextField.delegate = self
        setLabelTextField.attributedPlaceholder = NSAttributedString(string: "hello", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.5)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

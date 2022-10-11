//
//  ProfileTableViewCell.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/11.
//
import SnapKit
import UIKit
import Then

class ProfileTableViewCell: UITableViewCell {
    static let identifier = "ProfileTableViewCell"

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    var isUserProfileCell: Bool = false
    var cellTextLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
    }
    //MyProfile
    let userProfileImage = UIImageView().then {
        $0.image = UIImage(systemName: "drop")
    }
    let userNickName = UILabel().then {
        $0.textColor = .white
        $0.text = "다임다임"
        $0.font = .systemFont(ofSize: 20)
    }
    let userID = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14)
        $0.text = "@zdshld2134"
    }

    lazy private var chevronImage = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.forward", withConfiguration: symbolConfiguration)
        $0.tintColor = .white
    }

    var cellSpacing: CGFloat = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addsubview()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addsubview() {
        contentView.addSubviews(userProfileImage, userNickName, userID, cellTextLabel,chevronImage)
        if isUserProfileCell {
            contentView.addSubviews(userProfileImage, userNickName, userID,chevronImage)
        } else {
            contentView.addSubview(cellTextLabel)
        }
        contentView.backgroundColor = .mainBlack
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: cellSpacing, right: 0))

        chevronImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }

        //layout
        if isUserProfileCell {
            userProfileImage.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(20)
                $0.width.equalTo(40)
                $0.height.equalTo(40)
            }

            userNickName.snp.makeConstraints {
                $0.top.equalTo(userProfileImage)
                $0.leading.equalTo(userProfileImage.snp.trailing).offset(7)
            }

            userID.snp.makeConstraints {
                $0.leading.equalTo(userNickName)
                $0.top.equalTo(userNickName.snp.bottom).offset(2)
            }
        } else {
            cellTextLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(20)
            }
        }
    }

    func setupCellData(_ text: String, spacing: Int, isUserProfileCell: Bool) {
        self.isUserProfileCell = isUserProfileCell
        self.cellTextLabel.text = text
        self.cellSpacing = CGFloat(spacing)
    }
}

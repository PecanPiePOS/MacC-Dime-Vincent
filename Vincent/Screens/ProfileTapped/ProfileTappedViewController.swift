//
//  ProfileTappedViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/11.
//
import Then
import SnapKit
import UIKit


class ProfileTappedViewController: BaseViewController {
    let testHeaderTitle = ["내 프로필", "내 활동", "문의"]
    let userProfileCell = UIView(frame: .zero)
    let userNickName = UILabel().then {
        $0.text = "다임다임"
    }

    let userID = UILabel().then {
        $0.text = "@zdshld2134"
    }

    let profileTableView = UITableView().then {
        $0.rowHeight = 65
        $0.showsVerticalScrollIndicator = false
        $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        $0.tableFooterView = UIView(frame: .zero)
    }

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        setFunctionsAndDelegate()
        configUI()
    }

    override func render() {
        view.addSubview(profileTableView)
        profileTableView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(700)
            $0.centerY.equalToSuperview()
        }
    }

    private func setFunctionsAndDelegate() {
        profileTableView.delegate = self
        profileTableView.dataSource = self

    }

    override func configUI() {
        super.configUI()
    }

}

extension ProfileTappedViewController: UITableViewDataSource {
    //cell control
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell

        switch ProfileSection(rawValue: indexPath.section) {
        case .profileInformation:
            cell.setupCellData(ProfileSection.profileInformation.sectionOption[indexPath.row], spacing: 0, isUserProfileCell: true)
        case .myActivity:
            cell.setupCellData(ProfileSection.myActivity.sectionOption[indexPath.row], spacing: 10, isUserProfileCell: false)
        case .service:
            cell.setupCellData(ProfileSection.service.sectionOption[indexPath.row], spacing: 10, isUserProfileCell: false)
        case .none:
            print("default")
        }

        cell.selectedBackgroundView = UIView(frame: .zero)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ProfileSection(rawValue: section) {
        case .profileInformation: return 1
        case .myActivity: return MyActivities.allCases.count
        case .service: return 2
        case .none:
            return 0
        }
    }

    //section number
    func numberOfSections(in tableView: UITableView) -> Int {
        return testHeaderTitle.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        testHeaderTitle[section]
    }

}

extension ProfileTappedViewController: UITableViewDelegate {
}




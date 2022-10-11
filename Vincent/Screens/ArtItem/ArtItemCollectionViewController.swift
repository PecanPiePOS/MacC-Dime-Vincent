//
//  ArtItemCollectionViewController.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/11.
//

import UIKit

import SnapKit
import Then

class ArtItemCollectionView: BaseViewController {

    var artItems: [ArtItem] = []

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
    }
    

    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        populateProfiles()
        collectionView.reloadData()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArtItemCell.self, forCellWithReuseIdentifier: ArtItemCell.identifier)
    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `collectionView`
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func populateProfiles() {
        artItems = [
            ArtItem(artItemImage: "KidKen", artItemPrice: "30000원", artItemRegiserTime: "4일전", artItemTitle: "동심켄"),
            ArtItem(artItemImage: "HackerKen", artItemPrice: "50000원", artItemRegiserTime: "1일전", artItemTitle: "해커켄"),
            ArtItem(artItemImage: "WorkOutKen", artItemPrice: "10000원", artItemRegiserTime: "1시간전", artItemTitle: "운동켄"),
            ArtItem(artItemImage: "BeerKen", artItemPrice: "5000원", artItemRegiserTime: "3일전", artItemTitle: "맥주가 먹고싶은 그의 모습을 담은 사진입니다."),
            ArtItem(artItemImage: "GiantRookie", artItemPrice: "40000원", artItemRegiserTime: "7일전", artItemTitle: "기행종의 모습과 닮은 루키의 모습입니다."),
            ArtItem(artItemImage: "Hardy", artItemPrice: "1000원", artItemRegiserTime: "30분전", artItemTitle: "빠더너스의 이모티콘을 보고 따라찍은 하디입니다.")
        ]
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ArtItemCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return artItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtItemCell.identifier, for: indexPath) as! ArtItemCell

        let artItem = artItems[indexPath.row]
        cell.setup(with: artItem)
        cell.contentView.backgroundColor = .red
        print(#function)

        return cell
    }
}

extension ArtItemCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}

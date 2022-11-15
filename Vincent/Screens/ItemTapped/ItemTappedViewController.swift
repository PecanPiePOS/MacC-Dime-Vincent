//
//  ItemTappedViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/09.
//
import SnapKit
import UIKit
import Then

    // TODO: ScrollView 동적인 Height로 만들기
class ItemTappedViewController: BaseViewController {

    private let reportEarImage = ImageLiteral.reportEarImage

    private let shareImage  = ImageLiteral.shareImage

    private lazy var reportButton = UIButton(frame: CGRect(x: 0, y: 0, width: reportEarImage.size.width, height: reportEarImage.size.height)).then {
        $0.tintColor = .black
        $0.setImage(reportEarImage, for: .normal)
    }

    private lazy var shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: shareImage.size.width, height: shareImage.size.height)).then {
        $0.tintColor = .black
        $0.setImage(shareImage, for: .normal)
    }

    private lazy var reportNavigationBarItem = UIBarButtonItem(customView: reportButton)

    private lazy var shaareNavigationBarItem = UIBarButtonItem(customView: shareButton)

    // TODO: dynamic size로 변경 필요
    private lazy var baseScrollView = UIScrollView(frame: .zero).then {
        $0.backgroundColor = .white
        $0.frame = view.bounds
        $0.contentSize.width = view.frame.width
    }

    private let images: [UIImage?] = [UIImage(named: "i1"), UIImage(named: "i2"), UIImage(named: "i3"), UIImage(named: "i4")]

    private var imageScrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.isScrollEnabled = true
    }

    private lazy var pageControl = UIPageControl().then {
        $0.numberOfPages = images.count
        $0.backgroundColor = .clear
        $0.pageIndicatorTintColor = .gray
        $0.currentPageIndicatorTintColor = .mainYellow
    }

    private let bottomUIView = UIView(frame: .zero).then {
        $0.backgroundColor = .mainBlack
    }

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    private lazy var likeButton = UIButton().then {
        let image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        $0.setImage(image, for: .normal)
        $0.tintColor = .white
    }

    private let buyButton = UIButton().then {
        $0.setTitle("33000원에 살게요", for: .normal)
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote, weight: .bold)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .mainYellow
        $0.layer.cornerRadius = 15
    }

    // TODO: dynamic size로 변경 필요
    private lazy var scrollView = UIScrollView(frame: .zero).then {
        var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.width)
        $0.backgroundColor = .systemBlue
        $0.frame = view.bounds
        $0.contentSize = scrollContentViewSize
    }

    private let titleTextView = UITextView().then {
        $0.text = "루키의 물건들 가격 제안 가능!! 10000만원 이상 부터 "
        $0.isScrollEnabled = false
        $0.font = .preferredFont(forTextStyle: .title3, weight: .semibold)
        $0.isUserInteractionEnabled = false
    }

    private let dayLabel = UILabel().then {
        $0.text = "3일전"
        $0.font = .preferredFont(forTextStyle: .footnote, weight: .light)
        $0.textColor = .systemGray2
    }

    private let descriptionTextView = UITextView().then {
        let text: String = "여기있😉키의 물건들 가격 제안 가능!! 10000만원 이키의 물건들 가격 제안 가능!! 10000만원 이키의 물여기있😉키의 물건들 가격 제안 가능!! 10000만원 이키의 물건들 가격 제안 가능!! 10000만원 이키의 물여기들 가격 제안 가능!! 10000만원 이키의 물여기있😉키의 물건들 가격 제안 가능!! 10000만원 이키의 sdasdasdasdasdasdasdasdasdasdasddasdasdasdasdsadsadasdasdasdasdasdasdasdasdasdasd"
        $0.setLineAndLetterSpacing(text)
        $0.font = .preferredFont(forTextStyle: .callout, weight: .regular)
        $0.isScrollEnabled = false
        $0.isUserInteractionEnabled = false
    }

    private let firstSeperator = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    private let secondSeperator = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    private let sellerInformationCell = UIView().then {
        $0.isUserInteractionEnabled = true
    }

    private let sellerNickName = UILabel().then {
        $0.text = "해커켄"
        $0.font = .preferredFont(forTextStyle: .callout, weight: .regular)
    }

    private let sellerInformation = UILabel().then {
        $0.text = "거래수:3 / 팔고 있는 물품 4"
        $0.font = .preferredFont(forTextStyle: .footnote, weight: .light)
        $0.textColor = .systemGray2
    }

    private let sellerProfileImage = UIImageView().then {
        $0.image = UIImage(named: "Ken")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private let backButtonImage = UIImageView().then {
        $0.image = ImageLiteral.btnForward
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .systemGray2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
        navigationItem.rightBarButtonItems = [shaareNavigationBarItem, reportNavigationBarItem]
    }

    // layout
    override func render() {
        //baseScroll
        view.addSubviews(baseScrollView, bottomUIView)

        //baseScrollContentView
        baseScrollView.addSubviews(imageScrollView, pageControl,titleTextView, dayLabel, descriptionTextView, firstSeperator, secondSeperator, sellerInformationCell)

        //imageScrollView
        imageScrollView.snp.makeConstraints {
            $0.height.equalTo(300)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }

        //pageControl
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(imageScrollView.snp.bottom).inset(15)
            $0.height.equalTo(50)
            $0.width.equalTo(300)
        }

        //titleTextView
        titleTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.top.equalTo(imageScrollView.snp.bottom).offset(30)
        }

        //dayLabel
        dayLabel.snp.makeConstraints {
            $0.leading.equalTo(titleTextView).inset(5)
            $0.top.equalTo(titleTextView.snp.bottom)
        }

        firstSeperator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dayLabel.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        descriptionTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.top.equalTo(firstSeperator).offset(20)
        }

        secondSeperator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        sellerInformationCell.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondSeperator).offset(5)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }

        sellerInformationCell.addSubviews(sellerProfileImage, sellerNickName, sellerInformation, backButtonImage)

        sellerProfileImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }

        sellerNickName.snp.makeConstraints {
            $0.leading.equalTo(sellerProfileImage.snp.trailing).offset(10)
            $0.top.equalTo(sellerProfileImage)
        }

        sellerInformation.snp.makeConstraints {
            $0.leading.equalTo(sellerNickName)
            $0.top.equalTo(sellerNickName.snp.bottom).offset(5)
        }

        backButtonImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }

        //bottomUI
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
        configureScrollView()
    }

    override func viewDidLayoutSubviews() {

        baseScrollView.contentSize.height = imageScrollView.frame.height + titleTextView.frame.height + dayLabel.frame.height + descriptionTextView.frame.height + sellerInformationCell.frame.height + bottomUIView.frame.height * 1.5
    }

    private func setFunctionAndDelegate() {

        //addTarget
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(didPressBuyButton(_:)), for: .touchUpInside)

        reportButton.addTarget(self, action: #selector(didPressReportButton(_:)), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didPressShareButton(_:)), for: .touchUpInside)

        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)

        //set delegate
        imageScrollView.delegate = self

        //set TapGesture
        sellerInformationCell.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(didTapSellerInformationCell(_:))))
    }

    private func configureScrollView() {
        imageScrollView.contentSize.width = view.frame.width * CGFloat(images.count)

        for pageIndex in 0..<images.count {
            let imageView = UIImageView()
            let xPositionOrigin = self.view.frame.width * CGFloat(pageIndex)
            imageView.frame = CGRect(x: xPositionOrigin, y: 0, width: view.bounds.width, height: 300)
            imageView.backgroundColor = .orange
            imageView.image = images[pageIndex]
            imageScrollView.addSubview(imageView)
        }
    }

    private func selectedPage(_ currentPage: Int) {
        pageControl.currentPage = currentPage
    }
}

//obcj func
extension ItemTappedViewController {
    @objc func didPressLikeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "heart.fill", withConfiguration: symbolConfiguration), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "heart", withConfiguration: symbolConfiguration), for: .normal)
        }
    }

    @objc func didPressBuyButton(_ sender: UIButton) {
        print("should navigate to ChatView")
    }

    @objc func didPressReportButton(_ sender:UIBarButtonItem) {
        let presentedViewController = ReportViewController()
        presentedViewController.modalPresentationStyle = .overFullScreen
        presentedViewController.modalTransitionStyle = .crossDissolve
        present(presentedViewController, animated: true)
    }

    @objc func didPressShareButton(_ sender:UIBarButtonItem) {
        print("share")
    }

    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        imageScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }

    @objc func didTapSellerInformationCell(_ sender: UITapGestureRecognizer) {
        print("should navigate to SellerView")

    }
}

//delegate
extension ItemTappedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let size = scrollView.contentOffset.x / scrollView.frame.size.width
        selectedPage(Int(round(size)))
    }
}

    // TODO: seller 따로 하나로 합치기
// 예상 모델
struct ItemInformation: Identifiable {
    let id: String
    let images: [Data]
    let titleText: String
    let dayText: Date
    let descritionText: String
    let sellerProfileImage: Data
    let sellerNickName: String
    let sellerInformation: String
}

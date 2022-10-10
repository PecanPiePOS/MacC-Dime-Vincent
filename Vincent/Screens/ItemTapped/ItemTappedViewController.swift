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

    // TODO: dynamic size로 변경 필요
    lazy private var baseScrollView = UIScrollView(frame: .zero).then {
        var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 400)
        $0.backgroundColor = .white
        $0.frame = view.bounds
        $0.contentSize = scrollContentViewSize
    }

    lazy private var baseScrollContentView = UIView(frame: .zero).then {
        $0.backgroundColor = .systemGray4
        $0.frame.size = baseScrollView.frame.size
    }

    private let images: [UIImage?] = [UIImage(named: "i1"), UIImage(named: "i2"), UIImage(named: "i3"), UIImage(named: "i4")]

    private var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = images.count
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .mainYellow
        return pageControl
    }()

    private let bottomUIView = UIView(frame: .zero).then {
        $0.backgroundColor = .mainBlack
    }

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    private lazy var likeButton = UIButton().then {
        let image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        $0.setImage(image, for: .normal)
        $0.tintColor = .white
    }

    // TODO: 추후 setTitle부분에 변수가 들어가야함
    private let buyButton = UIButton().then {
        $0.setTitle("33000원에 살게요", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .mainYellow
        $0.layer.cornerRadius = 15
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
    }

    // layout
    override func render() {
        //baseScroll
        view.addSubview(baseScrollView)
        baseScrollView.addSubview(baseScrollContentView)

        //baseScrollContentView
        baseScrollContentView.addSubviews(imageScrollView, pageControl, bottomUIView)

        //imageScrollView
        imageScrollView.snp.makeConstraints {
            $0.height.equalTo(300)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top)
        }

        //pageControl
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(imageScrollView.snp.bottom).inset(15)
            $0.height.equalTo(50)
            $0.width.equalTo(300)
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

    private func setFunctionAndDelegate() {

        //addTarget
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(didPressBuyButton(_:)), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)

        //set delegate
        imageScrollView.delegate = self
    }

    private func configureScrollView() {
        for pageIndex in 0..<images.count {
            let imageView = UIImageView()
            let xPositionOrigin = self.view.frame.width * CGFloat(pageIndex)
            imageView.frame = CGRect(x: xPositionOrigin, y: 0, width: view.bounds.width, height: 300)
            imageView.backgroundColor = .orange
            imageView.image = images[pageIndex]
            imageScrollView.addSubview(imageView)
            imageScrollView.contentSize.width = imageView.frame.width * CGFloat(pageIndex+1)
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

    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        imageScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
}

//delegate
extension ItemTappedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let size = scrollView.contentOffset.x / scrollView.frame.size.width
        selectedPage(Int(round(size)))
    }
}



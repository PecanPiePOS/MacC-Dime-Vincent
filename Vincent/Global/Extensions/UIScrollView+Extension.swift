//
//  UIScrollView+Extension.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/14.
//
import UIKit

extension UIScrollView {
    func updatedContentSizeHeight() -> CGFloat {
        let calculatedRect = CalculateSubviewsHeight(view: self)
        return calculatedRect.height
    }

    private func CalculateSubviewsHeight(view: UIView) -> CGRect {
        var totalRect: CGRect = .zero

        // 모든 자식 View의 컨트롤의 크기를 재귀적으로 호출하며 최종 영역의 크기를 설정
        for subView in view.subviews {
            totalRect = totalRect.union(CalculateSubviewsHeight(view: subView))
        }
        return totalRect.union(view.frame)
    }
}

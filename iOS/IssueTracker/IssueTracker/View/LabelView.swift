//
//  Label.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

final class LabelView: UILabel {
    
    @IBInspectable private var paddingLeft: CGFloat = Metric.paddingLeft
    @IBInspectable private var paddingRight: CGFloat = Metric.paddingRight
    @IBInspectable private var paddingTop: CGFloat = Metric.paddingTop
    @IBInspectable private var paddingBottom: CGFloat = Metric.paddingBottom
    
    static func create(text: String, color: UIColor) -> LabelView {
        let label = LabelView()
        label.text = text
        label.backgroundColor = color
        label.clipsToBounds = true
        label.cornerRadius = Metric.cornerRadius
        label.font = label.font.withSize(Metric.fontSize)
        return label
    }
    
    private var padding: UIEdgeInsets {
        UIEdgeInsets(top: paddingTop, left: paddingLeft, bottom: paddingBottom, right: paddingRight)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        return self.size(with: padding, current: superContentSize)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        return self.size(with: padding, current: superSizeThatFits)
    }
    
    private func size(with padding: UIEdgeInsets, current size: CGSize) -> CGSize {
        let width = size.width + padding.left + padding.right
        let heigth = size.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}

@IBDesignable
extension LabelView {
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

private extension LabelView {
    enum Metric {
        static let paddingLeft: CGFloat = 7
        static let paddingRight: CGFloat = 7
        static let paddingTop: CGFloat = 2
        static let paddingBottom: CGFloat = 2
        static let cornerRadius: CGFloat = 8
        static let fontSize: CGFloat = 14
    }
}

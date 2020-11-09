//
//  Extension.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

extension Array {
    subscript (safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}

extension NSObject {
    var typeName: String {
        String(describing: type(of: self))
    }
}

extension UIView {
    var viewFromNib: UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: typeName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureNib() {
        guard let view = viewFromNib else { return }
        view.frame = bounds
        addSubview(view)
    }
}

extension UIView {
    func setConstraintToFit(at view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

extension UIView {
    func configureTapGesture(target: Any?, action: Selector? = nil) {
        let tapGestureRecognizer =
            UITapGestureRecognizer(target: target, action: action)
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.isEnabled = true
        tapGestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(tapGestureRecognizer)
    }
}

extension String {
    var color: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else { return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }

        let a, r, g, b: Int32
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }

        return UIColor(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
}

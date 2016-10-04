//
//  CustomView.swift
//  CustomViewSample
//
//  Created by imagepit on 2016/10/04.
//  Copyright © 2016年 imagepit. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBOutlet weak var aView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadXib()
    }
    
    // 初期化
    fileprivate func loadXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: bindings))
    }
    
    // Xib読み込み時に呼ばれる（ViewControllerのviewDidLoad的なもの）
    override func awakeFromNib() {
        print("awakeFromNib")
    }
    
    // AutoLayoutなどサブビューのレイアウト適用後に呼ばれる
    override func layoutSubviews() {
        print("layoutSubviews")
    }
}

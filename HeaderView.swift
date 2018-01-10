import Foundation
import UIKit

@IBDesignable
open class HeaderView: UIView {
    
    static func view(_ vc: UIViewController) -> HeaderView? {
        if let headerView = vc.view.viewWithTag(HeaderView.Constant.tagValue) as? HeaderView {
            return headerView
        }
        return nil
    }
    
    struct Constant {
        static let tagValue = 123321
    }
    
    var titleButton : UIButton = UIButton()
    var leftButton : UIButton?
    var rightButton : UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    @IBInspectable
    public var textColor: UIColor? {
        didSet {
            titleButton.setTitleColor(textColor, for: .normal)
            leftButton?.setTitleColor(textColor, for: .normal)
            rightButton?.setTitleColor(textColor, for: .normal)
        }
    }
    
    @IBInspectable
    public var backColor: UIColor? {
        didSet {
            self.backgroundColor = backColor
        }
    }
    
    var bottomMargin: CGFloat {
        return 7
    }
    
    var sideMargin: CGFloat {
        return 18
    }
    
    @IBInspectable
    public var titleText: String? {
        didSet {
            titleButton.setTitle(titleText, for: .normal)
        }
    }
    
    @IBInspectable
    public var leftText: String? {
        didSet {
            leftButton?.isHidden = false
            leftButton?.setTitle(leftText, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightText: String? {
        didSet {
            rightButton?.isHidden = false
            rightButton?.setTitle(rightText, for: .normal)
        }
    }
    
    @IBInspectable
    public var titleImage: UIImage? {
        didSet {
            titleButton.setTitle("", for: .normal)
            titleButton.setImage(titleImage, for: .normal)
        }
    }
    
    @IBInspectable
    public var leftImage: UIImage? {
        didSet {
            leftButton?.isHidden = false
            leftButton?.setTitle("", for: .normal)
            leftButton?.setImage(leftImage, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightImage: UIImage? {
        didSet {
            rightButton?.isHidden = false
            rightButton?.setTitle("", for: .normal)
            rightButton?.setImage(rightImage, for: .normal)
        }
    }
    
    //Setup
    func setupSubviews() {
        
        self.tag = Constant.tagValue
        
        titleButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        titleButton.isUserInteractionEnabled = false
        titleButton.setTitleColor(UIColor.white, for: .normal)
        titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        titleButton.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        titleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0)
        titleButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        addSubview(titleButton)
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        titleButton.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 753), for: .horizontal)
        titleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomMargin).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addLeftButton()
        addRightButton()
        
        backColor = UIColor.brown
        textColor = UIColor.white
    }
    
    func addLeftButton() {
        leftButton = UIButton()
        leftButton?.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        leftButton?.setTitleColor(UIColor.white, for: .normal)
        leftButton?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        leftButton?.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        leftButton?.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        leftButton?.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        leftButton?.isHidden = true
        addSubview(leftButton!)
        
        leftButton?.translatesAutoresizingMaskIntoConstraints = false
        leftButton?.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
        leftButton?.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 752), for: .horizontal)
        leftButton?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideMargin).isActive = true
        leftButton?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomMargin).isActive = true
        leftButton?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        leftButton?.widthAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        leftButton?.trailingAnchor.constraint(greaterThanOrEqualTo: titleButton.leadingAnchor, constant: -5).isActive = true
    }
    
    func addRightButton() {
        rightButton = UIButton()
        rightButton?.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        rightButton?.setTitleColor(UIColor.white, for: .normal)
        rightButton?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        rightButton?.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        rightButton?.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        rightButton?.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        rightButton?.isHidden = true
        addSubview(rightButton!)
        
        rightButton?.translatesAutoresizingMaskIntoConstraints = false
        rightButton?.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        rightButton?.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        rightButton?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideMargin).isActive = true
        rightButton?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomMargin).isActive = true
        rightButton?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        rightButton?.widthAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        rightButton?.leadingAnchor.constraint(greaterThanOrEqualTo: titleButton.trailingAnchor, constant: 5).isActive = true
    }
    
}

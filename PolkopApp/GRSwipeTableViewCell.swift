//
//  GRSwipeTableViewCell.swift
//  Eracoin App
//
//  Created by Marcel Mierzejewski 27.04.2017
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit

class GRSwipeTableViewCell: BaseTableViewCell {
    
    private let rightBtn1 = UIButton.init()
    private let rightBtn2 = UIButton.init()
    
    var rightButtons: [GRSwipeButton] = [] {
        didSet{
            
            if self.rightButtons.count > 0{
                self.rightBtn1.setImage(self.rightButtons[0].image, for: UIControlState.normal)
                self.rightBtn1.backgroundColor = self.rightButtons[0].color
            }
            
            if self.rightButtons.count > 1{
                self.rightBtn2.setImage(self.rightButtons[1].image, for: UIControlState.normal)
                self.rightBtn2.backgroundColor = self.rightButtons[1].color
            }
            
            if self.rightButtons.count > 2 {
                fatalError("GRSwipeTableViewCell can handle only two buttons!")
            }
            
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.swipeCell(pan:)))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
        
        self.rightBtn1.translatesAutoresizingMaskIntoConstraints = false
        self.rightBtn1.tag = 0
        self.rightBtn1.addTarget(self, action: #selector(self.rightButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        self.addSubview(self.rightBtn1)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.rightBtn1,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.rightBtn1,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.rightBtn1,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 0.65,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.rightBtn1,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
        
        self.rightBtn2.translatesAutoresizingMaskIntoConstraints = false
        self.rightBtn2.tag = 1
        self.rightBtn2.addTarget(self, action: #selector(self.rightButtonAction(sender:)), for: UIControlEvents.touchUpInside)
        self.insertSubview(self.rightBtn2, aboveSubview: self.rightBtn1)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.rightBtn2,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.rightBtn2,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.rightBtn2,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 0.6,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.rightBtn2,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
    }
    
    func swipeCell(pan: UIPanGestureRecognizer){
        
        if self.rightButtons.count == 0 {
            return
        }
        
        let translationX = pan.translation(in: self).x
        
        switch pan.state {
        case .began:
            
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.init(translationX: translationX, y: 0)
                self.rightBtn2.transform = CGAffineTransform.init(translationX: -translationX * 0.5, y: 0)
            })
            return
            
        case .changed:
            if abs(translationX) < 2.0 {
                return
            }
            
            if let tableView = self.superview?.superview as? UITableView{
                if tableView.isDragging || tableView.isDecelerating{
                    pan.isEnabled = false
                    pan.isEnabled = true
                    self.transform = CGAffineTransform.init(translationX: 0, y: 0)
                    self.rightBtn2.transform = CGAffineTransform.init(translationX: 0, y: 0)
                    return
                }
            }
            
            let buttonWidth = self.frame.height * 0.6
            if translationX > 15 {
                return
            }
            if -translationX > CGFloat(self.rightButtons.count) * buttonWidth{
                return
            }
            
            self.transform = CGAffineTransform.init(translationX: translationX, y: 0)
            self.rightBtn2.transform = CGAffineTransform.init(translationX: -translationX * 0.5, y: 0)
            
            return
            
        default:
            
            let buttonWidth = self.frame.height * 0.6
            let fullWidth = CGFloat(self.rightButtons.count) * buttonWidth
            let halfButtonsWidth = fullWidth * 0.5
            
            UIView.animate(withDuration: 0.15, animations: {
                if -translationX + halfButtonsWidth > fullWidth{
                    self.transform = CGAffineTransform.init(translationX: -fullWidth, y: 0)
                    self.rightBtn2.transform = CGAffineTransform.init(translationX: buttonWidth, y: 0)
                }else{
                    self.transform = CGAffineTransform.init(translationX: 0, y: 0)
                    self.rightBtn2.transform = CGAffineTransform.init(translationX: 0, y: 0)
                }
            })
            
            return
        }
    }
    
    func rightButtonAction(sender: UIButton){
        if self.rightButtons.count > sender.tag{
            UIView.animate(withDuration: 0.15, animations: {
                self.transform = CGAffineTransform.init(translationX: 0, y: 0)
                self.rightBtn2.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }){ (_) in
                if let function = self.rightButtons[sender.tag].function{
                    function()
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        for subview in self.subviews.reversed(){
            if subview.frame.contains(point){
                return subview
            }
        }
        
        return super.hitTest(point, with: event)
    }
    
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard
            let pan = gestureRecognizer as? UIPanGestureRecognizer,
            let x = pan.view?.transform.tx
            else {
                return true
        }
        
        return x < CGFloat.init(5.0) && -x < CGFloat.init(5.0)
    }
    
    override func prepareForReuse() {
        
        self.transform = CGAffineTransform.init(translationX: 0, y: 0)
        self.rightBtn2.transform = CGAffineTransform.init(translationX: 0, y: 0)
    }
}

struct GRSwipeButton {
    
    var color: UIColor
    var image: UIImage
    var function: (()->Void)?
    
    init(color: UIColor, image: UIImage, function: (()->Void)?) {
        self.color = color
        self.image = image
        self.function = function
    }
}

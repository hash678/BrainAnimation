//
//  FillAnimationView.swift
//  BrainAnimation
//
//  Created by Hassan Abbasi on 26/05/2020.
//  Copyright © 2020 Hassan Abbasi. All rights reserved.
//

import Foundation
import UIKit


class FillAnimationView:UIView{
    
    var fillColor:UIColor = UIColor(red: 0.9882352941, green: 0.6941176471, blue: 0.0862745098, alpha: 1){
        didSet{
            fronImage.tintColor = fillColor
        }
    }
    var traceColor:UIColor = UIColor(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1){
        didSet{
            bgImage.tintColor = traceColor
        }
    }
    var animationDuration:Double = 5
    
    fileprivate var image:UIImage?
    fileprivate var height:CGFloat!
    fileprivate var currentVal:CGFloat!

    fileprivate lazy var bgImage:UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFit
        i.tintColor = traceColor
        return i
    }()
    
    
    fileprivate lazy var fronImage:UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFit
        i.tintColor = fillColor
        return i
    }()
    
    
    
    func setImage(_ image:UIImage){
          bgImage.image = image.withRenderingMode(.alwaysTemplate)
          fronImage.image = image.withRenderingMode(.alwaysTemplate)
      }
    
    func animateView(){
        UIView.animate(withDuration: animationDuration) {
            self.fronImage.mask?.transform = .identity
            
        }
    }
    
    func setValue(_ val:CGFloat){
        if val < 0 || val > 1 {
            fatalError("Please enter a value between 0 and 1")
        }
        
        height = height ?? self.frame.height
        currentVal = currentVal ?? self.frame.height
        currentVal -= val*height
       
        
        
        UIView.animate(withDuration: animationDuration) {
            self.fronImage.mask?.transform = CGAffineTransform(translationX: 0, y: self.currentVal)
            
        }
        
        
    }
    
    
    convenience init(size:CGSize, image:UIImage? = nil){
        self.init(frame: .zero,image:image)
        self.image = image
        
        if self.frame.height == 0 {
            currentVal = size.height}
        height = size.height
        setupViews()
    }
    init(frame: CGRect, image:UIImage? = nil) {
        super.init(frame: frame)
        self.image = image
        
        if self.frame.height == 0 {
        currentVal =  currentVal ?? frame.height
        }
        height = height ?? frame.height
        setupViews()
    }
    
    required init?(coder: NSCoder) {
          super.init(coder: coder)

    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
        setupViews()
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         setupMask()
     }

    
    
    fileprivate func setupViews(){
        self.addSubview(bgImage)
        if let image = self.image{
            setImage(image)
        }
        bgImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bgImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bgImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        self.addSubview(fronImage)
        fronImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        fronImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        fronImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        fronImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
       
        
    }
    fileprivate func setupMask(){
           currentVal = currentVal ?? self.frame.height
           
           let maskView = UIView(frame: CGRect(x: 0, y: 0, width: fronImage.frame.width, height: self.frame.height))
                      
           maskView.backgroundColor = fillColor
           maskView.transform = CGAffineTransform(translationX: 0, y: currentVal)
           
           fronImage.mask = maskView
           
       }
 
    
    
   
}


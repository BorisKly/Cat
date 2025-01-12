//
//  Font+.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit

extension UIFont {
 
    static func customFont(weight: UIFont.Weight, size: CGFloat, lineHeight: CGFloat) -> UIFont {
   
        let fontName = "Nunito Sans"

        guard let font = UIFont(name: fontName, size: size) else {
            print("error: extension to Font+")
            return UIFont.systemFont(ofSize: size)
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight - size
        paragraphStyle.lineHeightMultiple = 1.2
        
        let fontDescriptor = font.fontDescriptor
         .addingAttributes([UIFontDescriptor.AttributeName.traits: [
            UIFontDescriptor.TraitKey.weight: weight
        ]])
        
        return UIFont(descriptor: fontDescriptor, size: size)
    }
    
}



//
//  PopMeme2.0.swift
//  Meme1.0
//
//  Created by Manish raj(MR) on 11/10/21.
//

import Foundation
import UIKit

struct PopMeme2{
    
    let originalImage:UIImage?
    let fullmemeImage:UIImage?
    let upperText:String?
    let bottomText:String?
    
}

extension PopMeme2 {
    
    static var memelist : [PopMeme2] = [PopMeme2]()
       
    static func append(meme:PopMeme2) {
       
           memelist.append(meme)
        
}
    
}

//
//  UiImageViewExt.swift
//  DisneyX
//
//  Created by Kakyire on 07/07/2022.
//
import UIKit

extension UIImageView{
    
    func load(urlAddress address:String){
        
        guard let url = URL(string: address) else { return  }
        
        DispatchQueue.main.async {[weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    self?.image = image
                    
                }
            }
        }
    }
}

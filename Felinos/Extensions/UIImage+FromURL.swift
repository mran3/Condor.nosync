//
//  UIImage+FromURL.swift
//  Felinos
//
//  Copyright © 2020 Andrés A. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL, success: @escaping (UIImage)->Void) {
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let remoteImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        //myImage = remoteImage
                        self?.image = remoteImage
                        success(remoteImage)
                    }
                }
            }
        }
    }
}


extension UIImage {
    func load(url: URL, success: @escaping (UIImage)->Void) {
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let remoteImage = UIImage(data: data) {
                    DispatchQueue.main.async {                        success(remoteImage)
                    }
                }
            }
        }
    }
}

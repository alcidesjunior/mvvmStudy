//
//  UIImageView+LoadImage.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit
extension UIImageView {
    func load(url: URL, _ completion: @escaping ((_ errorMessage: String?) -> Void)) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                        completion(nil)
                    }
                }
            }
        }
    }
}

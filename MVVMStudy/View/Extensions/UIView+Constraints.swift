//
//  UIView+Constraints.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit

extension UIView{
    /// This function set a padding from top based on topAnchor
    ///- Set padding and from params if you need
    /// - Parameters:
    ///    - padding: CGFloat default value 0
    ///    - from: NSLayoutAnchor default value nil
    @discardableResult
    func magicTop(_ padding:CGFloat = 0, _ from:NSLayoutYAxisAnchor? = nil) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        if from == nil {
           topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        }else{
            if let from = from{
               topAnchor.constraint(equalTo: from, constant: padding).isActive = true
            }
        }
        
        return self
    }
    /// This function set a padding for leading based on leadingAnchor
    ///- Set padding and from params if you need
    /// - Parameters:
    ///    - padding: CGFloat default value 0
    ///    - from: NSLayoutXAxisAnchor default value nil
    @discardableResult
    func magicLeading(_ padding:CGFloat = 0, _ from:NSLayoutXAxisAnchor? = nil) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if from == nil {
            leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
            
        }else{
            if let from = from{
                leadingAnchor.constraint(equalTo: from, constant: padding).isActive = true
            }
        }
        
        return self
    }
    /// This function set a padding for trailing based on trailingAnchor
    ///- Set padding and from params if you need
    /// - Parameters:
    ///    - padding: CGFloat default value 0
    ///    - from: NSLayoutXAxisAnchor default value nil
    @discardableResult
    func magicTrailing(_ padding:CGFloat = 0, _ from:NSLayoutXAxisAnchor? = nil) -> Self{
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if from == nil {
            trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        }else{
            if let from = from{
                trailingAnchor.constraint(equalTo: from, constant: -padding).isActive = true
            }
        }
        
        return self
    }
    /// This function set a padding from bottom based on bottomAnchor
    ///- Set padding and from params if you need
    /// - Parameters:
    ///    - padding: CGFloat default value 0
    ///    - from: NSLayoutYAxisAnchor default value nil
    @discardableResult
    func magicBottom(_ padding:CGFloat = 0, _ from:NSLayoutYAxisAnchor? = nil) -> Self{
        translatesAutoresizingMaskIntoConstraints = false
        
        if from == nil {
            bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
            
        }else{
            if let from = from{
                bottomAnchor.constraint(equalTo: from, constant: -padding).isActive = true
            }
        }
        
        return self
    }
    /// This function set a padding from centerX based on safeAreaLayoutGuide centerXAnchor
    ///- Set padding and from params if you need
    /// - Parameters:
    ///    - padding: CGFloat default value 0
    ///    - from: NSLayoutYAxisAnchor default value nil
    @discardableResult
    func magicCenterX(_ padding:CGFloat = 0, _ from:NSLayoutXAxisAnchor? = nil) -> Self{
        translatesAutoresizingMaskIntoConstraints = false
        if from == nil {
            centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: padding).isActive = true
        }else{
            if let from = from{
                centerXAnchor.constraint(equalTo: from, constant: padding).isActive = true
            }
        }
        
        return self
    }
    /// This function set a padding from centerX based on safeAreaLayoutGuide centerYAnchor
    ///- Set padding and from params if you need
    /// - Parameters:
    ///    - padding: CGFloat default value 0
    ///    - from: NSLayoutYAxisAnchor default value nil
    @discardableResult
    func magicCenterY(_ padding:CGFloat = 0, _ from:NSLayoutYAxisAnchor? = nil) -> Self{
        translatesAutoresizingMaskIntoConstraints = false
        if from == nil {
            centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: padding).isActive = true
        }else{
            if let from = from{
                centerYAnchor.constraint(equalTo: from, constant: padding).isActive = true
            }
        }
        
        return self
    }
    /// This function set a value for height
    /// - Parameters:
    ///    - height: CGFloat default value 0
    @discardableResult
    func magicHeight(_ height :CGFloat = 0) -> Self{
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    /// This function set a value for width
    /// - Parameters:
    ///    - width: CGFloat default value 0
    @discardableResult
    func magicWidth(_ width :CGFloat = 0) -> Self{
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
}

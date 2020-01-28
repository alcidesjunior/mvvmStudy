//
//  MoviesView.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit

final class MoviesView: UIView{
    
    let cellID = "cell"
    
    lazy var movieTableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = .tertiarySystemFill
        view.rowHeight = 450
        return view
    }()
    
    func registerCells(){
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: self.cellID)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoviesView: ViewCode{
    func buildViewHierarchy() {
        addSubview(movieTableView)
    }
    
    fileprivate func setupTableViewConstraints(){
            movieTableView
                .magicTop(LayoutSettings.TableSettings.top,
                          safeAreaLayoutGuide.topAnchor)
                .magicLeading(LayoutSettings.TableSettings.leading,
                              safeAreaLayoutGuide.leadingAnchor)
                .magicTrailing(LayoutSettings.TableSettings.trailing,
                               safeAreaLayoutGuide.trailingAnchor)
                .magicBottom(LayoutSettings.TableSettings.bottom,
                             safeAreaLayoutGuide.bottomAnchor)
    }
    
    
    func setupConstraints() {
        setupTableViewConstraints()
    }
    
    func setupAdditionalConfiguration() {
        registerCells()
    }
    
    
}

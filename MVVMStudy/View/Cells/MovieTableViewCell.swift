//
//  MovieTableViewCell.swift
//  MVVMStudy
//
//  Created by Alcides Junior on 25/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    func setup(moviesResult: MovieCellViewModel){
        self.movieTitle.text = moviesResult.labelValue()
        
        self.movieImageView.load(url: moviesResult.imageURL()) { _ in
            print("imagem carregada")
        }
    }
    
    lazy var movieImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    lazy var movieTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 30)
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func setupImageViewConstraints(){
            //setting imageView
            movieImageView
                .magicTop(LayoutSettings.ImageSettings.top, safeAreaLayoutGuide.topAnchor)
                .magicLeading(LayoutSettings.ImageSettings.leading, safeAreaLayoutGuide.leadingAnchor)
                .magicTrailing(LayoutSettings.ImageSettings.trailing, safeAreaLayoutGuide.trailingAnchor)
                .magicHeight(400)
    }
    
    fileprivate func setupTitleViewConstraints(){
        movieTitle
            .magicTop(LayoutSettings.TitleSettings.top, movieImageView.bottomAnchor)
            .magicLeading(LayoutSettings.TitleSettings.leading, safeAreaLayoutGuide.leadingAnchor)
            .magicTrailing(LayoutSettings.TitleSettings.trailing, safeAreaLayoutGuide.trailingAnchor)
    }
    
    fileprivate func setupElements(){
        [movieImageView, movieTitle].forEach {
            addSubview($0)
        }
        setupImageViewConstraints()
        setupTitleViewConstraints()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

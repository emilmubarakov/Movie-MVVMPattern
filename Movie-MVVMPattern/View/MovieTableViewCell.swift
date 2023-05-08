//
//  MovieTableViewCell.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 08.05.2023.
//

import UIKit
import SnapKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MovieTableViewCell"
        }
    }
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let movieYearLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        configureUI()
    }
    
    func configureUI() {
        self.addSubview(movieImageView)
        movieImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(10)
            make.height.equalTo(160)
            make.width.equalTo(90)
        }
        
        self.addSubview(movieTitleLabel)
        movieTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieImageView.snp_trailingMargin).inset(-20)
            make.top.equalTo(movieImageView.snp_topMargin)
        }
        
        self.addSubview(movieYearLabel)
        movieYearLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieImageView.snp_trailingMargin).inset(-20)
            make.bottom.equalTo(movieImageView.snp_bottomMargin)
        }
    }
    
    func setUpCell(viewModel: MovieTableCellViewModel) {
        self.movieImageView.sd_setImage(with: URL(string: viewModel.poster))
        self.movieTitleLabel.text = viewModel.title
        print(viewModel.title)
        self.movieYearLabel.text = String(viewModel.year.prefix(4))
        
    }

}

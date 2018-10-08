//
//  ZQEpisodeListTableViewCell.swift
//  ZQNews
//
//  Created by zhengzeqin on 2018/9/26.
//  Copyright © 2018年 zhengzeqin. All rights reserved.
//

import UIKit
import Kingfisher
class ZQEpisodeListTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var model: ZQEpisodeListModel?{
        didSet{
            dealModel()
        }
    }

}

extension ZQEpisodeListTableViewCell{
    func dealModel() {
        self.titleLabel.text = model?.text ?? ""
        let url = URL(string: model?.bimageuri ?? "")
        if let url = url {
            self.imgView.kf.setImage(with: ImageResource(downloadURL: url), placeholder: UIImage(named: "test"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        self.timeLabel.text = model?.created_at ?? ""
    }
}

//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by HEIBEI KATO on 2017/02/10.
//  Copyright © 2017年 DT.Products. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCommentText: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var viewComment: UIView!
    @IBOutlet weak var txtCommentName: UITextField!
    @IBOutlet weak var txtComment: UITextField!

    
    @IBAction func setComment(_ sender: Any) {
        
        self.viewComment.isHidden=true
        
    }
    
    
    @IBAction func btnComment(_ sender: Any) {

        self.viewComment.isHidden=false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        self.viewComment.isHidden=true
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        self.lblCommentText.text = "\(postData.comment)"
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
    }
    
}
//
//  CommentViewController.swift
//  Instagram
//
//  Created by HEIBEI KATO on 2017/02/14.
//  Copyright © 2017年 DT.Products. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CommentViewController: UIViewController, UITextFieldDelegate {

    var postData:PostData!


    @IBOutlet weak var sendName: UITextField!
    @IBOutlet weak var sendComment: UITextField!
    @IBOutlet weak var sendContents: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        sendName.delegate = self
        sendComment.delegate=self
        // Do any additional setup after loading the view.
        sendName.text = postData.name!
    }

    @IBAction func entryComment(_ sender: Any) {

        postData.comment += ["> \(sendName.text!):\(sendComment.text!)"]
//        print("\(postData.comment)")
        
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comment": postData.comment]
        postRef.updateChildValues(comments)
        // 画面を閉じてViewControllerに戻る
        self.dismiss(animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func getName(_ sender: Any) {
        
    }

    @IBAction func getComment(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

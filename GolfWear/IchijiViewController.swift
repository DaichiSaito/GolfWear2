//
//  IchijiViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/09.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class IchijiViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var uploadImage: UIImageView!
    
    @IBAction func cameraBtn(_ sender: Any) {
        
        self.pickImageFromCamera()
    }

    @IBAction func camerarollBtn(_ sender: Any) {
        
        self.pickImageFromLibrary()
    }
    @IBAction func uploadBtn(_ sender: Any) {
        
        var param1 = [
            "image" : self.uploadImage
            ] as Dictionary<String, AnyObject>
        
        UploadImageVM().myImageUploadRequest(param1: param1)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /* ライブラリから写真を選択する */
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.photoLibrary
            controller.allowsEditing = true
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    /* カメラで撮影 */
    func pickImageFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.camera
            controller.allowsEditing = true
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    /* 写真を選択した時に呼ばれる */
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
//        let uploadImageVC = self.storyboard!.instantiateViewControllerWithIdentifier( "uploadImageVC" ) as! UploadImageVC
        var image = info[UIImagePickerControllerEditedImage] as! UIImage
        image = CommonUtl.resizeImage(src: image)
        uploadImage.image = image
        
//        uploadImageVC.imageView = image
//        self.navigationController?.pushViewController(uploadImageVC, animated: true)
//        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            uploadImage.contentMode = .scaleAspectFit
//            image = CommonUtl.resizeImage(src: image)
            uploadImage.image = CommonUtl.resizeImage(src: pickedImage)
            
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
//        label.text = "Tap the [Save] to save a picture"
        
    }

}

//
//  UploadImageVM.swift
//  NailApp_Refactoring
//
//  Created by DaichiSaito on 2016/05/04.
//  Copyright © 2016年 DaichiSaito. All rights reserved.
//

import UIKit
//import NCMB
class UploadImageVM: NSObject {
    dynamic var uploadDoneFlg = false
    var uploadDoneFlgTmp1 = false
    var uploadDoneFlgTmp2 = false
    
    //画像のアップロード処理
    func myImageUploadRequest(param1: Dictionary<String, AnyObject>) {
        //myUrlには自分で用意したphpファイルのアドレスを入れる
        let myUrl = NSURL(string: URL_UPLOAD_IMAGES_PHP)
        let request = NSMutableURLRequest(url:myUrl! as URL)
        request.httpMethod = "POST"
        
        // ログイン中のユーザーの取得
//        let currentUser = NCMBUser.currentUser()
//        let userName = currentUser.userName
        let time:Int = Int(NSDate().timeIntervalSince1970)
        print(time)
        //下記のパラメータはあくまでもPOSTの例
        let param = [
            "userName" : "testName",
            "fileName" : "testName" + String(time)
        ]
        let boundary = generateBoundaryString()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let imageData = UIImageJPEGRepresentation(param1["image"]!.image!!, 1)
        if(imageData==nil) { return; }
        request.httpBody = createBodyWithParameters(parameters: param, filePathKey: "file", imageDataKey: imageData! as NSData, boundary: boundary) as Data
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
                print("error=\(error)")
                self.uploadDoneFlg = true
                return
            }
            // リクエストを出力
            print("******* resquest = \(request)")
            // レスポンスを出力
            print("******* response = \(response)")
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("****** response data = \(responseString!)")
            DispatchQueue.main.async(execute: {
                print("アップロード完了")
                if (self.uploadDoneFlgTmp2) {
                    print("どっちもアップロード完了したぜ1")
                    self.uploadDoneFlg = true
                } else {
                    print("画像がアップロードまでできてないぜ")
                    self.uploadDoneFlgTmp1 = true
                }
            });
        }
        task.resume()
        
        // niftyにもあげないと
        // imageコレクションも更新
        let objImage: NCMBObject = NCMBObject(className: "WEARIMAGE")
//        objImage.setObject(userName!, forKey: "userName")
        objImage.setObject(URL_UPLOAD_IMAGES_NIFTY + "testName" + String(time) + ".jpg", forKey: "imagePath")
//        objImage.setObject(param1["commentTextView"]!, forKey: "comment")
//        objImage.setObject(0, forKey: "kawaiine")
//        objImage.setObject(param1["typeLength"]!, forKey: "typeLength")
//        objImage.setObject(param1["typeColor"]!, forKey: "typeColor")
//        objImage.setObject(param1["typeScene"]!, forKey: "typeScene")
//        objImage.setObject(param1["typeDesign"]!, forKey: "typeDesign")
//        objImage.setObject(param1["typeTaste"]!, forKey: "typeTaste")
//        objImage.setObject(param1["typeGenre"]!, forKey: "typeGenre")
//        objImage.setObject(NCMBUser.currentUser(), forKey: "userPointer")
//        if (param1["salonPointer"] != nil) {
//            objImage.setObject(param1["salonPointer"]!, forKey: "salonPointer")
//        }
        objImage.saveInBackground { (error: Error?) -> Void in
            if let e = error {
                // 端末情報の登録が失敗した場合の処理
//                print(e.description)
//                if (e.code == 409001){
//                    // 失敗した原因がdeviceTokenの重複だった場合
//                    //                    self.updateExistInstallation(installation)
//                } else {
//                    // deviceTokenの重複以外のエラーが返ってきた場合
//                }
            }
            if (self.uploadDoneFlgTmp1) {
                print("どっちもアップロードしたぜ2")
                self.uploadDoneFlg = true
            } else {
                print("niftyのほうがまだだぜ")
                self.uploadDoneFlgTmp2 = true
            }
        }
    }
    
    //画像のアップロード処理
//    func mySalonImageUploadRequest(param1: Dictionary<String, AnyObject>) {
//        //myUrlには自分で用意したphpファイルのアドレスを入れる
//        let myUrl = NSURL(string: urlUploadSalonImagePhp)
//        let request = NSMutableURLRequest(URL:myUrl!)
//        request.HTTPMethod = "POST"
//        
//        // ログイン中のユーザーの取得
//        let currentUser = NCMBUser.currentUser()
//        let userName = currentUser.userName
//        let time:Int = Int(NSDate().timeIntervalSince1970)
//        //下記のパラメータはあくまでもPOSTの例
//        let param = [
//            "userName" : userName!,
//            "fileName" : userName + String(time)
//        ]
//        let boundary = generateBoundaryString()
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        let imageData = UIImageJPEGRepresentation(param1["image"]! as! UIImage, 1)
//        if(imageData==nil) { return; }
//        request.HTTPBody = createBodyWithParameters(param, filePathKey: "file", imageDataKey: imageData!, boundary: boundary)
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//            data, response, error in
//            if error != nil {
//                print("error=\(error)")
//                self.uploadDoneFlg = true
//                return
//            }
//            // リクエストを出力
//            print("******* resquest = \(request)")
//            // レスポンスを出力
//            print("******* response = \(response)")
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("****** response data = \(responseString!)")
//            dispatch_async(dispatch_get_main_queue(),{
//                print("アップロード完了")
//                if (self.uploadDoneFlgTmp2) {
//                    print("どっちもアップロード完了したぜ1")
//                    //                    self.uploadDoneFlgTmp1 = true
//                    self.uploadDoneFlg = true
//                } else {
//                    print("画像がアップロードまでできてないぜ")
//                    self.uploadDoneFlgTmp1 = true
//                }
//            });
//        }
//        task.resume()
//        
//        // niftyにもあげないと
//        // imageコレクションも更新
//        let objImage: NCMBObject = NCMBObject(className: "salonImage")
//        objImage.setObject(userName!, forKey: "userName")
//        objImage.setObject(urlUploadSalonImagesLocation + userName + String(time) + ".jpg", forKey: "imagePath")
//        objImage.setObject(param1["salonPointer"], forKey: "salonPointer")
//        objImage.saveInBackgroundWithBlock { (error: NSError?) -> Void in
//            if let e = error {
//                // 端末情報の登録が失敗した場合の処理
//                print(e.description)
//                if (e.code == 409001){
//                    // 失敗した原因がdeviceTokenの重複だった場合
//                    //                    self.updateExistInstallation(installation)
//                } else {
//                    // deviceTokenの重複以外のエラーが返ってきた場合
//                }
//            }
//            if (self.uploadDoneFlgTmp1) {
//                print("どっちもアップロードしたぜ2")
//                //                self.uploadDoneFlgTmp2 = true
//                self.uploadDoneFlg = true
//            } else {
//                print("niftyのほうがまだだぜ")
//                self.uploadDoneFlgTmp2 = true
//            }
//        }
//    }
    
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData()
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        let filename = "image(1).jpg"
        let mimetype = "image/jpg"
        body.appendString(string: "--\(boundary)\r\n")
        // filePathKeyという識別しに対応するのがfilenameという変数
        body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
        body.append(imageDataKey as Data)
        body.appendString(string: "\r\n")
        body.appendString(string: "--\(boundary)--\r\n")
        return body
    }
    
    
}

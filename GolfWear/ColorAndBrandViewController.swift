//
//  ColorAndBrandViewController.swift
//  aaaaa
//
//  Created by DaichiSaito on 2017/01/23.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit
import Bond
class ColorAndBrandViewController: UIViewController,UITextFieldDelegate {
    
    var colors = [
        Colors(color: UIColor.white, colorText: "ホワイト系"),
        Colors(color: UIColor.black, colorText: "ブラック系"),
        Colors(color: UIColor.gray, colorText: "グレー系"),
        Colors(color: UIColor.brown, colorText: "ブラウン系"),
        //        Colors(color: UIColor.brown, colorText: "ベージュ系"),
        Colors(color: UIColor.green, colorText: "グリーン系"),
        Colors(color: UIColor.blue, colorText: "ブルー系"),
        Colors(color: UIColor.purple, colorText: "パープル系"),
        Colors(color: UIColor.yellow, colorText: "イエロー系"),
        Colors(color: UIColor.magenta, colorText: "ピンク系"),
        Colors(color: UIColor.red, colorText: "レッド系"),
        Colors(color: UIColor.orange, colorText: "オレンジ系"),
        //        Colors(color: UIColor., colorText: "シルバー系"),
        //        Colors(color: UIColor., colorText: "ゴールド系"),
    ]
    var selectedBrands = [String]()
    var brands = [
        "アイラインゴルフ",
        "アキュディス",
        "アキラプロダクツ",
        "朝日ゴルフ用品",
        "アサヒゴルフヨウヒン",
        "アシックス",
        "アシュワース",
        "AZROF",
        "アズロフ",
        "アダバット",
        "アダムス",
        "アックス",
        "アディダス",
        "アドバイザー",
        "アドミラル",
        "アミノバイタル",
        "アルインコ",
        "アルチビオ",
        "アンスウェイ",
        "アンダーアーマー",
        "アンパスィ",
        "アーノルドパーマー",
        "アーミーベースコレクション",
        "アームスゲイン",
        "イオミック",
        "イオンスポーツ",
        "IZZO",
        "イッゾ",
        "イヴァルブ",
        "ウィン",
        "WINWINSTYLE",
        "ウィンウィンスタイル",
        "ウイダー",
        "ウイルソン",
        "WOSS",
        "ウォズ",
        "ウルフパック",
        "ecco",
        "エコー",
        "STM",
        "エスティーエム",
        "エドウイン",
        "エプソン",
        "MUスポーツ",
        "エムユースポーツ",
        "M.I.T.Inc.",
        "エムアイティインク",
        "MTG",
        "エムティージー",
        "エリートグリップ",
        "エルバランス",
        "ellesse",
        "エレッセ",
        "エーデザインゴルフ",
        "OGIO",
        "オジオ",
        "オデッセイ",
        "オノフ",
        "オリムピック",
        "オロビアンコ",
        "オークリー",
        "オーバカナル",
        "カエデ",
        "カシオ",
        "カステルバジャック",
        "カタナ",
        "カッター＆バック",
        "カッパ",
        "カネカ",
        "カレラ",
        "ガッチャゴルフ",
        "ガーミン",
        "キャスコ",
        "キャロウェイゴルフ",
        "キュアパター",
        "キングカップス",
        "キースノックス",
        "クアルトユナイテッド",
        "クラフツマン",
        "クリオコーポレーション",
        "クリーブランド",
        "クロックス",
        "クロマックス",
        "グラファイトデザイン",
        "グレッグノーマン",
        "グレナリーゴルフ",
        "グローブライド",
        "ケイト・スペードニューヨーク",
        "ケースイス",
        "コブラ",
        "コモコーメ",
        "コラントッテ",
        "コンバース",
        "コンバー",
        "コンフィデンス",
        "コールマン",
        "ゴルファーズ",
        "ゴルフジャンキー",
        "ゴルフステーツ",
        "ゴルフソックス36",
        "ゴルフダイジェスト",
        "ゴルフバディー",
        "ゴルフプライド",
        "サイコバニー",
        "サクラゴルフ",
        "サソー",
        "サニーフーズ",
        "サムソナイト",
        "サンマウンテン",
        "サーモス",
        "シェルボ",
        "資生堂",
        "シセイドウ",
        "シダス",
        "ショットナビ",
        "シーガル",
        "C3fit",
        "シースリーフィット",
        "CW-X",
        "シーダブリューエックス",
        "J.リンドバーグ",
        "ジェイ．リンドバーグ",
        "ジェフ・バンクス",
        "ジバンシィ",
        "ジミーチュウ",
        "ジャックバニーバイパーリーゲイツ",
        "ジャド",
        "ジャンクレッグ",
        "ジョップ",
        "ジョーンズ",
        "GDOオリジナル",
        "ジーディーオーオリジナル",
        "GPRO",
        "ジープロ",
        "スウサス",
        "スキンズ",
        "スコッティキャメロン",
        "スタンス",
        "ステッチ",
        "スナッグ",
        "スネルゴルフ",
        "スネークアイ",
        "スピングルムーヴ",
        "スポルディング",
        "SWANS",
        "スワンズ",
        "スーパーストローク",
        "セリーヌ",
        "セントクリストファー",
        "ソフトスパイク",
        "ソーコー",
        "ZOY",
        "ゾーイ",
        "タイトリスト",
        "タバタ",
        "Tabio",
        "タビオ",
        "ダイヤゴルフ",
        "ダンスウィズドラゴン",
        "ダンロップ",
        "チャンピオン",
        "チャンプ",
        "チュッセ・ピューミニ",
        "ツアーエッジ",
        "T.P.MILLS",
        "ティー.ピーミルズ",
        "テリック",
        "テーラーメイド",
        "ディメンション",
        "DNS",
        "ディーエヌエス",
        "デサントゴルフ",
        "デュカデルコスマ",
        "デュラフィット",
        "トゥモローカレッジ",
        "トップセブン",
        "トニーノランボルギーニ",
        "飛衛門",
        "トベイモン",
        "トランスコンチネンツ",
        "ドゥルー",
        "Doron",
        "ドロン",
        "ナイキ",
        "ナンバー",
        "NO1グリップ",
        "ナンバーワングリップ",
        "ニコン",
        "ニューエラ",
        "ニューバランス",
        "ハイジー",
        "ハルスポーツプロダクション",
        "バウンスマジック",
        "バシレウス",
        "バッドボーイ",
        "バンカーメンタリティー",
        "バンテリン",
        "バンデル",
        "バートン",
        "パワービルト",
        "パーソンズ",
        "PAR72",
        "パーナナジュウニ",
        "パーフェクトプロ",
        "パーリーゲイツ",
        "ヒューゴ・ボス",
        "広田ゴルフ",
        "ヒロタゴルフ",
        "ヒールクリーク",
        "BETONES",
        "ビトーンズ",
        "ビバハート",
        "BMWGolfsportCollection",
        "ビーエムダブリュー",
        "ピクセラ",
        "ピナクル",
        "PUREGrips",
        "ピュアグリップ",
        "ピレッティ",
        "ピン",
        "ファウンダース",
        "フィッチェゴルフ",
        "フィドラ",
        "フィラ",
        "フェアファクス",
        "フォワードゴルフ",
        "フォーティーン",
        "フジクラ",
        "フットジョイ",
        "フラットゴルフ",
        "フランスベッド",
        "ブッシュネル",
        "ブラック＆ホワイト",
        "ブラッドシフト",
        "ブラッドリー",
        "ブランコ",
        "ブリヂストン",
        "ブリーフィング",
        "プロギア",
        "プーマ",
        "HEAD",
        "ヘッド",
        "ベティナルディ",
        "ベネクス",
        "ベネックス",
        "ホアピリ",
        "本間ゴルフ",
        "ホンマゴルフ",
        "ボイスキャディ",
        "ボスオレンジ",
        "ポリス",
        "ポール・スチュアートスポーツ",
        "ポールスチュアートスポーツ",
        "マイノリティ・コレクション",
        "マイパッケージ",
        "MASA",
        "マサ",
        "マジコスポーツ",
        "マスターバニーエディション",
        "マスダゴルフ",
        "マックスアンドコー",
        "マックスマーラ",
        "マリクレール",
        "マルア",
        "マルマン",
        "マンシングウェア",
        "マークジェイコブス",
        "ミエコウエサコ",
        "ミズノ",
        "ミック",
        "三菱レイヨン",
        "ミツビシレイヨン",
        "ミラ・ショーン",
        "ミラ･ショーン",
        "林八百吉",
        "ヤオキチ",
        "ヤマハ",
        "ユニックス",
        "ユピテル",
        "USTマミヤ",
        "ユーエスティーマミヤ",
        "ヨネックス",
        "ライト",
        "ライバルアンドレベル",
        "ライフ",
        "ライル＆スコット",
        "ラウドマウスゴルフ",
        "ラスティ",
        "ラッセルノ",
        "ラッドスウィンガースポーツ",
        "ラフ&スウェル",
        "ラムキン",
        "ランバンスポール",
        "リガード",
        "リトルノア",
        "リョーマゴルフ",
        "リンクス",
        "Louie's",
        "ルイーズ",
        "ルコックゴルフ",
        "ルーズベルトテディベア",
        "ロアーゴルフ",
        "ロイヤルコレクション",
        "ロサーセン",
        "ロストボール",
        "ロッキーアンドホッパー",
        "ロマロ",
        "ローズ＆ファイア",
        "ワークスゴルフ"
    ]
    
    /* Sectionのタイトル */
    let sectionTitle: NSArray = ["選択中セル", "including"]
    /* ナビゲーションアイテム */
    var myNavigationItem: UINavigationItem!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    dynamic var conditionBrands = [Dictionary<String,Any>]()
//    dynamic var conditionBrands = Dictionary<String,String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.tableView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelection = true
        self.textField.delegate = self
//        self.myNavigationItem.rightBarButtonItem!.title = "決定"
        let rightButtonItem:UIBarButtonItem = UIBarButtonItem(title: "決定", style:.plain, target: self, action: #selector(ColorAndBrandViewController.decide))
        self.navigationItem.setRightBarButtonItems([rightButtonItem], animated: true)
        
        // Do any additional setup after loading the view.
        self.addObserver(self, forKeyPath: "conditionBrands", options: .new, context: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("Called:" + keyPath!)
//        self.tableView.reloadData()
//        let section = IndexSet(index: 0)
        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    deinit {
        self.removeObserver(self, forKeyPath: "conditionBrands")
    }
    
    /* 編集ボタン押下時処理 */
    func decide() {
//        if let indexPaths = self.collectionView?.indexPathsForSelectedItems {
//            var selectedColorArray: NSMutableArray = []
//            var selectedBrandArray: NSMutableArray = []
//            for indexPath  in indexPaths {
//                print(colors[indexPath.row].colorText)
//                selectedColorArray.add(colors[indexPath.row].color)
//                
//            }
//            var a = ModelConditions.sharedInstance.get()
//            a.updateValue(selectedColorArray as AnyObject, forKey: ModelConditions.CONDITION_KEY.TOPS.rawValue)
//            ModelConditions.sharedInstance.set(condition: a)
//
//        }
//        
//        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    override func viewDidLayoutSubviews() {
        self.collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
        self.tableViewHeight.constant = tableView.contentSize.height
    }
    
    //textviewがフォーカスされたら、Labelを非表示
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        print("textField")
        let offset = CGPoint(x:100,y:100)
        self.scrollView.setContentOffset(offset, animated: true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldBeginEditing")
    }
    
}

extension ColorAndBrandViewController: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionViewの設定開始")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath as IndexPath) as! ColorCollectionViewCell2
//        let view = cell.viewWithTag(1)
//        let label = cell.viewWithTag(2) as! UILabel
//        view?.backgroundColor = colors[indexPath.row].color
//        label.text = colors[indexPath.row].colorText
        cell.setCells(at: indexPath)
        return cell
    }
    
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}

extension ColorAndBrandViewController: UICollectionViewDelegateFlowLayout {
    /* 一つのセルのサイズ設定処理 */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 2カラム
        let width: CGFloat = super.view.frame.width / 5
        let height: CGFloat = width
        
        return CGSize(width: width, height: height) // The size of one cell
        
    }
}

extension ColorAndBrandViewController: UITableViewDataSource {
    
    
    
    // Section数
    func numberOfSections(in tableView: UITableView) -> Int{
        return sectionTitle.count
    }
    // Sectionのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return conditionBrands.count
//            return selectedBrands.count
        case 1:
            return brands.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableViewの設定開始")
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath) as! BrandTableViewCell2
//            (cell.viewWithTag(1) as! UILabel).text = conditionBrands[String(indexPath.row)]
            cell.brandName.text = conditionBrands[indexPath.row]["name"] as? String
//            (cell.viewWithTag(1) as! UILabel).text = selectedBrands[indexPath.row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath)
            (cell.viewWithTag(1) as! UILabel).text = brands[indexPath.row]
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath)
            (cell.viewWithTag(1) as! UILabel).text = brands[indexPath.row]
            return cell
        }
        
    }
    
}

extension ColorAndBrandViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.tableView.beginUpdates()
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
//        self.tableView.endUpdates()
        let condition: Dictionary<String, Any> =
            [
                "row" : indexPath.row,
                "name" : brands[indexPath.row]
        ]
        conditionBrands.append(condition)
//        conditionBrands[String(indexPath.row)] = brands[indexPath.row]
        print("select")
        print("indexPathは\(indexPath.row)")
        
//        self.tableView.beginUpdates()
//        selectedBrands.append(brands[indexPath.row])
//        let indexPath = IndexPath(row: conditionBrands.count - 1, section: 0)
//        self.tableView.insertRows(at: [indexPath], with: .automatic)
//        self.tableView.endUpdates()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        for i in 0..<self.conditionBrands.count {
//            
//        }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.none
        print("deselect")
        print("indexPathは\(indexPath.row)")
        conditionBrands.remove(at: 0)
//        selectedBrands.remove(at: indexPath.row)
//        conditionBrands.removeValue(forKey: String(indexPath.row))
        let indexPath = IndexPath(row: 0, section: 0)
//        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        
        
//        conditionBrands.remove(at: indexPath.row)
        
        
    }
    
    
    
}




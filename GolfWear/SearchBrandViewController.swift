//
//  SearchBrandViewController.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/28.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class SearchBrandViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var searchController = UISearchController(searchResultsController: nil)
    let dataList = [
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

    //検索結果配列
    var searchResults = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        //結果表示用のビューコントローラーをサーチコントローラーに設定する。
        let resultController = SearchResultViewController()
        resultController.dataList = self.dataList
        searchController = UISearchController(searchResultsController: resultController)
        searchController.searchResultsUpdater = resultController
        searchController.delegate = resultController
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView.dataSource = self
        tableView.delegate = self
        //テーブルビューのヘッダーにサーチバーを設定する。
        tableView.tableHeaderView = searchController.searchBar
        
//        searchController.searchBar.becomeFirstResponder()
//        searchController.searchBar.showsSearchResultsButton = true
//        searchController.searchBar.
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
    //データを返すメソッド
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for:indexPath) as UITableViewCell
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
        //        //セルを取得する。
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for:indexPath) as UITableViewCell
        //
        //        cell.textLabel?.text = dataList[indexPath.row]
        //        return cell
    }
    
    
    
    //データの個数を返すメソッド
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return dataList.count
        //        if( searchController.searchBar.text != "" ) {
        //            return searchResults.count
        //        } else {
        //            return dataList.count
        //        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

//
//  SearchViewModel.swift
//  GolfWear
//
//  Created by DaichiSaito on 2017/01/14.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit
extension UITableViewCell {
    
    func setCells(indexPath: IndexPath) {
        
    }
}
class SearchViewModel: NSObject, UITableViewDataSource, UIPickerViewDataSource {
    
    
    /* セクション情報 */
    enum SectionInfo {
        case itemInfo
        case modelInfo
        case tagInfo
    }
    /* 行情報 */
    enum RowInfo {
        case seasonRowInfo
        case topsRowInfo
        case pantsRowInfo
        case outerRowInfo
        case shoseRowInfo
        case hatRowInfo
        case neckRowInfo
        case otherRowInfo
        case sexRowInfo
        case tallRowInfo
        case ageRowInfo
        case brandRowInfo
        case brandListRowInfo
        case tagAddRowInfo
        case tagListRowInfo
    }
    /* セクションのインデックス */
    let SECTION_ITEM: Int = 0  // アイテム情報
    let SECTION_MODEL: Int = 1 // モデル情報
    let SECTION_TAG: Int = 2 // その他情報
    /* rowのインデックス */
    let ROW_SEASON: Int = 0     // 季節
    let ROW_TOPS: Int = 1       // トップス
    let ROW_PANTS: Int = 2      // パンツ
    let ROW_OUTER: Int = 3      // アウター
    let ROW_SHOSE: Int = 4      // シューズ
    let ROW_HAT: Int = 5        // 帽子
    let ROW_NECK: Int = 6       // ネックウォーマ
    let ROW_OTHER: Int = 7      // その他
    let ROW_SEX: Int = 0        // 性別
    let ROW_TALL: Int = 1       // 身長
    let ROW_AGE: Int = 2        // 年齢
    let ROW_TAG_ADD: Int = 0    // タグ
    let ROW_TAG_LIST: Int = 1   // タグ一覧
    
    
    /* Sectionのタイトル */
    let sectionTitle: NSArray = ["アイテム情報", "モデル情報", "タグ"]
    
    /* アイテム名一覧 */
    let itemLabels: NSArray = ["シーズン","トップス","パンツ・スカート","アウター","シューズ","帽子","ネックウォーマー","その他"]
    
    /* 身長一覧 */
    let tallPickerDataSource = [["151","160"],
                               ["161","170"],
                               ["171","180"],
                               ["181","190"]]
    /* 年齢一覧 */
    let agePickerDataSource = [["0","10"],
                                        ["11","20"],
                                        ["21","30"],
                                        ["31","40"]]
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = getSectionInfo(section: section)
        switch sectionInfo {
            case .itemInfo:
                return itemLabels.count
            case .modelInfo:
                return 3
            case .tagInfo:
                return 1
        }
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case SECTION_ITEM:
            switch indexPath.row {
            case ROW_SEASON:
                let cell = table.dequeueReusableCell(withIdentifier: "season2Cell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_TOPS:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_PANTS:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_OUTER:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_SHOSE:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_HAT:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_NECK:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_OTHER:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            default:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell//仮
            }

            
        case SECTION_MODEL:
            switch indexPath.row {
            case ROW_SEX:
                let cell = table.dequeueReusableCell(withIdentifier: "sexCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            case ROW_TALL:
                let cell = table.dequeueReusableCell(withIdentifier: "tallCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
                
            case ROW_AGE:
                let cell = table.dequeueReusableCell(withIdentifier: "ageCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            default:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            }

            
        case SECTION_TAG:
            switch indexPath.row {
            case ROW_TAG_ADD:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
                
            case ROW_TAG_LIST:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            default:
                let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
                cell.setCells(indexPath: indexPath)
                return cell
            }
        default:
            let cell = table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
            cell.setCells(indexPath: indexPath)
            return cell
            
        }
    }
    
    // Section数
    func numberOfSections(in tableView: UITableView) -> Int{
        return sectionTitle.count
    }
    // Sectionのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    
    // どのセクションかを返す関数
    func getSectionInfo(section: Int) -> SectionInfo {
        switch section {
            case 0:
                return .itemInfo
            case 1:
                return .modelInfo
            case 2:
                return .tagInfo
            default:
                return .itemInfo
        }
    }
    
    // cell取得処理
//    func getCell(table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let rowInfo = getRowInfo(indexPath: indexPath)
//        switch rowInfo {
//        case .seasonRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "season2Cell", for: indexPath) as! Season2TableViewCell
//            
//        case .topsRowInfo,.pantsRowInfo,.outerRowInfo,.shoseRowInfo,.hatRowInfo,.neckRowInfo,.otherRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as! SearchItemsTableViewCell
//        case .sexRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "sexCell", for: indexPath) as! SexTableViewCell
//        case .tallRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "tallCell", for: indexPath) as! TallTableViewCell
//        case .ageRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "ageCell", for: indexPath) as! AgeTableViewCell
//        case .tagAddRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "season2Cell", for: indexPath) as! Season2TableViewCell
//        case .tagListRowInfo:
//            return table.dequeueReusableCell(withIdentifier: "season2Cell", for: indexPath) as! Season2TableViewCell
//        default:
//            return table.dequeueReusableCell(withIdentifier: "season2Cell", for: indexPath) as! Season2TableViewCell
//        }
//    }
    // どの行かを返す関数
    func getRowInfo(indexPath: IndexPath) -> RowInfo {
        switch getSectionInfo(section: indexPath.section) {
        case .itemInfo:
            switch indexPath.row {
            case ROW_SEASON:
                return .seasonRowInfo
            case ROW_TOPS:
                return .topsRowInfo
            case ROW_PANTS:
                return .pantsRowInfo
            case ROW_OUTER:
                return .outerRowInfo
            case ROW_SHOSE:
                return .shoseRowInfo
            case ROW_HAT:
                return .hatRowInfo
            case ROW_NECK:
                return .neckRowInfo
            case ROW_OTHER:
                return .otherRowInfo
            default:
                return .otherRowInfo // 仮
             }
        case .modelInfo:
            switch indexPath.row {
            case ROW_SEX:
                return .sexRowInfo
            case ROW_TALL:
                return .tallRowInfo
            case ROW_AGE:
                return .ageRowInfo
            default:
                return .otherRowInfo // 仮
            }
        case .tagInfo:
            switch indexPath.row {
            case ROW_TAG_ADD:
                return .tagAddRowInfo
            case ROW_TAG_LIST:
                return .tagListRowInfo
            default:
                return .otherRowInfo // 仮
            }
        }
    }
    
    // DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    /* プルダウンの要素数 */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (pickerView.tag == 1) {
            return tallPickerDataSource.count
        } else if (pickerView.tag == 2) {
            return agePickerDataSource.count
        } else {
            return 0
        }
    }
    
}

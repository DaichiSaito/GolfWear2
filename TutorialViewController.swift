
import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate{
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    var pageImagesArr = Array<String>();
    
    let C_NSUSERDEFAULT_FIRST_TIME = "isFirstTimeDone";
    
    override func viewDidLoad() {
        
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        self.view.backgroundColor = UIColor.white
        let pageSize = self.pageImagesArr.count;
        
        //ScrollViewの作成
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)//ペーズ数に応じてscrollViewの横幅を長くする。
        self.view.addSubview(scrollView)
        
        //各ページの作成
        for i in 0 ..< pageSize {
            let img:UIImage = UIImage(named:self.pageImagesArr[i])!;
            let iv:UIImageView = UIImageView(image:img);
            iv.frame = CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height-50);
            scrollView.addSubview(iv)
        }
        
        //UIPageControllの作成
        pageControl = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.maxY - 50, width: width, height: 50))
        pageControl.backgroundColor = UIColor.gray;
        pageControl.numberOfPages = pageSize
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
        
        //閉じるボタンの追加
        let button = UIButton(frame: CGRect(x: width-60, y: 40, width: 40, height:40));
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(onClose(_:)), for:.touchUpInside);
        button.setTitle("X", for: UIControlState.normal);
        button.layer.masksToBounds = true;
        button.layer.cornerRadius = 20.0
        self.view.addSubview(button);
        
        //NSUserDefaultsに書き込み。チュートリアルは最初の一回だけ表示
        UserDefaults.standard.set(true, forKey: C_NSUSERDEFAULT_FIRST_TIME);
        UserDefaults.standard.synchronize();
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら時.
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            // ページの場所を切り替える.
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
    
    //閉じるボタンが押された
    func onClose(_ sender: AnyObject){
        dismiss(animated: true, completion: nil);
    }
    
    //チュートリアルは過去に端末で実行されたか
    func isTutorialDone() ->Bool{
        let obj: Bool = UserDefaults.standard.bool(forKey: C_NSUSERDEFAULT_FIRST_TIME);
        if (obj){
            return false;
        }
        return true;
    }
    
}

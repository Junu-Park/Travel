//
//  TravelDetailInfoViewController.swift
//  Travel
//
//  Created by 박준우 on 1/7/25.
//

import UIKit
import Kingfisher

class TravelDetailInfoViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailSubTitle: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    
    var data: Travel?
    
    // TODO: @IBOutlet 수정 코드는 왜 여기 적으니 nil 오류가 발생할까...?
    override func awakeFromNib() {
        super.awakeFromNib()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationItem.scrollEdgeAppearance = appearance
        
        navigationItem.title = "관광지 화면"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        setTitle()
        setSubTitle()
        setButton()
    }
    
    func setImage() {
        detailImage.contentMode = .scaleAspectFill
        detailImage.layer.cornerRadius = 10
        
        detailImage.kf.setImage(with: URL(string: data?.travel_image ?? ""), placeholder: UIImage(systemName: "photo"))
    }
    
    func setTitle() {
        detailTitle.font = .boldSystemFont(ofSize: 40)
        detailTitle.numberOfLines = 0
        detailTitle.textAlignment = .center
        
        detailTitle.text = data?.title
    }
    
    func setSubTitle() {
        detailSubTitle.font = .boldSystemFont(ofSize: 24)
        detailSubTitle.numberOfLines = 0
        detailSubTitle.textAlignment = .center
        
        detailSubTitle.text = data?.description
    }
    
    func setButton() {
        detailButton.layer.cornerRadius = 20
        detailButton.setTitle("다른 관광지 보러 가기", for: .normal)
        detailButton.setTitleColor(.white, for: .normal)
        detailButton.backgroundColor = .blue.withAlphaComponent(0.5)
    }
    
    @IBAction func tapPopButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit

class SignUp4ViewController: UIViewController {

    
    // MARK: 하트이미지
    
    // 하트이미지 배경
    private lazy var heartImgBackgroundView: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartBackgorund.png")
        return img
    }()
    
    // 하트이미지 1/3
    private lazy var heartImg3View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon3:3.png")
        img.addSubview(heartImgBackgroundView)

        return img
    }()
    
    // 다음화면 넘어가는 버튼
    private lazy var nextBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .thin)
        let symbolImage = UIImage(systemName: "arrow.right.circle", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
        return button
    }()
    
    // MARK: 회원가입화면2 상단 레이블
    // 사랑을 시작해볼까요 레이블
    private var startLabel: UILabel = {
        let label = UILabel()
        label.text = "사랑을 시작해볼까요?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 계정을 생성하여 즐겨보아요 레이블
    private var startExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "계정을 생성하여 HeartHub를 즐겨보아요."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    // 두 레이블 묶는 스택뷰
    private lazy var startLabelStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [startLabel, startExplainLabel])
        stView.spacing = 5
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 약관동의 + 동의 버튼
    let labelWidth: CGFloat = 200
//    let spacingAgreeStview: CGFloat = 27

    // 약관 전체 동의 레이블
    private var allTermAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "약관 전체 동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 약관 전체 동의 버튼
    private lazy var allTermAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(didTapAllAgreeBtn), for: .touchUpInside)
        return button
    }()

    // 약관 전체 동의 버튼 + 약관 전체 동의 레이블 스택뷰
    private lazy var allTermAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [allTermAgreeBtn, allTermAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()

    
    // 개인정보 수집 동의 레이블
    private var privacyAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(필수) 개인정보 수집 및 이용동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
       // label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 개인정보 수집 동의 버튼
    private lazy var privacyAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(didTapPrivacyAgreeBtn), for: .touchUpInside)
        return button
    }()

    // 개인정보 수집 및 이용동의 화살표 버튼
    private lazy var privacyArrowBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .thin)
        let symbolImage = UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        button.addTarget(self, action: #selector(didTapPrivacyArrowBtn), for: .touchUpInside)
        return button
    }()
    
    
    // 개인정보 수집 동의 버튼 + 개인정보 수집 동의 레이블 스택뷰
    private lazy var privacyAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [privacyAgreeBtn, privacyAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 이용 약관 동의 레이블
    private var termOfUseAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(필수) 이용 약관 동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        // label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 이용 약관 동의 버튼
    private lazy var termOfUseAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear

        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(didTapTermOfUseAgreeBtn), for: .touchUpInside)
        return button
    }()
    

    // 이용 약관 동의 버튼 + 이용 약관 동의 레이블 스택뷰
    private lazy var termOfUseAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [termOfUseAgreeBtn, termOfUseAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 마케팅 활용 동의 레이블
    private var marketingAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(선택) 마케팅 활용 동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        // label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 마케팅 활용 동의 버튼
    private lazy var marketingAgreeAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear

        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(didTapMarketingAgreeBtn), for: .touchUpInside)
        return button
    }()

    // 마케팅 전체 동의 버튼 + 마케팅 전체 동의 레이블 스택뷰
    private lazy var marketingAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [marketingAgreeAgreeBtn, marketingAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 약관동의레이블 스택뷰
    private lazy var lineBelowAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [privacyAgreeStackView, termOfUseAgreeStackView, marketingAgreeStackView])
        stView.spacing = 0
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .leading
        return stView
    }()
    
    // 약관동의레이블 스택뷰
    private lazy var agreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [allTermAgreeStackView, lineView, lineBelowAgreeStackView])
        stView.spacing = 7.74
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .leading
//        stView.setCustomSpacing(<#T##spacing: CGFloat##CGFloat#>, after: <#T##UIView#>)
//        stView.layoutMargins = uied
        return stView
    }()
    
 
    // 약관동의 사이 선
    private lazy var lineView: UIView = {
       let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.7686274648, green: 0.7686274648, blue: 0.7686274648, alpha: 1)
        return line
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAutoLayout()
        
    }
    
    private func setupAutoLayout() {
        view.backgroundColor = .white
        
        view.addSubview(heartImgBackgroundView)
        view.addSubview(heartImg3View)
        view.addSubview(nextBtn)
        view.addSubview(startLabelStackView)
        
        view.addSubview(agreeStackView)
        
//        view.addSubview(allTermAgreeStackView)
//        view.addSubview(lineView)
//        view.addSubview(lineBelowAgreeStackView)
    
         
        
        let margins = view.layoutMarginsGuide
        heartImgBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        heartImg3View.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false

        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        agreeStackView.translatesAutoresizingMaskIntoConstraints = false

        
        
        NSLayoutConstraint.activate([
            heartImg3View.topAnchor.constraint(equalTo: margins.topAnchor, constant: 32),
            heartImg3View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 172),
            heartImg3View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -172),
             
            heartImgBackgroundView.topAnchor.constraint(equalTo: heartImg3View.topAnchor, constant: 3),
            heartImgBackgroundView.bottomAnchor.constraint(equalTo: heartImg3View.bottomAnchor, constant: -2.75),
            heartImgBackgroundView.leadingAnchor.constraint(equalTo: heartImg3View.leadingAnchor, constant: 0),
            heartImgBackgroundView.trailingAnchor.constraint(equalTo: heartImg3View.trailingAnchor, constant: 0),
            
            nextBtn.widthAnchor.constraint(equalToConstant: 50),
            nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56),
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            startLabelStackView.topAnchor.constraint(equalTo: heartImg3View.bottomAnchor, constant: 50),
            startLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 76),
                  
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: agreeStackView.leadingAnchor, constant: -1),
            lineView.trailingAnchor.constraint(equalTo: agreeStackView.trailingAnchor, constant: 0),
            
            
            agreeStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 158),
            agreeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            agreeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
    
    @objc func didTapNextBtn() {
        
    }
    @objc func didTapAllAgreeBtn() {
        if allTermAgreeBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            allTermAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
             allTermAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapPrivacyAgreeBtn() {
        if privacyAgreeBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            privacyAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
             privacyAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapTermOfUseAgreeBtn() {
        if termOfUseAgreeBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            termOfUseAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
             termOfUseAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapMarketingAgreeBtn() {
        if marketingAgreeAgreeBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            marketingAgreeAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
             marketingAgreeAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapCertifyNumberBtn() {}
    @objc func didTapPrivacyArrowBtn() {}
    @objc func didTapTermOfUseArrowBtn() {}

   
}


//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit

final class SignUpTermAgreeViewController: UIViewController {

    private let signUpTermAgreeView = SignUpTermAgreeView()
    
    private let signUpTermTableView = UITableView()
    // 약관동의 사이 선
    private var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.7686274648, green: 0.7686274648, blue: 0.7686274648, alpha: 1)
        return line
    }()
    
    private lazy var footerSpacingView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(lineView)
        return view
    }()
    
    private let termDescriptionsLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.text = """
        HeartHuB 서비스를 이용하기 위해서는 만 14세 이상이 되어야 합니다. 만 14세 미만의 이용자일 경우 이용이 제한됩니다.
        
        개인정보의 마케팅 활용(마케팅 및 광고성 정보 전송)에 동의하지 않으실 수 있으며, 동의하지 않으시더라도 HeartHuB 서비스를 이용하실 수 있습니다.
        """
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()

    private let termsArray = [
        "(필수) 개인정보 수집 및 이용동의",
        "(필수) 이용 약관 동의",
    ]

    override func loadView() {
        view = signUpTermAgreeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        tableViewInitialSetting()
        configureSubViews()
        configureLayout()
    }
}

// MARK: TableView Delegate Implement
extension SignUpTermAgreeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            return footerSpacingView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 17
        }
        return 0
    }
}

// MARK: TableView DataSource Implement
extension SignUpTermAgreeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SignUpTermTableViewCell.reuseIdentifier,
            for: indexPath) as? SignUpTermTableViewCell else {
                return UITableViewCell()
            }
  
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            cell.termLabel.text = "약관 전체 동의"
            cell.termDescriptionButton.isHidden = true
        } else if indexPath.section == 1 {
            cell.termLabel.text = termsArray[indexPath.row]
        } else {
            cell.termLabel.text = "(선택) 마케팅 활용 동의"
            cell.termDescriptionButton.isHidden = true
        }
        
        return cell
    }
}

// MARK: Configure TableView
extension SignUpTermAgreeViewController {
    private func tableViewInitialSetting() {
        signUpTermTableView.delegate = self
        signUpTermTableView.dataSource = self
        signUpTermTableView.register(
            SignUpTermTableViewCell.self,
            forCellReuseIdentifier: SignUpTermTableViewCell.reuseIdentifier)
        signUpTermTableView.isScrollEnabled = false
        signUpTermTableView.contentSize.height = 24
        signUpTermTableView.separatorStyle = .none
    }
}

// MARK: Configure Layout
extension SignUpTermAgreeViewController {
    private func configureSubViews() {
        [signUpTermTableView, termDescriptionsLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: signUpTermTableView Constraints
            signUpTermTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpTermTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 162),
            signUpTermTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -300),
            signUpTermTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),

            // MARK: lineView Constraints
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.centerYAnchor.constraint(equalTo: footerSpacingView.centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: footerSpacingView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: footerSpacingView.trailingAnchor),
            
            termDescriptionsLabel.topAnchor.constraint(equalTo: signUpTermTableView.bottomAnchor),
            termDescriptionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termDescriptionsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 70),
            termDescriptionsLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25)
        ])
    }
}



extension SignUpTermAgreeViewController {

    func addTarget() {
//        signUpTermAgreeView.signUpTermAgreeNextPageButton.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
        signUpTermAgreeView.signUpTermAgreePreviousPageButton.addTarget(self, action: #selector(didTapLeftArrowBtn), for: .touchUpInside)
//        signUpTermAgreeView.allTermAgreeBtn.addTarget(self, action: #selector(didTapAllAgreeBtn), for: .touchUpInside)
//        signUpTermAgreeView.privacyAgreeBtn.addTarget(self, action: #selector(didTapPrivacyAgreeBtn), for: .touchUpInside)
//        signUpTermAgreeView.termOfUseAgreeBtn.addTarget(self, action: #selector(didTapTermOfUseAgreeBtn), for: .touchUpInside)
//        signUpTermAgreeView.marketingAgreeBtn.addTarget(self, action: #selector(didTapMarketingAgreeBtn), for: .touchUpInside)

    }

    @objc func didTapRightArrowBtn() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func didTapLeftArrowBtn() {
        navigationController?.popViewController(animated: true)
    }
//
//    @objc func didTapAllAgreeBtn() {
//        if signUpTermAgreeView.allTermAgreeBtn.currentImage == checkedImage {
//            signUpTermAgreeView.allTermAgreeBtn.setImage(unCheckedImage, for: .normal)
//            signUpTermAgreeView.privacyAgreeBtn.setImage(unCheckedImage, for: .normal)
//            signUpTermAgreeView.termOfUseAgreeBtn.setImage(unCheckedImage, for: .normal)
//            signUpTermAgreeView.marketingAgreeBtn.setImage(unCheckedImage, for: .normal)
//        } else {
//            signUpTermAgreeView.allTermAgreeBtn.setImage(checkedImage, for: .normal)
//            if signUpTermAgreeView.privacyAgreeBtn.currentImage == checkedImage
//                || signUpTermAgreeView.termOfUseAgreeBtn == checkedImage
//                || signUpTermAgreeView.marketingAgreeBtn == checkedImage {
//                signUpTermAgreeView.privacyAgreeBtn.setImage(checkedImage, for: .normal)
//                signUpTermAgreeView.termOfUseAgreeBtn.setImage(checkedImage, for: .normal)
//                signUpTermAgreeView.marketingAgreeBtn.setImage(checkedImage, for: .normal)
//            } else if signUpTermAgreeView.privacyAgreeBtn.currentImage == unCheckedImage
//                        || signUpTermAgreeView.termOfUseAgreeBtn == unCheckedImage
//                        || signUpTermAgreeView.marketingAgreeBtn == unCheckedImage {
//                signUpTermAgreeView.privacyAgreeBtn.setImage(checkedImage, for: .normal)
//                signUpTermAgreeView.termOfUseAgreeBtn.setImage(checkedImage, for: .normal)
//                signUpTermAgreeView.marketingAgreeBtn.setImage(checkedImage, for: .normal)
//            } else {
//                signUpTermAgreeView.privacyAgreeBtn.setImage(unCheckedImage, for: .normal)
//                signUpTermAgreeView.termOfUseAgreeBtn.setImage(unCheckedImage, for: .normal)
//                signUpTermAgreeView.marketingAgreeBtn.setImage(unCheckedImage, for: .normal)
//            }
//        }
//    }
//
//    @objc func didTapPrivacyAgreeBtn() {
//        if signUpTermAgreeView.privacyAgreeBtn.currentImage == checkedImage {
//            signUpTermAgreeView.privacyAgreeBtn.setImage(unCheckedImage, for: .normal)
//        } else {
//            signUpTermAgreeView.privacyAgreeBtn.setImage(checkedImage, for: .normal)
//        }
//        checkAllTermAgree()
//    }
//
//    @objc func didTapTermOfUseAgreeBtn() {
//        if signUpTermAgreeView.termOfUseAgreeBtn.currentImage == checkedImage {
//            signUpTermAgreeView.termOfUseAgreeBtn.setImage(unCheckedImage, for: .normal)
//        } else {
//            signUpTermAgreeView.termOfUseAgreeBtn.setImage(checkedImage, for: .normal)
//        }
//        checkAllTermAgree()
//    }
//
//    @objc func didTapMarketingAgreeBtn() {
//        if signUpTermAgreeView.marketingAgreeBtn.currentImage == checkedImage {
//            signUpTermAgreeView.marketingAgreeBtn.setImage(unCheckedImage, for: .normal)
//        } else {
//            signUpTermAgreeView.marketingAgreeBtn.setImage(checkedImage, for: .normal)
//        }
//        checkAllTermAgree()
//    }
//
//    private func checkAllTermAgree() {
//        if signUpTermAgreeView.privacyAgreeBtn.currentImage == unCheckedImage
//            || signUpTermAgreeView.termOfUseAgreeBtn.currentImage == unCheckedImage
//            || signUpTermAgreeView.marketingAgreeBtn.currentImage == unCheckedImage {
//            signUpTermAgreeView.allTermAgreeBtn.setImage(unCheckedImage, for: .normal)
//        } else if signUpTermAgreeView.privacyAgreeBtn.currentImage == checkedImage
//        && signUpTermAgreeView.termOfUseAgreeBtn.currentImage == checkedImage
//        && signUpTermAgreeView.marketingAgreeBtn.currentImage == checkedImage {
//        signUpTermAgreeView.allTermAgreeBtn.setImage(checkedImage, for: .normal)
//    }
//
//    }
//
//    @objc func didTapPrivacyArrowBtn() {
//
//
//    }
//
//    @objc func didTapTermOfUseArrowBtn() {
//
//
//    }
//
//    @objc func didTapmarketingDescriptionBtn() {
//
//    }
}

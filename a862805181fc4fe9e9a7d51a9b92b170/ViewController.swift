//
//  ViewController.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by Gokce on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Point -
    lazy var pointLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        label.text = "Dağıtılacak Puan"
        
        return label
    }()
    
    lazy var totalPoint: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        label.text = "15"
        return label
    }()
    
    lazy var pointStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 40.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.pointLabel,
         self.totalPoint
         ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Craft -
    lazy var craftNameField: UITextField = {
        let field = UITextField(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        field.placeholder = "Uzay Aracı İsmi"
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.rightViewMode = .always
        field.clearButtonMode = .whileEditing
        field.font = UIFont.systemFont(ofSize: 20)
        field.adjustsFontSizeToFitWidth = true
        
        return field
    }()
    
    lazy var craftNameStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 40.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.craftNameField].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Durability -
    lazy var durabilitySliderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        label.text = "Dayanıklılık: 1"
        return label
    }()
    
    lazy var durabilitySlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        
        slider.minimumValue = 1
        slider.maximumValue = 13
        slider.isContinuous = true
        slider.isContinuous = false
        slider.tintColor = .blue
        slider.value = 1
        slider.addTarget(self, action: #selector(durabilitySliderValueDidChange) ,for: .valueChanged)
        
        return slider
    }()
    
    lazy var durabilityStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.durabilitySliderLabel,
         self.durabilitySlider
         ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Velocity -
    lazy var velocitySliderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        label.text = "Hız: 1"
        return label
    }()
    
    lazy var velocitySlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        
        slider.minimumValue = 1
        slider.maximumValue = 13
        slider.isContinuous = true
        slider.tintColor = .blue
        slider.isContinuous = false
        slider.value = 1
        slider.addTarget(self, action: #selector(velocitySliderValueDidChange) ,for: .valueChanged)
        
        return slider
    }()
    
    lazy var velocityStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.velocitySliderLabel,
         self.velocitySlider
         ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Capacity -
    lazy var capacitySliderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        label.text = "Kapasite: 1"
        return label
    }()
    
    lazy var capacitySlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        
        slider.minimumValue = 1
        slider.maximumValue = 13
        slider.isContinuous = true
        slider.tintColor = .blue
        slider.isContinuous = false
        slider.value = 1
        slider.addTarget(self, action: #selector(capacitySliderValueDidChange) ,for: .valueChanged)
        
        return slider
    }()
    
    lazy var capacityStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.capacitySliderLabel,
         self.capacitySlider
         ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Continue button -
    lazy var continueButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        btn.backgroundColor = .blue
        btn.setTitle("Devam Et", for: .normal)
        btn.addTarget(self, action: #selector(btnLoginTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var continueButtonStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .bottom
        [self.continueButton].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    //MARK: - General Stack -
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 40.0
        stack.alignment = .fill
        stack.distribution = .equalCentering
        [self.pointStackView,
         self.craftNameStackView,
         self.durabilityStackView,
         self.velocityStackView,
         self.capacityStackView,
         self.continueButtonStackView
         ].forEach { stack.addArrangedSubview($0) }
                
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        applyConstraints()
    }

    private func applyConstraints() {

        let stackViewConstraints = [
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            //stackView.widthAnchor.constraint(equalToConstant: 120)
        ]
//
//        let pointLabelConstraints = [
//            pointLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//            pointLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
//            pointLabel.widthAnchor.constraint(equalToConstant: 200)
//        ]
        
//        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
//        pointStackView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
//        pointStackView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true


        NSLayoutConstraint.activate(stackViewConstraints)
    }

    @objc func durabilitySliderValueDidChange(sender: UISlider!)
    {
        sender.setValue(sender.value.rounded(.down), animated: true)
        durabilitySliderLabel.text = "Dayanıklılık: " + String(Int(sender.value))
    }
    
    @objc func velocitySliderValueDidChange(sender: UISlider!)
    {
        sender.setValue(sender.value.rounded(.down), animated: true)
        velocitySliderLabel.text = "Hız: " + String(Int(sender.value))
    }
    
    @objc func capacitySliderValueDidChange(sender: UISlider!)
    {
        sender.setValue(sender.value.rounded(.down), animated: true)
        capacitySliderLabel.text = "Kapasite: " + String(Int(sender.value))
    }
    
    @objc func btnLoginTouchUpInside() {
        
        guard MockyStations.stations != nil else {
            return
        }
        
        let totalValue = capacitySlider.value + velocitySlider.value + durabilitySlider.value
        
        guard totalValue <= 15 else {
            print("değerleri yeterli girin")
            showToast(message: "değerleri yeterli girin", seconds: 2)
            return
        }
        
        setCraftInformations()
                
        let tabBarVc = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: FavoriteViewController())
        
        vc1.title = "İstasyon"
        vc2.title = "Favoriler"
        
        vc1.navigationBar.backgroundColor = .systemBackground
        vc2.navigationBar.backgroundColor = .systemBackground
        
        vc1.tabBarItem.image = UIImage(systemName: "airplane")
        vc2.tabBarItem.image = UIImage(systemName: "star.fill")
        
        tabBarVc.setViewControllers([vc1, vc2], animated: true)
        
        tabBarVc.tabBar.backgroundColor = .systemBackground
        
        tabBarVc.modalPresentationStyle = .fullScreen
        
        //navigationController?.pushViewController(tabBarVc, animated: true)
        present(tabBarVc, animated: true)
    }
    
    func setCraftInformations() {
        let defaults = UserDefaults.standard
        defaults.set(craftNameField.text, forKey: Constants.craftName)
        defaults.set(Int(durabilitySlider.value), forKey: Constants.craftDurability)
        defaults.set(Int(velocitySlider.value), forKey: Constants.craftVelocity)
        defaults.set(Int(capacitySlider.value), forKey: Constants.craftCapacity)
    }
}

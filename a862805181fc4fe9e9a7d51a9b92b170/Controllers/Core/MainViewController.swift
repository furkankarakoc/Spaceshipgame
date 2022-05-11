//
//  MainViewController.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by furkan on 11.05.2022.
//

import Foundation
import UIKit
import CloudKit

class MainViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - UGS label -
    lazy var UGSLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40.0, height: 24.0))
        label.text = "UGS: "
        
        return label
    }()
    
    lazy var UGSPoint: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "150000"
        label.textAlignment = .left
        return label
    }()
    
    lazy var UGSStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 1
        stack.alignment = .firstBaseline
        stack.distribution = .equalCentering
        [self.UGSLabel,
         self.UGSPoint
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - EUS label -
    lazy var EUSLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40.0, height: 24.0))
        label.text = "EUS: "
        
        return label
    }()
    
    lazy var EUSPoint: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "150000"
        return label
    }()
    
    lazy var EUSStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 1
        stack.alignment = .firstBaseline
        stack.distribution = .equalCentering
        [self.EUSLabel,
         self.EUSPoint
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - DS label -
    lazy var DSLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40.0, height: 24.0))
        label.text = "DS: "
        
        return label
    }()
    
    lazy var DSPoint: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "150000"
        return label
    }()
    
    lazy var DSStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 1
        stack.alignment = .firstBaseline
        stack.distribution = .equalCentering
        [self.DSLabel,
         self.DSPoint
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - DS label -
    lazy var pointStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10.0
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.UGSStackView,
         self.EUSStackView,
         self.DSStackView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Name and Info label -
    lazy var craftLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40.0, height: 24.0))
        label.text = "WhartonX "
        
        return label
    }()
    
    lazy var damageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "100"
        return label
    }()
    
    lazy var durabilityTimeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "49s"
        return label
    }()
    
    lazy var nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.craftLabel,
         self.damageLabel,
         self.durabilityTimeLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Search Bar -
    lazy var searchBar:UISearchBar = {
        let searchBar:UISearchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        
        return searchBar
    }()
    
    // MARK: - Card -
    lazy var leftButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30.0, height: 24.0))
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        //btn.backgroundColor = .blue
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.addTarget(self, action: #selector(leftBtnTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30.0, height: 24.0))
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        //btn.backgroundColor = .blue
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.addTarget(self, action: #selector(rightBtnTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var cardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        [self.leftButton,
         card,
         self.rightButton,
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Station Name -
    lazy var currentStationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100.0))
        label.text = "Tgvslxp"
        label.textAlignment = .center
        label.fitTextToBounds()
        return label
    }()
    
    // MARK: - General Stack View -
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        [pointStackView,
         nameStackView,
         searchBar,
         cardStackView,
         currentStationLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    let card = CardView()
    
    var craftName: String = ""
    var craftDurability: Int = 0
    var craftVelocity: Int = 0
    var craftCapacity: Int = 0
    
    var currentStation: String = ""
        
    var EUS = 0
    var UGS = 0
    var DS = 0
    
    var lastTravel = 0
    
    var durabilitytime = 0

    var damage = 100
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let stations = MockyStations.stations else {
            return
        }
        let defaults = UserDefaults.standard
        for i in 0..<stations.count {
            defaults.set(stations[i].stock, forKey: stations[i].name + "stock")
        }
        
        loadCraftInformations()
        
        //title = "UGS: \(UGS) \t\t EUS: \(EUS) \t\t\t DS:\(DS)"
        
        title = "İstasyonlar"
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(stackView)
        applyConstraints()
        card.travelButton.addTarget(self, action: #selector(travelBtnTouchUpInside), for: .touchUpInside)
        
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self]  timer in
            
            guard let self = self else {
                return
            }
            
            self.durabilityTimeLabel.text = String(self.durabilitytime) + "s"
            self.durabilitytime -= 1
            if self.durabilitytime == -1 {
                self.damage -= 10
                self.damageLabel.text = String(self.damage)
                timer.invalidate()
                
                if self.damage > 0 {
                    self.durabilitytime = 10
                    self.startTimer()
                } else {
                    self.returnTheEarth()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("appear")
        
        toggleFav()
    }
    
    private func applyConstraints() {
        
        let stackViewConstraints = [
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
        print(textSearched)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print(searchBar.text!)
        
        var flag = true
        
        guard let stations = MockyStations.stations else {
            return
        }
        
        for i in 0..<stations.count {
            if stations[i].name.levenshteinDistanceScore(to: searchBar.text!) >= 0.5 {
                MockyStations.stationCount = i
                setCard()
                print(stations[i].name)
                flag = false
                break
            }
        }
        
        if flag {
            showToast(message: "Arama sonucu bulunamadı!", seconds: 2)
        }
    }
    
    @objc func leftBtnTouchUpInside() {
        print("left")
        
        if MockyStations.stationCount != 0 {
            MockyStations.stationCount -= 1
        }
        
        setCard()
    }
    
    @objc func rightBtnTouchUpInside() {
        print("right")
        
        guard let stations = MockyStations.stations else {
            return
        }
        
        if MockyStations.stationCount < stations.count - 1 {
            MockyStations.stationCount += 1
        }
        
        setCard()
    }
    
    func setCard() {
        
        loadCardInformation()
        
        //card.EUSLabel.text = String(stations[MockyStations.stationCount].eus!) + "eus"
        toggleFav()
    }
    
    func toggleFav() {
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        
        guard let favToggle = MockyStations.stations?[MockyStations.stationCount].favorite else {
            return
        }
        
        switch favToggle {
        case true:
            let largeBoldDoc = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
            
            card.favoriteBtn.setImage(largeBoldDoc, for: .normal)
            
            break
        case false:
            let largeBoldDoc = UIImage(systemName: "heart", withConfiguration: largeConfig)
            
            card.favoriteBtn.setImage(largeBoldDoc, for: .normal)
            
            break
        }
    }
    
    func loadCraftInformations() {
        let defaults = UserDefaults.standard
        
        craftName = defaults.object(forKey: Constants.craftName) as! String
        craftDurability = defaults.integer(forKey: Constants.craftDurability)
        craftVelocity = defaults.integer(forKey: Constants.craftVelocity)
        craftCapacity = defaults.integer(forKey: Constants.craftCapacity)
        
        craftLabel.text = craftName
        
        currentStation = "Dünya"
        currentStationLabel.text = MockyStations.stations?[0].name ?? "Dünya"
        loadCardInformation()
        //card.EUSLabel.text = String((MockyStations.stations?[0].eus)!) + "eus"
        
        EUS = craftVelocity * Constants.EUSfactor
        UGS = craftCapacity * Constants.UGSfactor
        DS = craftDurability * Constants.DSfactor
        
        // EUS UGS DS
        loadCraftValuePoints()
        
        durabilitytime = DS / 1000
        
        durabilityTimeLabel.text = String(durabilitytime) + "s"
    }
    
    private func loadCraftValuePoints() {
        EUSPoint.text = String(EUS)
        UGSPoint.text = String(UGS)
        DSPoint.text = String(DS)
    }
    
    private func loadCardInformation() {
        
        guard let stations = MockyStations.stations else {
            return
        }
        
        let defaults = UserDefaults.standard
        
        let tempStock = defaults.integer(forKey: stations[MockyStations.stationCount].name + "stock")
        
        card.name.text = MockyStations.stations?[MockyStations.stationCount].name ?? "Dünya"
        
        card.stockAndNeed.text = String(stations[MockyStations.stationCount].capacity) +
        "/" + String(tempStock)
        
        card.EUSLabel.text = String(MockyStations.shared.calculateDistance()) + "EUS"
    }
    
    @objc func travelBtnTouchUpInside() {
        
        guard let stations = MockyStations.stations else {
            return
        }
        
        if currentStation == "Dünya" {
            startTimer()
        }
        
        // check if last sation is same with targeted station.
        if lastTravel == MockyStations.stationCount {
            showToast(message: "Farklı bir istasyona seyahat yapabilirsin", seconds: 1)
            return
        }
        lastTravel = MockyStations.stationCount
        
        let defaults = UserDefaults.standard
        var tempStock = defaults.integer(forKey: stations[MockyStations.stationCount].name + "stock")
        
        if tempStock >= stations[MockyStations.stationCount].capacity {
            showToast(message: "Kapasite dolu", seconds: 2)
            return
        }
        
        tempStock += stations[MockyStations.stationCount].need
        
        if tempStock > stations[MockyStations.stationCount].capacity {
                    showToast(message: "Kapasiteyi aşıyor.", seconds: 2)
                    return
                }
                defaults.set(tempStock, forKey: stations[MockyStations.stationCount].name + "stock")
        
        currentStation = stations[MockyStations.stationCount].name
        currentStationLabel.text = stations[MockyStations.stationCount].name
        
        UGS -= stations[MockyStations.stationCount].need
        EUS -= MockyStations.shared.calculateDistance()
        
        // Update coordinates
        MockyStations.currentX = stations[MockyStations.stationCount].coordinateX
        MockyStations.currentY = stations[MockyStations.stationCount].coordinateY
        
        loadCardInformation()
        
        if UGS <= 0 || EUS <= 0 {
            returnTheEarth()
        }
        
        if EUS < MockyStations.shared.calculateDistance() {
            returnTheEarth()
        }
        
        loadCraftValuePoints()
    }
    
    func returnTheEarth() {
        
        timer?.invalidate()
        MockyStations.currentX = 0.0
        MockyStations.currentY = 0.0
        
        EUS = craftVelocity * Constants.EUSfactor
        UGS = craftCapacity * Constants.UGSfactor
        DS = craftDurability * Constants.DSfactor
        
        loadCraftValuePoints()
        
        lastTravel = MockyStations.stationCount
        
        currentStation = "Dünya"
        currentStationLabel.text = MockyStations.stations?[0].name ?? "Dünya"
        
        durabilitytime = DS / 1000
        damage = 100
        damageLabel.text = String(self.damage)
        
        durabilityTimeLabel.text = String(durabilitytime) + "s"
        
        startTimer()
    }
    
}

class CardView: UIView {
    
    // MARK: - Top Label -
    lazy var stockAndNeed: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40.0, height: 24.0))
        label.text = "2000/1000"
        
        return label
    }()
    
    lazy var EUSLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "242EUS"
        return label
    }()
    
    lazy var nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        [self.stockAndNeed,
         self.EUSLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - image -
    lazy var favoriteBtn: UIButton = {
        let btn = UIButton(type: .custom)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "heart", withConfiguration: largeConfig)
        
        btn.setImage(largeBoldDoc, for: .normal)
        
        btn.tintColor = .systemRed
        btn.addTarget(self, action: #selector(favoriteBtnTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Top Stack View -
    lazy var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        [self.nameStackView,
         self.favoriteBtn
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - name -
    lazy var name: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20.0, height: 24.0))
        label.text = "YZCRFJ - 246"
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - travel Button -
    lazy var travelButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200.0, height: 24.0))
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        btn.backgroundColor = .blue
        btn.setTitle("Seyahat", for: .normal)
        return btn
    }()
    
    // MARK: - General Stack View -
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.topStackView,
         self.name,
         self.travelButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1
        layer.cornerRadius = 20
        addSubview(stackView)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let stackViewConstraints = [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            //stackView.heightAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func favoriteBtnTouchUpInside() {
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        
        guard let favToggle = MockyStations.stations?[MockyStations.stationCount].favorite else {
            return
        }
        
        switch favToggle {
        case true:
            let largeBoldDoc = UIImage(systemName: "heart", withConfiguration: largeConfig)
            
            favoriteBtn.setImage(largeBoldDoc, for: .normal)
            MockyStations.stations?[MockyStations.stationCount].favorite = !favToggle
            
            guard let name = MockyStations.stations?[MockyStations.stationCount].name else {
                return
            }
            
            StationCoreData.shared.deleteCardInfo(name: name) { result in
                switch result {
                case.success():
                    print("deleted Favorite")
                case.failure(let error):
                    print("deleted failure: \(error)")
                }
            }
            
            break
        case false:
            let largeBoldDoc = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
            
            favoriteBtn.setImage(largeBoldDoc, for: .normal)
            MockyStations.stations?[MockyStations.stationCount].favorite = !favToggle
            
            guard let name = MockyStations.stations?[MockyStations.stationCount].name else {
                return
            }
            
            let eus = MockyStations.shared.calculateDistance()
            StationCoreData.shared.addFovorite(name: name, eus: eus) { result in
                switch result {
                case.success():
                    print("added Favorite")
                case.failure(let error):
                    print("added failure: \(error)")
                }
            }
            break
        }
    }
}

import UIKit
import FSCalendar
import SnapKit
import Then

class CalenderView: UIViewController {
    
    // MARK: - Constant
    
    struct Icon {
        static let leftIcon = UIImage(systemName: "chevron.left")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
        static let rightIcon = UIImage(systemName: "chevron.right")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
    }
    
    // MARK: - Property
    
    let headerDateFormatter = DateFormatter().then {
        $0.dateFormat = "YYYY.MM"
        $0.locale = Locale(identifier: "ko_kr")
        $0.timeZone = TimeZone(identifier: "KST")
    }
    
    var selectedDate: Date?
    
    // MARK: - UI
    
    
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "날짜 선택"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .label
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.addTarget(self, action: #selector(tapCompleteButton), for: .touchUpInside)
    }
    
    private lazy var calendarView = FSCalendar(frame: .zero)
    
    private lazy var leftButton = UIButton().then {
        $0.setImage(Icon.leftIcon, for: .normal)
        $0.addTarget(self, action: #selector(tapBeforeMonth), for: .touchUpInside)
    }
    
    private lazy var rightButton = UIButton().then {
        $0.setImage(Icon.rightIcon, for: .normal)
        $0.addTarget(self, action: #selector(tapNextMonth), for: .touchUpInside)
    }
    
    private lazy var headerLabel = UILabel().then { [weak self] in
        guard let self = self else { return }
        
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .label
        $0.text = self.headerDateFormatter.string(from: Date())
    }

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCalendar()
    }
    
    
}



// MARK: - FSCalendar

extension CalenderView: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        
        calendarView.snp.updateConstraints {
            $0.height.equalTo(bounds.height)
        }
        self.view.layoutIfNeeded()
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let currentPage = calendarView.currentPage
        
        headerLabel.text = headerDateFormatter.string(from: currentPage)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let weekday = Calendar.current.component(.weekday, from: date)
        if weekday >= 1 {
            return .black
        }
        return nil
    }
}

// MARK: - Method

extension CalenderView {
    
    private func configureUI() {
        view.backgroundColor = .white
        
        [
            titleLabel,
            completeButton,
            calendarView,
            leftButton,
            rightButton,
            headerLabel,
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16.0)
            $0.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-16.0)
        }
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60.0)
            $0.trailing.leading.equalToSuperview().inset(12.0)
            $0.height.equalTo(300.0)
        }
        
        leftButton.snp.makeConstraints {
            $0.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY)
            $0.trailing.equalTo(headerLabel.snp.leading).offset(-10.0)
        }
        
        headerLabel.snp.makeConstraints {
            $0.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY)
            $0.centerX.equalToSuperview() // 가운데 정렬
        }
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalTo(calendarView.calendarHeaderView.snp.centerY)
            $0.leading.equalTo(headerLabel.snp.trailing).offset(10.0) // 조절할 공백
        }
        

    }
    
    @objc private func tapCompleteButton() {
        if let selectedDate = selectedDate {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: selectedDate)
            let month = calendar.component(.month, from: selectedDate)
            let day = calendar.component(.day, from: selectedDate)
            
            print("선택한 날짜: \(year)년 \(month)월 \(day)일")
        } else {
            print("날짜를 선택하세요.")
        }
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
    }

    
    private func configureCalendar() {
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        calendarView.select(Date())
        
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.scope = .month
        
        calendarView.appearance.headerTitleColor = .clear
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        calendarView.appearance.selectionColor = #colorLiteral(red: 0.9998934865, green: 0.8799174428, blue: 0.9876987338, alpha: 1)
        calendarView.appearance.titleSelectionColor = .black // 날짜 선택 시 글자 색상
        let offset: Double = (self.view.frame.width - ("YYYY.MM" as NSString)
            .size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)])
            .width - 16.0 ) / 2.0
        calendarView.appearance.headerTitleOffset = CGPoint(x: -offset, y: 0)
        
        calendarView.weekdayHeight = 36.0
        calendarView.headerHeight = 36.0
        
        calendarView.appearance.weekdayFont = .systemFont(ofSize: 14.0)
        calendarView.appearance.titleFont = .systemFont(ofSize: 14.0)
        calendarView.appearance.titleTodayColor = .label
        calendarView.appearance.titleDefaultColor = .secondaryLabel
        
        calendarView.appearance.todayColor = .clear
        calendarView.appearance.weekdayTextColor = .label
        
        calendarView.placeholderType = .none
        
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .horizontal
    }
    
    func getNextMonth(date: Date) -> Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getPreviousMonth(date: Date) -> Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to: date)!
    }
    
    // MARK: - Selector
    
    @objc func tapNextMonth() {
        self.calendarView.setCurrentPage(getNextMonth(date: calendarView.currentPage), animated: true)
    }
    
    @objc func tapBeforeMonth() {
        self.calendarView.setCurrentPage(getPreviousMonth(date: calendarView.currentPage), animated: true)
    }
}

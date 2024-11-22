import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    /// 계산기 결과를 표시할 레이블
    private var displayLabel: UILabel!
    
    /// 버튼의 크기 (정사각형)
    /// 전체 너비(350) - (간격(10) × 3)) ÷ 4 = 80
    private let buttonSize: CGFloat = 80
    
    /// 연산자 버튼의 배경색 (오렌지색)
    private let operatorColor = UIColor.systemOrange
    
    /// 숫자 버튼의 배경색 (회색)
    private let numberColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDisplayLabel()
        setupNumberPad()
    }
    
    // MARK: - UI Setup Methods
    
    /// 상단 디스플레이 레이블 설정
    private func setupDisplayLabel() {
        displayLabel = UILabel()
        displayLabel.backgroundColor = .black
        displayLabel.textColor = .white
        displayLabel.text = "12345"  // 초기 표시값
        displayLabel.textAlignment = .right  // 우측 정렬
        displayLabel.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(displayLabel)
        
        // 레이블의 제약조건 설정
        displayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
    /// 계산기 숫자패드 설정
    private func setupNumberPad() {
        // 버튼 배열 구성 (4x4 그리드)
        let buttonConfigurations = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "×"],
            ["AC", "0", "=", "÷"]
        ]
        
        // 연산자 버튼을 구분하기 위한 집합
        let operators = Set(["+", "-", "×", "÷", "=", "AC"])
        
        // 각 행의 버튼들을 생성
        let rows = buttonConfigurations.map { row in
            row.map { title in
                let button = UIButton()
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                
                // 연산자면 오렌지색, 숫자면 회색으로 설정
                button.backgroundColor = operators.contains(title) ? operatorColor : numberColor
                
                // 원형 버튼을 위해 반지름을 버튼 크기의 절반으로 설정
                button.layer.cornerRadius = buttonSize / 2
                
                // 버튼 크기 제약조건 설정
                button.snp.makeConstraints {
                    $0.width.height.equalTo(buttonSize)  // 정사각형 형태
                }
                
                return button
            }
        }
        
        // 가로 스택뷰들을 생성
        let horizontalStackViews = rows.map { makeHorizontalStackView($0) }
        
        // 세로 스택뷰에 가로 스택뷰들을 추가
        let verticalStackView = makeVerticalStackView(horizontalStackViews)
        view.addSubview(verticalStackView)
        
        // 세로 스택뷰 제약조건 설정
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(displayLabel.snp.bottom).offset(60)  // 디스플레이 레이블과의 간격
            $0.width.equalTo(350)  // 전체 너비
            $0.centerX.equalToSuperview()  // 중앙 정렬
        }
    }
    
    /// 가로 스택뷰 생성
    /// - Parameter views: 스택뷰에 추가할 버튼들
    /// - Returns: 설정된 가로 스택뷰
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal  // 가로 방향
        stackView.backgroundColor = .black
        stackView.spacing = 10  // 버튼 간 간격
        stackView.distribution = .fillEqually  // 버튼들을 동일한 크기로 분배
        stackView.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return stackView
    }
    
    /// 세로 스택뷰 생성
    /// - Parameter views: 스택뷰에 추가할 가로 스택뷰들
    /// - Returns: 설정된 세로 스택뷰
    private func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical  // 세로 방향
        stackView.backgroundColor = .black
        stackView.spacing = 10  // 행 간 간격
        stackView.distribution = .fillEqually  // 모든 행을 동일한 크기로 분배
        return stackView
    }
}


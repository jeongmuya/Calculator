# iOS Calculator Clone

<p align="center">
  <img src="screenshot.png" width="300" alt="Calculator Screenshot">
</p>

## 📱 프로젝트 소개

iOS의 기본 계산기 앱을 클론 코딩한 프로젝트입니다. UIKit과 SnapKit을 활용하여 모던한 iOS 개발 방식을 적용했습니다.

### 주요 기능
- 기본적인 사칙연산 (덧셈, 뺄셈, 곱셈, 나눗셈)
- AC(All Clear) 기능
- 실시간 계산 결과 표시
- iOS 기본 계산기와 동일한 UI/UX

## 🛠 개발 환경
- iOS 14.0+
- Xcode 14.0+
- Swift 5.0
- CocoaPods

## 📦 사용된 라이브러리
```ruby
pod 'SnapKit', '~> 5.0.0'
```

## 🚀 시작하기

### 필요 조건
- Mac OS
- Xcode 14.0 이상
- iOS 14.0 이상
- CocoaPods

### 설치 방법

1. 저장소 클론
```bash
git clone https://github.com/yourusername/ios-calculator-clone.git
```

2. 프로젝트 디렉토리로 이동
```bash
cd ios-calculator-clone
```

3. Pod 설치
```bash
pod install
```

4. Xcode 실행
```bash
open Calculator.xcworkspace
```

## 📂 프로젝트 구조

```
Calculator/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewControllers/
│   └── ViewController.swift
├── Views/
│   └── CalculatorButton.swift
├── Models/
│   └── CalculatorBrain.swift
└── Resources/
    └── Assets.xcassets
```

## 🎯 주요 구현 사항

### 1. UI 구현
- SnapKit을 활용한 Auto Layout
- StackView를 활용한 계산기 버튼 그리드
- 다크모드 지원

### 2. 아키텍처
- MVC 디자인 패턴 적용
- 계산 로직과 UI 로직 분리

### 3. 최적화
- 메모리 누수 방지를 위한 적절한 접근 제어자 사용
- 재사용 가능한 컴포넌트 설계

## 🎨 UI/UX 특징

### 버튼 디자인
- 완벽한 원형 버튼
- 시스템 색상 사용으로 iOS 네이티브 느낌 구현
- 터치 피드백 구현

### 레이아웃
- 기기 크기에 따른 반응형 디자인
- 적절한 여백과 간격 유지

## 🔍 핵심 코드

### StackView 설정
```swift
private func setupNumberPad() {
    let buttonConfigurations = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "×"],
        ["AC", "0", "=", "÷"]
    ]
    // ... 구현 코드
}
```

### 버튼 생성
```swift
private func makeButton(withTitle title: String) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 33)
    button.backgroundColor = operators.contains(title) ? operatorColor : numberColor
    button.layer.cornerRadius = buttonSize / 2
    return button
}
```

## 📱 스크린샷

<p align="center">
  <img src="screenshot1.png" width="200" alt="Main Screen">
  <img src="screenshot2.png" width="200" alt="Calculation">
  <img src="screenshot3.png" width="200" alt="Dark Mode">
</p>

## 🔄 향후 업데이트 계획

- [ ] 단위 테스트 추가
- [ ] SwiftUI 버전 구현
- [ ] 계산 기록 저장 기능
- [ ] 추가 연산 기능 (제곱, 제곱근 등)
- [ ] 햅틱 피드백 개선

## 🤝 기여하

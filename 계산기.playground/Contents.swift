import UIKit


// 연산의 공통 동작을 정의하는 프로토콜
protocol Operation {
   func calculate(_ num1: Double, _ num2: Double) -> Double?
}

// 더하기 연산 클래스
class AddOperation: Operation {
   func calculate(_ num1: Double, _ num2: Double) -> Double? {
       return num1 + num2
   }
}

// 빼기 연산 클래스
class SubtractOperation: Operation {
   func calculate(_ num1: Double, _ num2: Double) -> Double? {
       return num1 - num2
   }
}

// 곱하기 연산 클래스
class MultiplyOperation: Operation {
   func calculate(_ num1: Double, _ num2: Double) -> Double? {
       return num1 * num2
   }
}

// 나누기 연산 클래스
class DivideOperation: Operation {
   func calculate(_ num1: Double, _ num2: Double) -> Double? {
       if num2 == 0 {
           print("0으로 나눌 수 없습니다")
           return nil
       }
       return num1 / num2
   }
}

// 나머지 연산 클래스
class RemainderOperation: Operation {
   func calculate(_ num1: Double, _ num2: Double) -> Double? {
       if num2 == 0 {
           print("0으로 나눌 수 없습니다")
           return nil
       }
       
       if num1.truncatingRemainder(dividingBy: 1) != 0 || num2.truncatingRemainder(dividingBy: 1) != 0 {
           print("나머지 연산은 정수만 가능합니다")
           return nil
       }
       
       return num1.truncatingRemainder(dividingBy: num2)
   }
}

// 계산기 클래스
class Calculator {
   // 각 연산 클래스의 인스턴스를 저장할 프로퍼티
   private let addOperation = AddOperation()
   private let subtractOperation = SubtractOperation()
   private let multiplyOperation = MultiplyOperation()
   private let divideOperation = DivideOperation()
   private let remainderOperation = RemainderOperation()
   
   // 더하기
   func add(_ num1: Double, _ num2: Double) -> Double? {
       return addOperation.calculate(num1, num2)
   }
   
   // 빼기
   func subtract(_ num1: Double, _ num2: Double) -> Double? {
       return subtractOperation.calculate(num1, num2)
   }
   
   // 곱하기
   func multiply(_ num1: Double, _ num2: Double) -> Double? {
       return multiplyOperation.calculate(num1, num2)
   }
   
   // 나누기
   func divide(_ num1: Double, _ num2: Double) -> Double? {
       return divideOperation.calculate(num1, num2)
   }
   
   // 나머지
   func remainder(_ num1: Double, _ num2: Double) -> Double? {
       return remainderOperation.calculate(num1, num2)
   }
}

// 테스트
let calculator = Calculator()

// 각 연산 테스트
print("더하기: \(calculator.add(10, 5) ?? 0)")
print("빼기: \(calculator.subtract(10, 5) ?? 0)")
print("곱하기: \(calculator.multiply(10, 5) ?? 0)")

if let divideResult = calculator.divide(10, 5) {
   print("나누기: \(divideResult)")
}

if let remainderResult = calculator.remainder(10, 3) {
   print("10을 3으로 나눈 나머지: \(remainderResult)")
}

import UIKit
import Foundation
import Combine

/*
 Combine은 애플이 제공하는 선언적 프레임워크로, Swift 언어에서 비동기 이벤트 처리를 위해 사용됩니다. Combine을 통해 비동기 데이터 스트림을 생성하고, 이를 변환하고 결합할 수 있습니다. 주요 구성 요소는 다음과 같습니다:

 Publisher: 이벤트를 방출하는 객체입니다. publisher(for:) 메서드를 통해 특정 알림에 대한 퍼블리셔를 생성할 수 있습니다.
 Subscriber: 퍼블리셔의 이벤트를 구독하는 객체입니다. sink 메서드를 통해 퍼블리셔를 구독할 수 있습니다.
 Operator: 퍼블리셔의 이벤트를 변환하거나 필터링하는 중간 단계의 함수입니다. 예를 들어 map 연산자를 통해 이벤트 데이터를 다른 형태로 변환할 수 있습니다.
 */

//Order 객체 생성
let pizzaOrder = Order()

//특정 알림에 대한 퍼블리셔 생성
let pizzaOrderPublisher = NotificationCenter.default.publisher(for: .didUpdateOrderStatus,
                                                               object: pizzaOrder)

//퍼블리셔를 구독. 알림이 발생할 때마다 알림 객체를 출력하고 덤프하기
pizzaOrderPublisher.sink { notification in
    print(notification)
    dump(notification)
}

//퍼블리셔의 이벤트를 map. 알림의 userInfo 딕셔너리에서 status값을 추출하고 OrderStatus 타입으로 변환합니다.
pizzaOrderPublisher.map { notification in
    notification.userInfo?["status"] as? OrderStatus ?? OrderStatus.placing
}
.sink { orderStaus in
    print("Order status [\(orderStaus)]")
}

pizzaOrderPublisher.compactMap { notification in
    notification.userInfo?["status"] as? OrderStatus
}
.assign(to: \.status, on: pizzaOrder)

print("Order: \(pizzaOrder.status)")

//NotiCenter로 .didUpdateOrderStatus 알림을 pizzaOrder 객체와 함께 게시. 딕셔너리에는 status키로 OrderStatus.processing값이 포함되어 있음
NotificationCenter.default.post(name: .didUpdateOrderStatus, object: pizzaOrder, userInfo: ["status": OrderStatus.processing])

NotificationCenter.default.post(name: .didUpdateOrderStatus, object: pizzaOrder, userInfo: ["status": OrderStatus.delivered])


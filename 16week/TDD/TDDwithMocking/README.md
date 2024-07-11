#  TDD......

## TDD란??

코드를 작성하기 전에 테스트 케이스를 먼저 작성하고, 이 테스트 케이스를 통과하는 코드를 작성하는 방법론

Red - Green - Refactor 사이클을 통해 구현됨.

- Red: 테스트가 실패하는 상태
- Green: 테스트를 통과하는 최소한의 코드를 작성
- Refactor: 코드를 정리하는 단계

## TDDwithMocking APP 설명

### 테스트 코드 작성 (Red단계)
TDDwithMockingTests.swift 이 파일은 테스트 케이스를 정의한 곳입니다.
첫번째 단계인 Red 단계
테스트가 실패하도록 구현되지 않은 기능을 정의

### 간단한 구현 작성 (Green 단계)

User.swift: 사용자 정보 모델
UserService.swift: 프로토콜을 작성하여 의존성 역전
UserManager.swift: UserService를 사용하여 사용자 정보 관리 클래서 구현
MockUserService.swift: UserService 프로토콜을 구현한  Mock객체.



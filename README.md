### SwiftUI의 장점과 단점
- 장점 : 선언적 구문, 간결한 코드로 가독항 향상 및 유지보수 용이 손쉬운 View조합을 통한 구현, Modifier Chaing을 통한 편리한 구현 Preview의 강력한 기능
- 단점 : 아직 UIKitㅇ르 전부 대체하지 못함 낮은 버전에서 사용시 버그가 많음 아직도 매 버전마다 변겨되는 부분들이 많음

### SwiftUI의 View Layout 결정 원리

1. 부모는 자식에게 크기를 제안합니다.
2. 자식은 자신의 크기를 선택합니다.
3. 부모는 자식을 부모의 좌표 공간에 배치합니다.

모든 레이아웃의 결정은 부모와 자식 간의 상호작용을 통해 결정된다고 합니다. Swift을 배우면서 이 부분이 가장 생소하고 오 신기한데 싶은 부분이었습니다.

![](https://velog.velcdn.com/images/jakdangers/post/adaee442-9787-4277-910a-0e20b110b3b8/image.png)

위와 같은 단순한 코드를 작성하더라도 부모와 자식간의 상호작용으로 레이아웃이 결정 된다고 하니 이 부분을 잘 숙지해야 앞으로 화면을 표현하는데 문제가 없을것이라 생각이 들었습니다.

body가 있는 최상위 뷰는 항상 layout neutral(레이아웃 중립)입니다. 레이아웃 중립의 bounds는 하위 뷰의 bounds을 따라간다고 합니다.

위의 예시에 적용해보면
1. root view는 사용 할 수 있는 모든 영역을 제시합니다.
2. content view는 body을 갖고 있고 레이아웃 중립이고 하위 뷰의 bounds을 갖습니다. 따라서 Contentview의 bounds는 body에 의해 결정됩니다.
3. backgound은 레이아웃 중립이기에 제안을 패딩에게 넘깁니다.
4. 패딩은 각 영역의 20 만큼 만듭니다.
5. 해당 텍스트를 나타낼만큼 사이즈를 정합니다.
6. 패딩은 텍스트의 지정된 크기보다 20만큼 더 큰 크기로 사이즈를 결정합니다.
7. 백그라운드는 6번까지의 정해진 사이즈에 컬러를 적용합니다.
8. 별도의 위치지정이 없다면 센터에 레이아웃이 배치되고 화면에 나타납니다.

### 프로퍼티와 프로퍼티 래퍼

프로퍼티(Property)는 클래스, 구조체, 열거형 등의 타입 내부에 선언되어 값을 저장하거나, 값을 계산하거나, 특정 동작을 수행하는 데 사용되는 멤버입니다. 프로퍼티는 해당 타입의 특징과 상태를 표현하고 데이터를 관리하는 역할을 합니다.

프로퍼티는 멤버 변수의 다른이름과 같다고 생각되어 쉽게 이해 할 수 있었습니다.

하지만 프로퍼티 래퍼를 처음 경험 했을 때는 Swift의 프로퍼티 래퍼(Property Wrapper)와 React의 useState는 비슷한 개념을 가지고 있지만 생소한 개념이 있어서 쉽게 이해하기 어려웠던것 같습니다.

제가 생각하는 비슷 한 점

값 저장 및 관리: Swift의 프로퍼티 래퍼와 React의 useState는 모두 값을 저장하고 관리하는 데 사용됩니다. 이들을 통해 변수 또는 상태 값을 선언하고 이를 효율적으로 업데이트할 수 있습니다.

상태 변경 감지: 둘 다 값의 변경을 감지하고 새 값을 반영합니다. React의 useState는 컴포넌트 상태(state)를 관리하며, 값이 변경될 때 컴포넌트를 다시 렌더링하도록 트리거합니다. Swift의 프로퍼티 래퍼는 값이 변경될 때 관찰자 프로퍼티 감시자를 사용하여 추가 작업을 수행할 수 있습니다.

제가 생각하는 차이점

사용 사례: React의 useState는 주로 웹 애플리케이션에서 컴포넌트 상태를 관리하는 데 사용됩니다. Swift의 프로퍼티 래퍼는 Swift에서 변수와 속성을 더욱 간결하게 관리하고 커스터마이즈하는 데 사용됩니다.

구현 방식: React의 useState는 함수형 컴포넌트 내에서 훅으로 사용됩니다. Swift의 프로퍼티 래퍼는 클래스 또는 구조체 내에서 사용되며, 사용자 정의 프로퍼티 래퍼를 작성하여 동작을 커스터마이즈할 수 있습니다.

가장 흥미로웠던것은 래핑된 값 외에도 프로퍼티 래퍼는 투영된 값 (projected value) 정의에 의해 추가적인 기능을 노출할 수 있습니다. 래핑 된 값의 변경에 따른 로직이 필요한 경우 별도로 번거롭게 구현해야하는데 이 부분이 대폭 감소 될 수 있는 것 같아 보일러플레이트가 줄어들겠구나 생각이 들었습니다.

![](https://velog.velcdn.com/images/jakdangers/post/7ba805e2-42de-4263-b474-d0de383cc247/image.png)

### 이번 프로젝트에서 사용하는 프로퍼티 래퍼

아래와 같이 8가지의 프로퍼티 래퍼를 사용하였습니다. 각각의 용도는 아래에 기술하겠습니다.

1. @State
2. @Binding
3. @ObservedObject
4. @Published
5. @ObservableObject
6. @StateObject
7. @Environment
8. @EnviromentObject

#### @State
- SwiftUI에서 상태를 처리하는 방법
- 뷰의 상태를 저장하는 프로퍼티로 상태 관리 주체는 해당 뷰
- 기본적으로 Private 선언이기에 다른 뷰와 소통하려면 Binding을 이용
- 갑이 변경될 때마다 UI 업데이트

#### @Binding
- 뷰와 상태를 바인딩하는 방법
- 상위 @State 변수를 전달 받아 하위 뷰에서 변화 감지 및 연결
- Binding은 다른 뷰가 소유한 속성을 연결하기에 소유권 및 저장 공간이 없음

#### @ObservableObject
- 클래스 프로토콜로 관찰하는 어떠한 값이 변경되면 변경사항을 알려줌
- 뷰에서 인스턴스 변화를 감시하기 위해 뷰모텔 객체로 생성 할 때 사용 할 수 있음

#### @Published
- ObservableObject를 구현한 클래스 내에서 프로퍼티 선언시 사용
- @Published로 선언된 프로퍼티를 뷰에서 관찰 할 수 있음
- ObservableObject의 ObjectWillChange.send()기능을 @Published 프로퍼티가 변경되면 자동으로 호출

#### @ObservedObject
- 뷰에서 ObservableObject 타입의 인스턴스 선언시 사용
- ObservableObject의 값이 업데이트되면 뷰를 업데이트

#### @StateObject
- 뷰에서 ObservableObject 타입의 인스턴스 선언시 사용
- 뷰마다 하나의 인스턴스를 생성하며 뷰가 사라지기 전까지 같은 인스턴스 유지
- @ObservedObject의 뷰 렌더링시 인스턴스 초기화 이슈 해결을 위한 방법
- 매번 인스턴스가 새롭게 생성되는것처럼 외부에서 주입 받는 경우가 아닌 최초 생성 선언시에 @StateObject를 사용하는 것이 적절한 방법

#### @Environment
- 미리 정의되어 있는 시스템 공유 데이터
- 사용하려는 공유 데이터의 이름을 keyPath로 전달하여 사용
- 시스템 공유 데이터는 가변하기에 var로 선언 필요
- 뷰가 생성되는 시점에 값이 자동으로 초기화 됨

#### @EnvironmentObject
- ObservableObject를 통해 구현된 타입의 인스턴스를 전역적으로 공유하여 사용
- 앱 전역에서 공토으로 사용 할 데이터를 주입 및 사용





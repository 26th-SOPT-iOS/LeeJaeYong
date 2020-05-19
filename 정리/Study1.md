# 화면 전환 및 화면 간 데이터 전달

### Segue를 이용

Segue(세그웨이)는 두 개의 ViewController 사이 연결된 화면 전환 객체라고 한다. 

1. Show: Navigation Controller 연결이 되어 있을 시, Push, 아닌 경우 Present
2. Show Detail: 아이패드에서 사용(즉, 아이폰에선 필요 ❌), Push가 아닌 Replace 방식 사용?
3. Present Modally: Present 방식 전환, Modal Style, Transition Style을 사용하여 여러 방식으로 전환이 가능
4.  Popover Presentation: 아이패드에서 사용(즉, 아이폰에선 필요 ❌), 작은 Popup 형태의 뷰를 띄움

위 Segue를 storyboard에서 show나 present Modally로 연결해주면 끝! 코드로 이 Segue에 접근하고 싶다면 identifier을 주고 아래와 같이 접근하면 된다. prepare 함수는 Cocoa Touch Class로 클래스를 만들 때 UIViewController를 Subclass로 줄 경우 주석 달려서 생성되는 함수이다. 다음화면으로 데이터를 전달하거나 애니메이션, 화면크기 등에 접근할 때 쓰인다. 

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FirstToOrange" {
            let destinationVC = segue.destination as! OrangeViewController
            destinationVC.modalPresentationStyle = .fullScreen        
    		}
}
```

또한 버튼을 통해 Segue를 주지않고 화면 간 연결했을 경우 아래와 같은 Segue를 이용하여 코드로 뷰를 넘기는 것이 가능하다.

```swift
self.performSegue(withIdentifier: "FirstToOrange", sender: self)
```



단순히 다음 화면으로 데이터를 넘기며 넘어가는 경우에는 위와 같은 방식이 깔끔하다. 하지만❗️ Segue를 이용하여 storyboard에 뷰들을 연결하면 너무 더러워 보인다. 조금 더 깔끔하게 하기 위해서는 Segue를 연결하지 않고 화면 전환과 데이터 전달이 이루어져야한다. 또한 탭바나 네비게이션바를 이용하여 화면 전환을 할 경우에는 perpare함수를 사용하여 넘길 수는 없다.(넘길 수는 있지만 일일이 Segue를 다 연결해주어야 하므로 너무 더러움) 그래서 아래와 같은 방법으로도 넘길 수 있다.

넘어가는 버튼을 생성 후 IBAction으로 연결한 후 코드를 써준다. 

```swift
guard let orangeVC = self.storyboard?.instantiateViewController(identifier: "OrangeViewController") as? OrangeViewController else { return }
orangeVC.modalPresentationStyle = .fullScreen
orangeVC.
self.present(orangeVC, animated: true, completion: nil)
```

### Navigation을 이용

네비게이션 바를 이용할 경우엔 먼저 가장 시작 VC를 Navigation Controller를 embed in 한다. 그 후 Segue를 storyboard에서 show로 연결해주면 끝! 이 때 보통은 버튼을 드래그드롭하여 화면을 연결하지만 VC끼리 연결할 경우 바로 아래 코드를 이용하여 화면 전환 및 데이터 전달이 가능하다. 

```swift
guard let sVC = self.storyboard?.instantiateViewController(identifier: "SViewController") as? SViewController else { return }
self.navigationController?.pushViewController(sVC, animated: true)
```

네비게이션 컨트롤러는 스택구조로 이루어져 있다. 따라서 VC를 pop하거나 push를 하여 화면 이동이 가능하다.

```swift
self.navigationController?.popViewController(animated: true)
```

popToRootViewController() 함수는 모든 VC들을 스택에서 pop해주어 바로 rootVC로 화면 전환이 가능하다.

popToViewController() 함수는 특정 VC가 나올 때까지 모든 VC들을 스택에서 pop해준다.
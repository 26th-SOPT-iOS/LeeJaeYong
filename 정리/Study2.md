# 네비게이션바 정리

### 네비게이션바 없애기

정말 여러가지 방법이 있다. 화면이 실행중에 user의 반응에 따라 네비게이션바를 숨길 수도 있지만 화면전환이 되었을 때 네비게이션 바가 나타나지 않도록 하는 코드는 아래와 같다. 이를 veiwWillApper에 넣으면 viewWillDisapper에도 함께 넣어주어야 다른 화면에 영향을 미치지 않는다.

```swift
//1
navigationController?.setNavigationBarHidden(true, animated: true)
//2
navigationController?.isNavigationBarHidden = true
//3
navigationController?.navigationBar.isHidden = true
```

네비게이션바가 user의 제스처에 따라 사라지는 함수는 이 링크를 참고하자 👉 https://developer.apple.com/documentation/uikit/uinavigationcontroller 

<img src="https://user-images.githubusercontent.com/56102421/82384281-7ea25480-9a6a-11ea-860e-e33c7fb921a8.png" width="50%"> 

### 네비게이션바 커스텀

- 네비게이션바 스타일(Change the Bar Style)

```swift
// Black Trnaslucent
self.navigationController!.navigationBar.barStyle = .black
self.navigationController!.navigationBar.isTranslucent = true
self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)

```


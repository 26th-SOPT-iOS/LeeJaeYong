# LeeJaeYong

이재용

26th SOPT iOS세미나 실습과 과제를 올리는  레포입니다 😄



## 목차

- [1주차 세미나](#1주차-세미나)

  - 과제
    - [Navigation 활용 화면 이동](#Navigation-활용-화면-이동)
    - [로그인 화면 구현](#로그인-화면-구현)

- [2주차 세미나](#2주차-세미나)

  - 과제
  - [계산기 오토레이아웃 구현](#계산기-오토레이아웃-구현)
    - [로그인 뷰 및 스크롤 뷰 구현](#로그인-뷰-구현)

- [3주차 세미나](#3주차-세미나)

- [4주차 세미나](#4주차-세미나)

- [5주차 세미나](#5주차-세미나)

- [6주차 세미나](6주차-세미나)

  

## 1주차 세미나

### 과제

✅ Navigation 활용 화면 이동

<img alt="스크린샷 2020-04-22 오후 9 19 25" src="https://user-images.githubusercontent.com/56102421/79982875-eb651600-84e1-11ea-9d66-7ebb14009498.png" width="20%" /><img alt="스크린샷 2020-04-22 오후 9 19 28" src="https://user-images.githubusercontent.com/56102421/79982885-eef89d00-84e1-11ea-9b5b-89dc071d8b54.png" width="20%" /><img alt="스크린샷 2020-04-22 오후 9 19 32" src="https://user-images.githubusercontent.com/56102421/79982890-f15af700-84e1-11ea-8572-6c0912f7e1a2.png" width="20%" />


✅ 로그인 화면 구현

<img alt="스크린샷 2020-04-22 오후 9 21 14" src="https://user-images.githubusercontent.com/56102421/79982577-801b4400-84e1-11ea-94f5-02f986b76d6a.png" width="20%" /><img alt="스크린샷 2020-04-22 오후 9 21 30" src="https://user-images.githubusercontent.com/56102421/79982746-c1135880-84e1-11ea-8731-6387d37b4e3c.png" width="20%" /><img alt="스크린샷 2020-04-22 오후 9 21 18" src="https://user-images.githubusercontent.com/56102421/79982815-d5efec00-84e1-11ea-9c95-2002f647370b.png" width="20%" />


loginVC -> signupVC -> completeVC 경로에서 로그아웃할 때 loginVC로 이동하기 위해 필요한 코드

~~~swift
if let navController = self.navigationController {
                navController.popViewController(animated: true)
}
~~~

> nav controller에 쌓인 VC를 pop한다.





## 2주차 세미나 

### 과제

✅ 계산기 오토레이아웃 구현

<img alt="스크린샷 2020-04-29 오후 12 02 58" src="https://user-images.githubusercontent.com/56102421/80557353-93fb0480-8a11-11ea-9045-ae40bde210a7.png" width = "30%" /> <img alt="스크린샷 2020-04-29 오후 12 03 18" src="https://user-images.githubusercontent.com/56102421/80557416-d3295580-8a11-11ea-881b-852c0c774fbe.png" width = "30%" />

**스택뷰 constraint**

<img alt="스크린샷 2020-04-29 오후 12 22 09" src="https://user-images.githubusercontent.com/56102421/80558111-1a184a80-8a14-11ea-894d-0dc11de82409.png" width="30%"/> 

🙋🏿‍♂️ 질문했던 점

뷰를 1:1로 주고 싶은데 어떻게 하나요?

- 원으로 만들기 위해서는 버튼이 정사각형이어야 하므로 가장 바깥쪽 스택뷰의 width를 아래, 왼쪽, 오른쪽의 constraint로 고정시킨 후, height를 width와 1:1 apect ratio를 줘야 한다. Aspect ratio는 constraint를 주는 곳에서 줄 수 있거나, 드래그드롭 방식을 자기자신한테 적용해서 줄 수 있다.

버튼은 정사각형인데 다른 기기에서는  원이 이상한 타원이나 나뭇잎으로 만들어 지는 상황

- 둥글게 만드는 코드를 viewDidLoad 함수내에 적지말고 viewWillAppear 함수내에 적는다. viewDidLoad는 storyboard기준으로 코드를 실행시키기 때문에 오류가 생긴다. 

✅ 로그인 뷰 구현

<img width="300" alt="스크린샷 2020-04-29 오후 1 12 08" src="https://user-images.githubusercontent.com/56102421/80560230-22c04f00-8a1b-11ea-83a4-37600a6088e9.png"> <img width="300" alt="스크린샷 2020-04-29 오후 1 12 22" src="https://user-images.githubusercontent.com/56102421/80560324-76cb3380-8a1b-11ea-9df4-5faef84db1ec.png"> 



**Text Underline**

Attribute inspector title 클릭 -> Attributed -> 밑줄 긋고 싶은 text 드래그 오른쪽클릭 -> Font 

**NavigationBar**

- 숨기기

```swift
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
}
override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
}
```

- NavigationBar bottom bolder line 없애기 및 Back버튼 글씨 없애기

```swift
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backItem?.title = ""
}
```

> 네번째 줄 코드로 인해 뷰의 색깔과 바의 색깔이 일치됌

**TextField**

- TextField와 button 둥글게 만들기

```swift
idTextField.layer.cornerRadius = 22
passwordTextField.layer.cornerRadius = 22
signInButton.layer.cornerRadius = 24
```

- TextField 들여쓰기

```swift
import UIKit
@IBDesignable
class FormTextField: UITextField {

    @IBInspectable var inset: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect { 
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect { 
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0))
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)) 
    }

}
```

> textRect: text field의 text를 위한 rectangle을 반환 (없으면 text 들여쓰기 x)
>
> placeholder: text field의 placeholder를 위한 rectangle을 반환 (없으면 placeholder 들여쓰기 x)
>
> editingRect: text field가 편집되는 동안의 text를 위한 rectangle을 반환 (없으면 글자가 쳐지는 순간 들여쓰기 x)
>
> bounds.inset(by: UIEdgeInsets()): 잘 모르겠지만 바로 위의 view나 textfield를 기준으로 사각형 만듬..?
>
> @IBInspectable : inspector builder의 속성을 주어 default 속성들이 아닌 것들에 접근 가능
>
> @IBDesignable : 위 IBInspectable은 프로젝트를 실행을 시켰을 때만 적용이 되는데, 이 값을 주면 실시간으로 interface Builder에 적용 가능

위 코드 파일 추가후 identity inspector에서 custom class 추가하면 attribute inspector에 inset 속성이 생긴다!

참고  👉 https://zeddios.tistory.com/270 

✅ 스크롤뷰 

<img src="https://user-images.githubusercontent.com/56102421/80563071-db3ec080-8a24-11ea-9176-dd965b1a7b08.gif" alt="scrollView" width = "300" />  

**content Inset Adjustment Behavior**

scrollView의 imageview가 safeArea를 덮게 하고 싶어 위의 속성을 never로 주었다.

참고 👉 https://zeddios.tistory.com/809




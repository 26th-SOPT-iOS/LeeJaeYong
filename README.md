# LeeJaeYong

26th SOPT iOS세미나 실습과 과제를 올리는  레포입니다 😄



## 목차

- [1주차 세미나](#1주차-세미나)
  - Navigation 활용 화면 이동
  - 로그인 화면 구현
- [2주차 세미나](#2주차-세미나)
  - 계산기 오토레이아웃 구현
  - 로그인 뷰 및 스크롤 뷰 구현
- [3주차 세미나](#3주차-세미나)
  - 카카오톡 친구리스트 뷰 구현 (테이블 뷰 사용)
- [4주차 세미나]()
- [5주차 세미나]()
- [6주차 세미나]()
- [7주차 세미나]()

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

✅ 도전과제

<img src="https://user-images.githubusercontent.com/56102421/80914828-335d2600-8d89-11ea-96fa-ca5e0aa6c68e.gif" width = "300" />  

completeViewController 파일 안에 추가

```swift
//MARK: - UIScrollViewDelegate
extension CompleteViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewOffSet = scrollView.contentOffset.y //음수
        if scrollViewOffSet < 0.0 {
            heightLayout.constant = soptImageHeightConstant - scrollViewOffSet
        } else {
            let newHeight: CGFloat = soptImageHeightConstant - scrollViewOffSet > minHeight ? soptImageHeightConstant - scrollViewOffSet : minHeight
            heightLayout.constant = newHeight
        }
    }
}
```

> scrollViewDidScroll: user가 content view를 스크롤했을 때 호출되는 함수
>
> contentOffset: content view의 원점(화면 전체를 content view라고 하면 (0, 0))이 스크롤 뷰의 원점에서의 차이 값

그 외 해야할 것들

변수 선언 

```swift
let minHeight: CGFloat = 140
var soptImageHeightConstant: CGFloat = 210
```

ViewDidLoad

```swift
scrollView.delegate = self
soptImageHeightConstant = soptImage.frame.height
```

> frame.height와 frame.size.height는 같다. 하지만 변경하고 싶다면 frame.size.height를 이용해야한다. 
>
> 참고 👉 https://zeddios.tistory.com/242

🤯 계속 헤매서 질문하고 다른 레포참고 했던 부분

뷰가 확대되기는 하는데 scrollView랑 같이 내려오는 점

<img src="https://user-images.githubusercontent.com/56102421/80914287-9baa0880-8d85-11ea-8e9d-6e4cf8f2f3a7.gif" width = "40%" /> 

- sopt 이미지가 scrollView안에 위치하면 안된다. 뷰를 짜줄 때 아래와 같이 scrollView와 같은 위치에 있어야 한다. 또한 Sopt Image가 Scroll View보다 위에 위치하면 Scroll View에 가려져서 보여지지 않게 된다. 뷰가 위에서부터 밑으로 쌓인다.

<img src="https://user-images.githubusercontent.com/56102421/80915153-483ab900-8d8b-11ea-8390-f9fa6fcbd3b0.png" width="30%" >  

뷰가 끊임없이 커지고 스크롤을 위로 올려도 작아지지 않는 점

- 스크롤할 때마다 soptImage의 높이를 바꿀 때 새로 지정해준 높이를 불러와서 끊임없이 커지게 된 것이다. soptImage의 초기높이를 상수로 지정을 해놓아야 새 높이를  `초기높이 + offset` 로  바꿀 수 있다. 이 초기높이는 ViewDidLoad함수 밖에 변수를 선언한 후, ViewDidLoad안에서 값을 넣어 줄 수 있다. 



## 3주차 세미나

과제

✅ 카카오톡 친구리스트 뷰 구현 (테이블 뷰 사용)

<img src="https://user-images.githubusercontent.com/56102421/81951471-26b9b700-9640-11ea-9847-dc07e43acaba.png" width="30%"> <img src="https://user-images.githubusercontent.com/56102421/81951496-2f11f200-9640-11ea-8f48-0f5b14712f1a.png" width="30%" > 

FriendTableViewController 파일 내 UITableViewDataSource 함수 안에 추가

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = friendTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        if indexPath.row == 0 && indexPath.section == 0 {
            
            friendCell.heightConstraintOfImage.constant = 60
            friendCell.widthConstraintOfImage.constant = 60
            friendCell.profileImage.contentMode = .scaleAspectFill
            friendCell.nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
            friendCell.outStackView.spacing = 13
            friendCell.topConstraintOfOutStackView.constant = 15
            friendCell.setFriendInfo(person: friendInfos[indexPath.row])
            
            // line
            let separatorView = UIView.init(frame: CGRect(x: 15, y: 	friendCell.frame.size.height - 1, width: friendCell.frame.size.width - 30, height: 1))
            separatorView.backgroundColor = .systemGray2
            friendCell.contentView.addSubview(separatorView)
            
            return friendCell
        } else {
            
            friendCell.heightConstraintOfImage.constant = 50
            friendCell.widthConstraintOfImage.constant = 50
            friendCell.profileImage.contentMode = .scaleAspectFill
            friendCell.nameLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
            friendCell.outStackView.spacing = 22
            friendCell.topConstraintOfOutStackView.constant = 6
            
            friendCell.setFriendInfo(person: friendInfos[indexPath.row + 1])
            
            return friendCell
        }
    }
```

> 섹션을 두개로 만들어 하나는 나의 cell, 또 다른 하나는 친구 cell 로 만들어주었다.
>
> 첫번째 섹션은 cell 뷰가 바뀌므로 if문으로 분기처리하였다.
>
> line은 seperator를 지워주었기 때문에 코드로 만들어주었다. headerCell 가장 밑에서 1 위에 두께 1만큼의 선을 만들었다.

그 외 수정한 부분

뷰 연결 

<img src="https://user-images.githubusercontent.com/56102421/81952777-d93e4980-9641-11ea-943b-3726a386ac4a.png" width= "50%" >  

```swift
guard let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else { return }
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
```

> 최상위 TabBarController에 identity를 주어 로그인 또는 회원가입을 하면 저 곳으로 넘어가게 고쳐주었다.

🤯 정리하고 싶은 거나 다른 코드 참고한 부분!

- 섹션 헤더뷰를 코드로 짜는 법을 몰라 헤매고 있어서 승호형 코드를 가져다 썼어요! 짱이다정말 ㅠㅠ 

- UIFont를 코드로 바꾸는 법

```swift
for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
```

> 이 코드는 현재 맥에 저장되어 사용할 수 있는 폰트이름들을 출력해준다.

```swift
friendCell.nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
```

> 위에서 알아낸 폰트 이름을 이용하여 폰트와 사이즈, 볼드체, 이탈리어체 등등 바꿀 수 있다.
>
> 참고 👉 https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app
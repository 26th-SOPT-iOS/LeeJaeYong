# LeeJaeYong

이재용

26th SOPT iOS세미나 실습과 과제를 올리는  레포입니다 😄

----

## 목차

- [1주차 세미나](#1주차-세미나)
- [2주차 세미나](#2주차-세미나)
- 

----

## 1주차 세미나

### 과제

✅ [Navigation 활용 화면 이동](https://github.com/26th-SOPT-iOS/LeeJaeYong/tree/master/iOS-firstweek_seminar_assignment)

<img width="502" alt="스크린샷 2020-04-22 오후 9 19 25" src="https://user-images.githubusercontent.com/56102421/79982875-eb651600-84e1-11ea-9d66-7ebb14009498.png" style="zoom:20%;" />
<img width="502" alt="스크린샷 2020-04-22 오후 9 19 28" src="https://user-images.githubusercontent.com/56102421/79982885-eef89d00-84e1-11ea-9b5b-89dc071d8b54.png" style="zoom:20%;" />
<img width="502" alt="스크린샷 2020-04-22 오후 9 19 32" src="https://user-images.githubusercontent.com/56102421/79982890-f15af700-84e1-11ea-8572-6c0912f7e1a2.png" style="zoom:20%;" />


✅ [로그인 화면 구현](https://github.com/26th-SOPT-iOS/LeeJaeYong/tree/master/iOS_firstAssignment_login)

<img width="502" alt="스크린샷 2020-04-22 오후 9 21 14" src="https://user-images.githubusercontent.com/56102421/79982577-801b4400-84e1-11ea-94f5-02f986b76d6a.png" style="zoom:20%;" />
<img width="502" alt="스크린샷 2020-04-22 오후 9 21 30" src="https://user-images.githubusercontent.com/56102421/79982746-c1135880-84e1-11ea-8731-6387d37b4e3c.png" style="zoom:20%;" />
<img width="502" alt="스크린샷 2020-04-22 오후 9 21 18" src="https://user-images.githubusercontent.com/56102421/79982815-d5efec00-84e1-11ea-9c95-2002f647370b.png" style="zoom:20%;" />


loginVC -> signupVC -> completeVC 경로에서 로그아웃할 때 loginVC로 이동하기 위해 필요한 코드

~~~swift
if let navController = self.navigationController {
                navController.popViewController(animated: true)
~~~

> nav controller에 쌓인 VC를 pop한다.


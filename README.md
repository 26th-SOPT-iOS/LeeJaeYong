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

<img src="/Users/jyong/Desktop/스크린샷 2020-04-22 오후 9.19.25.png" alt="스크린샷 2020-04-22 오후 9.19.25" style="zoom:20%;" /><img src="/Users/jyong/Desktop/스크린샷 2020-04-22 오후 9.19.28.png" alt="스크린샷 2020-04-22 오후 9.19.28" style="zoom:20%;" /><img src="/Users/jyong/Desktop/스크린샷 2020-04-22 오후 9.19.32.png" alt="스크린샷 2020-04-22 오후 9.19.32" style="zoom:20%;" />	

✅ [로그인 화면 구현](https://github.com/26th-SOPT-iOS/LeeJaeYong/tree/master/iOS_firstAssignment_login)

<img src="/Users/jyong/Desktop/스크린샷 2020-04-22 오후 9.21.14.png" alt="스크린샷 2020-04-22 오후 9.21.14" style="zoom:20%;" /><img src="/Users/jyong/Desktop/스크린샷 2020-04-22 오후 9.21.30.png" alt="스크린샷 2020-04-22 오후 9.21.30" style="zoom:20%;" /><img src="/Users/jyong/Desktop/스크린샷 2020-04-22 오후 9.21.18.png" alt="스크린샷 2020-04-22 오후 9.21.18" style="zoom:20%;" />

loginVC -> signupVC -> completeVC 경로에서 로그아웃할 때 loginVC로 이동하기 위해 필요한 코드

~~~swift
if let navController = self.navigationController {
                navController.popViewController(animated: true)
~~~

> nav controller에 쌓인 VC를 pop한다.


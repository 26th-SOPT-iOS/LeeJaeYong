# TableViewCell 

### Cell 생성 코드 차이

```swift
// 1
let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
// 2 
let cell = UITableViewCell(style: .default, reuseIdentifier: "TodoItemCell")
```

> 첫번째는 cell을 다시 활용한다는 뜻으로, 한 번 생성한 cell을 밑으로 scroll할 때 다시 사용한다. 즉, 이는 cell의 property가 그대로 전달될 수 있다! 따라서, 이 방식을 사용할 경우, cell에 적힌 데이터를 위주로 cell의 속성을 정해주어야 한다. 데이터에 대한 모델들을 만들어주는게 좋다.
>
> 두번째는 scroll할 때 보이는 cell들의 메모리를 할당해준다는 것이다. cell들이 보이지 않는다면 메모리를 지워 그 cell이 없어지게 만든다.

### UserDefault

: iOS내의 작은 데이터베이스라고 생각한다. 아주 간단한 정보들을 plist를 만들어 저장하여 앱이 백그라운드내에 있을 때도 데이터가 남아있게 해준다. 하지만 이는 커스텀된 데이터타입은 저장할 수 없다. Singleton 으로 쓰여져 있다.

```swift
UserDefault.standard.set(value, forKey: "")
UserDefault.standard.Array(forKey: "")
```



### Decoding/Encoding with NSCoder

: UserDefault와 같이 plist 파일을 만들어 관리하지만 커스텀된 객체(Struct, Class)도 작성가능하다!

```swift
print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
```

> 다음 명령을 통해 현재 프로젝트의 위치를 알 수 있다.

```swift
// Encoding
func saveItems() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath)
        } catch {
            print("Error encoding item array, \(error)")
        }
}
// Decoding
func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array")
            }
        }
}
```

> Encoding/Decoding 의 개념은 음악을 디스크에 저장하는 행위와 비슷하다. 
>
> Encoder: Music -> Disk
>
> Decoder: Disk -> Music

### iOS 앱 내에서 데이터 저장 방식

| Method       | Use                                                     |      |
| ------------ | ------------------------------------------------------- | ---- |
| UserDefaults | 적은 양의 데이터를 빠르게 저장하고 지울 수 있을 때      | E    |
| Codable      | 위와 같지만 custom된 객체를 저장할 때                   | E    |
| Keychain     | 보안용                                                  | E    |
| SQLite       | 많은 양의 데이터를 저장하고 query시킬 때 ex) MYSQL, SQL | H    |
| Core Data    | 객체 지향 DB                                            | H    |
| Realm        | 빠르고 쉬운 DB                                          | H    |

> 위 세개는 plist나 개인 table을 만들어 작은 양의 테이터를 저장하고 싶을 때 사용하는 방식이고,
>
> 밑에 새개는 DB를 이용하여 더 복잡한 데이터와 복잡한 코드를 사용하는 방식이다.

## Core Data 

1. 새로운 Core Data 파일 추가
   - Add Entitiy -> Add Attribute -> Class Module을 Current Product Module로 설정(안할 시, 프로젝트가 복잡해질수록 오류가 남) 
   - Codegen 설정
     1. Class Definition: Default로 우리가 설정한 Entity를 클래스와 속성으로 바꿔주어 자동으로 클래스를 생성한 것처럼 해준다. 하지만 직접 우리가 파일내에 코드를 작성할 수는 없다. 
     2. Category/Extension: 그 파일내에 코드를 작성하기 위해서 이 속성을 체크한 후 Entity 이름과 같은 파일을 생성한다. 그럼 xcode가 자동으로 코드를 연결해준다.(가장 많이 쓰임)
     3. Manual/None: 이건 파일을 만들어주지 않음.(가장 안쓰임)

```swift
// MARK: - Core Data stack
lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "DataModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {      
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()
    
// MARK: - Core Data Saving support
func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {              
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
```

> Context는 Git에서 Staging Area와 같음

#### Data 저장하기/불러오기

viewContext에 접근 방식

```swift
let newItem = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
```

> UIApplication의 싱글톤 shared의 UIApplicationDelegate에서 AppDelegate 클래스로 캐스팅한다. 그럼 이제 property로 접근이 가능하다.

```swift
let newItem = Item(context: self.context)
newItem.title = textField.text!
newItem.done = false
newItem.parentCategory = self.selectedCategory
self.itemArray.append(newItem)            
self.saveItems()

func saveItems() {
    do {
      try context.save()
    } catch {
       print("Error saving context \(error)")
    }       
    self.tableView.reloadData()
}
```


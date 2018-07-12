# Пример работы с Texture

# Что такое Texture?
Texture - это фреймворк для iOS, построенный поверх UIKit, который позволяет сохранить даже самые сложные пользовательские интерфейсы плавными и отзывчивыми. Чтобы этого достичь, Texture позволяет вынести дорогостоящие операции (декодирование изображений, вычисление позиций и т.п.) из основного потока, что бы он тем самым был доступен для взаимодействия с пользователем.

# Какие инструменты предоставляет Texture для разработчиков?
Texture предоставляет различные абстракции над стандартными UI элементами(например UIView, UIImage). Основные её элементы это узлы (Nodes) и контейнеры узлов (Node Containers). 
> Максимальная производительность достигается только тогда, когда все узлы содержатся в контейнерах, потому что именно контейнеры отвечают за передачу состояний в узлы. Использование узлов вне специальных контейнеров не даст улучшения производительности, а так же может стать причиной мигания(flash) компонентов.

### Узлы (Nodes)
##### ASDisplayNode 
ASDisplayNode – базовый класс который по сути, является абстракцией над UIView, аналогично как UIView является абстракцией над CALayer. Имеет те же свойства, что и UIView:
```sh
let node = ASDisplayNode()
node.backgroundColor = .orange
node.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
```
##### ASNetworkImageNode 
ASNetworkImageNode - узел который позволяет отобразить изображение, которое размещается удаленно. Для этого нужно задать свойство URL и изображением будет асинхронно загружено и сразу же отрисовано.

```sh
let imageNode = ASNetworkImageNode()
imageNode.style.preferredSize = CGSize(width: 300, height: 300)
imageNode.url = URL(string: "https://example.com/example.jpg")
```
> ASNetworkImageNode - один из узлов, который не может высчитать свои размеры, поэтому их нужно указывать явно
##### ASScrollNode
ASScrollNode - это ASDisplayNode, основой которой ясвляется UIScrollView. Этот ужел может автоматически высчитывать своё размер (не нужно следить за размерами, когда добавляете новые узлы). При помощи свойства scrollableDirections можно менять направления прокрутки (при этом можно задать оба направления).
```sh
let scrollNode = ASScrollNode()
scrollNode.automaticallyManagesSubnodes = true
scrollNode.automaticallyManagesContentSize = true

scrollNode.layoutSpecBlock = { node, constrainedSize in
  let stack = ASStackLayoutSpec.vertical()
  // Здесь можно добавить элементы в ASScrollNode при помощи свойства stack.children (массив)
  return stack
}
```
##### Оборачивание UIKit элементов (View Wrapping)
Данный способ позволяет обернуть существующие представления если это потребуется (UIView -> ASDisplayNode).
```sh
let nodeControl = ASDisplayNode { () -> UIPageControl in
            let dots = UIPageControl();
            dots.numberOfPages = 2;
            dots.currentPage = 1;
            return dots
        }
```
##### Контейнеры узлов (Node Containers) 

Контейнеры узлов в автоматическом режиме управляют интеллектуальной пред. загрузкой узлов (intelligent preloading). Это означает, что все вычисления расположений узлов, загрузка данных, декодирование и отрисовка будут выполняться асинхронно. Именно поэтому рекомендуется использовать узлы внутри контейнера узлов.

---
layout: single
---

# 選單

.ts.menu

## 說明

在 Tocas UI 中，選單並沒有漢堡樣式，你可以讓他在行動裝置上自動層疊，或者是水平捲動。如果類似 Bootstrap 那樣的漢堡選單是你要的，請參考側邊欄模塊。

## 種類

選單具有不同的種類。

### 選單

一個原生選單。

```html
<div class="ts [[menu]]">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 基本

一個基本的選單。

```html
<div class="ts [[basic]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 連結

一個擺放連結的選單，這種選單項目沒有左右內距，因此很適合對齊其他元件。

```html
<div class="ts [[link]] menu">
    <a class="item">戀愛</a>
    <a class="item">選舉</a>
    <a class="item">巧克力</a>
</div>
```

### 其次

一個比較不重要的選單，這個選單沒有背景顏色和框線。

```html
<div class="ts [[secondary]] menu">
    <a class="item">動漫</a>
    <a class="item">休閒</a>
    <a class="item">音樂</a>
</div>
```

### 帶指標的其次

一個帶有指示標記卻又比較不重要的選單。

```html
<div class="ts [[pointing]] [[secondary]] menu">
    <a class="item">首頁</a>
    <a class="active item">關於</a>
    <a class="item">文件</a>
</div>
```

### 分頁籤

選單可以看起來像分頁籤一樣。

```html
<div class="ts [[tabbed]] menu">
    <a class="item">動漫</a>
    <a class="active item">休閒</a>
    <a class="item">音樂</a>
</div>
```

### 文字

選單可以很適合單純的文字用途。

```html
<div class="ts [[text]] menu">
    <div class="header item">排序優先</div>
    <a class="active item">
        最新的
    </a>
    <a class="item">
        最多留言
    </a>
    <a class="item">
        最熱門
    </a>
</div>
```

### 反色語意

選單也可以是反色且具有不同語意。

```html
<div class="ts [[inverted]] [[primary]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
<div class="ts [[inverted]] [[info]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
<div class="ts [[inverted]] [[warning]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
</div>
<div class="ts [[inverted]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 反色肯定和否定

選單也可以是反色且帶有肯定或否定的語氣。

```html
<div class="ts [[inverted]] [[positive]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
<div class="ts [[inverted]] [[negative]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 垂直

一個垂直的選單。

```html
<div class="ts [[vertical]] menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

## 狀態

一個選單帶有些不同的狀態。

### 啟用中

顯示這個項目正在使用、被啟用。

```html
<div class="ts menu">
    <a class="item">首頁</a>
    <a class="[[active]] item">關於</a>
    <a class="item">文件</a>
</div>
```

### 已停用

顯示一個項目已經被停用、不可使用。

```html
<div class="ts menu">
    <a class="item">首頁</a>
    <a class="[[disabled]] item">關於</a>
    <a class="item">文件</a>
</div>
```

## 內容

一個選單具有不同內容。

### 標題

項目也可以含有標誌性文字。

```html
<div class="ts inverted info borderless menu">
    <a class="[[header]] item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 未讀標記

項目可以有一個新通知、未讀標記。

```html
<div class="ts borderless menu">
    <a class="item">首頁</a>
    <a class="[[unread]] item">動態軸</a>
    <a class="item">好友</a>
    <a class="item">設定</a>
</div>
<br>
<div class="ts icon menu">
    <a class="item"><i class="user {{icon}}"></i></a>
    <a class="[[unread]] item"><i class="comment {{icon}}"></i></a>
    <a class="item"><i class="star {{icon}}"></i></a>
</div>
```

### 圖示

你可以將圖示放置於選單的項目內。

```html
<div class="ts vertical compact menu">
    <a class="item">
        <i class="search [[icon]]"></i>
        搜尋
    </a>
    <a class="active item">
        <i class="mail [[icon]]"></i>
        電子郵件
    </a>
    <a class="disabled item">
        <i class="user [[icon]]"></i>
        使用者
    </a>
    <a class="item">
        <i class="remove [[icon]]"></i>
        刪除
    </a>
</div>
```

### 文字

選單項目內也可以擺放文字或是標題。

```html
<div class="ts vertical menu">
    <a class="item">
        <div class="ts {{header}}">促銷活動</div>
        <p>查看我們最新的促銷商品！</p>
    </a>
    <a class="item">
        <div class="ts {{header}}">優惠券</div>
        <p>看看我們所販售的優惠券！</p>
    </a>
    <a class="item">
        <div class="ts {{header}}">退貨</div>
        <p>不滿意商品？查看我們的退貨機制是什麼！</p>
    </a>
</div>
```

### 拉伸的

單個、或多個項目可以被拉伸到填滿整個選單，並將其他項目縮短至它們的內容寬度。這很適合用在排版上。

```html
<div class="ts menu">
    <div class="[[stretched]] item">
        <div class="ts fluid input">
            <input type="text" placeholder="在此輸入您想找的資料⋯⋯">
        </div>
    </div>
    <div class="item">
        <button class="ts button">搜尋</button>
    </div>
</div>
```

### 項目縮減

項目可以不要有垂直或是水平內距。

```html
<div class="ts menu">
    <a class="[[horizontally fitted]] item"> 水平縮減 </a>
    <a class="[[vertically fitted]] item"> 垂直縮減 </a>
    <a class="item"> 一般選項 </a>
</div>
```

### 置右項目

選單內的單個項目可以置右。

```html
<div class="ts menu">
    <a class="item">儀表板</a>
    <a class="item">彙整</a>
    <a class="[[right]] item">登出</a>
</div>
```

### 置右選單

倘若你有多個項目要置右，請透過一個向右靠齊的選單。

```html
<div class="ts menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
    <div class="[[right]] menu">
        <a class="item">會員清單</a>
        <a class="item">檔案</a>
        <a class="item">Github</a>
    </div>
</div>
```

### 帶輸入欄位選單

選單內也可以放置輸入欄位，例如這樣。

```html
<div class="ts inverted primary borderless menu">
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
    <div class="right fitted item">
        <div class="ts borderless right icon inverted primary [[input]]">
            <input type="text" placeholder="文字欄位">
            <i class="search {{icon}}"></i>
        </div>
    </div>
</div>
<br>
<div class="ts vertical compact inverted info borderless menu">
    <div class="fitted item">
        <div class="ts fluid borderless basic icon inverted [[input]]">
            <input type="text" placeholder="搜尋 ...">
            <i class="search {{icon}}"></i>
        </div>
    </div>
    <a class="item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 標籤

選單內可以擺放計數標籤。

```html
<div class="ts vertical compact inverted info menu">
    <a class="item">
        <div class="ts [[label]]">99+</div>
        動態軸
    </a>
    <a class="active item">
        <div class="ts [[label]]">12</div>
        電子郵件
    </a>
    <a class="disabled item">
        <div class="ts [[label]]">3</div>
        訊息
    </a>
</div>
```

### 分隔線

你可以在選單中放置分隔線用以區隔項目。

```html
<div class="ts vertical compact borderless menu">
    <a class="item">
        <i class="picture {{icon}}"></i> 相簿
    </a>
    <a class="item">
        <i class="music {{icon}}"></i> 音樂
    </a>
    <div class="[[divider]] item"></div>
    <a class="item">
        <i class="sign out {{icon}}"></i> 登出
    </a>
</div>
```

### 子選單

選單的項目內還可以再有一層選單。

```html
<div class="ts vertical compact menu">
    <div class="item">
        <div class="ts fluid right icon input">
            <input type="text" placeholder="搜尋">
            <i class="search icon"></i>
        </div>
    </div>
    <div class="item">
        首頁功能
        <div class="[[menu]]">
            <a class="active item">搜尋</a>
            <a class="item">新增</a>
            <a class="item">移除</a>
        </div>
    </div>
    <div class="item">瀏覽</div>
    <div class="item">訊息</div>
    <div class="item">更多</div>
</div>
```

### 下拉式功能選單

你可以在選單內擺置幾個下拉式功能選單，這部分請參考下拉式選單元件。

```html
<div class="ts menu">
    <a class="item">首頁</a>
    <div class="[[ts item dropdown]]">
        <div class="text">
            元件
        </div>
        <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item">按鈕</a>
            <div class="divider"></div>
            <a class="item">表單</a>
            <a class="item">導航列</a>
        </div>
    </div>
    <a class="item">文件</a>
</div>
```

## 外觀

選單具有不同的外觀。

### 圖示

用來擺放圖示的選單。

```html
<div class="ts [[icon]] menu">
    <a class="item"><i class="search {{icon}}"></i></a>
    <a class="item"><i class="download {{icon}}"></i></a>
    <a class="item"><i class="upload {{icon}}"></i></a>
</div>
<div class="ts vertical [[icon]] menu">
    <a class="item"><i class="search {{icon}}"></i></a>
    <a class="item"><i class="download {{icon}}"></i></a>
    <a class="item"><i class="upload {{icon}}"></i></a>
</div>
```

### 圖示標籤

你還可以在圖示選單中帶有標籤文字。

```html
<div class="ts [[labeled icon]] menu">
    <a class="item">
        <i class="search {{icon}}"></i>
        搜尋
    </a>
    <a class="active item">
        <i class="mail {{icon}}"></i>
        電子郵件
    </a>
    <a class="disabled item">
        <i class="user {{icon}}"></i>
        使用者
    </a>
    <a class="item">
        <i class="remove {{icon}}"></i>
        移除鈕
    </a>
</div>
<div class="ts vertical [[labeled icon]] menu">
    <a class="item">
        <i class="search {{icon}}"></i>
        搜尋
    </a>
    <a class="active item">
        <i class="mail {{icon}}"></i>
        電子郵件
    </a>
    <a class="disabled item">
        <i class="user {{icon}}"></i>
        使用者
    </a>
</div>
```

### 圖片

選單內的項目也可以擺放單張圖片。

```html
<div class="ts vertical compact menu">
    <a class="[[image]] item">
      <img class="ts small {{image}}" src="!-user-!">
    </a>
    <div class="item">
        個人檔案
        <div class="menu">
            <a class="item">編輯</a>
            <a class="item">隱私</a>
        </div>
    </div>
</div>
```

### 流動

選單的寬度可以是流動的，用來貼齊容器左右邊並且移除邊角。

```html
<div class="ts vertical [[fluid]] menu">
    <a class="item">亞凡芽</a>
    <a class="item">卡莉絲</a>
    <a class="item">夏希</a>
</div>
```

### 輕巧版

選單的寬度能夠以選單的內容作為基準並自動延展。

```html
<div class="ts [[compact]] menu">
    <a class="item">
        <i class="gamepad {{icon}}"></i>
        遊戲
    </a>
    <a class="item">
        <i class="video camera {{icon}}"></i>
        頻道
    </a>
    <a class="item">
        <i class="video play {{icon}}"></i>
        影片
    </a>
</div>
```

### 置中項目

選單的項目可以從中間開始。

```html
<div class="ts [[centered]] menu">
    <a class="item">首頁</a>
    <a class="item">貼文</a>
    <a class="item">照片</a>
</div>
```

### 平均劃分

項目寬度可以平均劃分並填滿整個選單。

```html
<div class="ts [[evenly divided]] menu">
    <a class="item">
        <i class="gamepad {{icon}}"></i>
        遊戲
    </a>
    <a class="item">
        <i class="video camera {{icon}}"></i>
        頻道
    </a>
    <a class="item">
        <i class="video play {{icon}}"></i>
        影片
    </a>
</div>
```

### 附著

選單可以附著在其他元件上。

```html
<div class="ts [[top attached]] menu">
    <a class="item">資料</a>
    <a class="item">隱私</a>
    <a class="item">權限</a>
</div>
<div class="ts attached {{segment}}">
    根據你眼睛所看到的，這是個被附著選單團團包圍的片段。
</div>
<div class="ts [[attached]] menu">
    <a class="item">首頁</a>
    <a class="item">影片</a>
</div>
<div class="ts attached {{segment}}">
    這個片段⋯⋯十分地難過、悲傷、無奈，覺得被選單霸凌了。
</div>
<div class="ts [[bottom attached]] menu">
    <a class="item">音樂</a>
    <a class="item">程式</a>
    <a class="item">運動</a>
</div>
```

### 手動均分

你可以自訂選單中應有幾個項目，從 `one` 到 `ten`。

```html
<div class="ts [[four item]] menu">
    <a class="item">鐘錶</a>
    <a class="item">電子產品</a>
    <a class="item">家具</a>
</div>
```

### 固定

選單能夠固定在頁面的某一邊，這會固定在頁面而不是父容器。

```html
<div class="ts [[top fixed]] menu">
    <a class="header item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>界的機在；且比坡明非小明地不亞樂要水。都為如樣氣政別高朋賣，家好他一毒一在，線質黑時、全想及民人行媽！著來帶靜，消即作住常部得，時組在包愛響，年小先兒位開調子十子弟他行熱的看其是所著快家……做發星發問你生笑書我裡員美、大兩求角因，行從說了戲名十，表覺力有在。</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="ts [[bottom fixed]] menu">
    <a class="header item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

#### 水平固定

選單除了可以固定在螢幕的上下方外，還可以固定在左右邊。但我們建議你將選單設置為垂直選單才能夠得到最好的固定選單效果。

```html
<div class="ts [[left fixed]] vertical menu">
    <a class="header item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>但客戶端渲染不這麼做，取而代之的是詢問 index.html 來得知如果網址是 /hello/ 應該做什麼動作，這在 Github Pages 和 Surge 上遇到了一些小問題，那就是他們預設不吃這種方式，他們會直接告訴你 404 網頁找不到，因為他們會直接去尋找伺服器內有沒有這個檔案。</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="ts [[right fixed]] vertical menu">
    <a class="header item">首頁</a>
    <a class="item">關於</a>
    <a class="item">文件</a>
</div>
```

### 減少框線

選單也可以選擇不要有內部框線。

```html
<div class="ts [[borderless]] menu">
    <a class="item">亞凡芽</a>
    <a class="item">卡莉絲</a>
    <a class="item">夏希</a>
</div>
```

### 縮減

選單可以不要有垂直或是水平內距，這很適合當作網格系統以外的排版方式。

```html
<div class="ts secondary [[fitted]] menu">
    <div class="item">
        <i class="user icon"></i>
        Yami Odymel
    </div>
    <a class="right item">登出</a>
</div>
```

### 抬舉

選單可以看起來像被抬舉一般加重陰影。

```html
<div class="ts [[raised]] menu">
    <a class="item">檔案</a>
    <a class="item">編輯</a>
    <a class="item">尋找</a>
    <a class="item">檢視</a>
</div>
```

### 平面化

選單可以看起來是扁平的。

```html
<div class="ts [[flatted]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
```

### 水平對齊

你可以改變項目中的水平對齊，可以是置左、置右或者置中。

```html
<div class="ts vertical menu">
    <a class="[[left aligned]] item">置左對齊</a>
    <a class="[[center aligned]] item">置中對齊</a>
    <a class="[[right aligned]] item">置右對齊</a>
</div>
```

### 自動層疊

選單可以在行動裝置上自動層疊，而不是繼續保持一排。

```html
<div class="ts [[stackable]] menu">
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
</div>
```

### 可水平捲動的

當選單項目過多的時候你可以讓選單支援水平捲動，避免項目溢出來。

```html
<div class="ts [[horizontally scrollable]] menu">
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
    <a class="item">項目</a>
</div>
```

### 尺寸

選單提供了多種尺寸。

```html
<div class="ts [[mini]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[tiny]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[small]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[medium]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[large]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[big]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[huge]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
<div class="ts [[massive]] menu">
    <a class="item">執行</a>
    <a class="item">工具</a>
    <a class="item">視窗</a>
</div>
```
---
layout: single
---

# 網格系統

.ts.grid

## 說明

Tocas UI 的網格系統和 Bootstrap 的較為不同，比起 Bootstrap 來說，Tocas UI 且更具彈性與更強大的功能還更加地自動化。

為了方便展示網格系統，我們將背景加上了灰色，在實際應用中將會是透明的。

## 教學

網格系統由多個欄位組成，而這些欄位可以有不同屬性。

### 基本

一個基本的網格系統，這可以用來規劃你網頁上的排版。

```html
<div class="ts [[grid]]">
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
</div>
```

### 欄位

我們稱被劃分開來的區塊為「欄位」，而每個欄位的寬度都是可以自己決定的。一個網格系統被劃分為**十六格**，這將使的你的網格系統更加地具有彈性。

這個範例的第一行有**四個欄位**，這意味著每一個欄位都是**四格寬**，而四格寬的欄位共有**四個**，那就是 `4 * 4 = 16` 也就剛好符合了一行所能夠承受的**最大格數（十六格）**。

另一行是則是由**兩格寬**、**八格寬**還有**六格寬**的欄位所組成，這意味著 `2 + 8 + 6 = 16`，也就剛好達到了一行的最大格數。


```html
<div class="ts grid">
    <div class="four wide [[column]]"></div>
    <div class="four wide [[column]]"></div>
    <div class="four wide [[column]]"></div>
    <div class="four wide [[column]]"></div>
    <div class="two wide [[column]]"></div>
    <div class="eight wide [[column]]"></div>
    <div class="six wide [[column]]"></div>
</div>
```

### 列

「列」用來確保「欄位」**不會因為超過十六格而自動換行**。同時「列」也可以確保自己是獨立的一行。


```html
<div class="ts grid">
    <div class="[[row]]">
        <div class="three wide column"></div>
        <div class="three wide column"></div>
        <div class="three wide column"></div>
        <div class="three wide column"></div>
    </div>
    <div class="two wide column"></div>
    <div class="five wide column"></div>
    <div class="nine wide column"></div>
    <div class="[[row]]">
        <div class="sixteen wide column"></div>
        <div class="sixteen wide column"></div>
        <div class="sixteen wide column"></div>
        <div class="sixteen wide column"></div>
    </div>
</div>
```

### 較寬鬆的網格

當你發現欄位和欄位之間太相近，你可以考慮透過 `relaxed grid` 來增加欄位之間的間距。

```html
<div class="ts grid">
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
</div>
<div class="ts [[relaxed]] grid">
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
</div>
```

## 欄位

網格系統中最重要的部分。

### 自動換行

一旦該行的欄位超過十六格（意指「寬度」，而**不是欄位數量**），就會自動換到下一行。

```html
<div class="ts grid">
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
</div>
```

### 內容

欄位**不應該被套用任何自訂的樣式**，欄位只是一個容器，你應該在裡面放入你要的元素和樣式，而**不是直接在欄位上更改**。


```html
<div class="ts three column grid">
    <div class="[[column]]">
        <div class="ts {{segment}}">試著在 Column 中擺放元素。</div>
    </div>
    <div class="[[column]]">
        <div class="ts secondary {{segment}}">而不是直接更改 Column 的樣式。</div>
    </div>
    <div class="[[column]]">
        <div class="ts tertiary {{segment}}">不然很有可能發生量子錯誤！</div>
    </div>
</div>
```

### 寬度

欄位的寬度由 `* wide` 決定，例如 `one wide` 就是一格，`sixteen wide` 則是十六格。

十六格剛好會符合一行最大的寬度，八格則是填滿一行的一半。


```html
<div class="ts grid">
    <div class="[[one wide]] column"></div>
    <div class="[[fifteen wide]] column"></div>
    <div class="[[three wide]] column"></div>
    <div class="[[thirteen wide]] column"></div>
    <div class="[[six wide]] column"></div>
    <div class="[[ten wide]] column"></div>
    <div class="[[four wide]] column"></div>
    <div class="[[twelve wide]] column"></div>
    <div class="[[sixteen wide]] column"></div>
</div>
```

### 拉伸的

不指定欄位寬度的時候，單個、或多個欄位可以被拉伸到填滿整個網格系統，並將其他欄位縮短至它們的內容寬度。這很適合用在兩欄式的排版，或是輸入欄位與按鈕。


```html
<div class="ts grid">
    <div class="[[stretched]] column">
        <div class="ts fluid input">
            <input type="text" placeholder="在此輸入您想找的資料⋯⋯">
        </div>
    </div>
    <div class="column">
        <button class="ts button">搜尋</button>
    </div>
</div>
```

## 列

「列」用來整合、包覆欄位，甚至可以再細分寬度。

### 寬度細分

你可以在「列」裡面規劃這一列應該要有幾個欄位，例如 `two column` 就能夠指列有**兩個欄位**，也就是一格欄位有**八格寬**。

因為一列最多允許十六格，為了達成一列中有兩個欄位，即是 `16 / 2 = 8`。

當你了解如何善用寬度細分，你也能夠將一列切成三個欄位，甚至四個、五個，而不會因為欄位寬度無法除盡十六而作罷。


```html
<div class="ts grid">
    <div class="[[two column]] row">
        <div class="column"></div>
        <div class="column"></div>
    </div>
</div>
```

### 浮動欄位

列裡面的欄位可以是浮動的。

```html
<div class="ts four column grid">
    <div class="four column row">
        <div class="[[left floated]] column"></div>
        <div class="[[right floated]] column"></div>
    </div>
    <div class="column"></div>
    <div class="column"></div>
    <div class="column"></div>
    <div class="column"></div>
</div>
```

## 網格

網格是最外層的容器。

### 多重網格

網格系統內可以還可以再有另一個網格系統。

```html
<div class="ts two column grid">
    <div class="column">
        <div class="ts four column [[grid]]">
            <div class="column"></div>
            <div class="column"></div>
            <div class="column"></div>
            <div class="column"></div>
        </div>
    </div>
    <div class="column"></div>
</div>
```

### 寬度細分

這和「列」的寬度細分相同，但你可以**直接在網格上進行細分**，例如 `four column` 就能夠指定網格系統的一行會有**四個欄位**，也就是一格欄位有**四格寬**。

因為一列最多允許十六格，為了達成一列中有四個欄位，即是 `16 / 4 = 4`。

透過這種方法不需要手動設定每一個欄位要有幾格寬，十分地方便。


```html
<div class="ts [[four column]] grid">
    <div class="[[two column]] row">
        <div class="column"></div>
    </div>
    <div class="column"></div>
    <div class="column"></div>
    <div class="column"></div>
    <div class="column"></div>
</div>
```

### 置中

網格系統內的欄位可以從中間開始。

```html
<div class="ts four column [[centered]] grid">
    <div class="column"></div>
    <div class="column"></div>
</div>
```

### 內容對齊

網格系統內的欄位內容可以對齊左、右、甚至中間，這個設定可以配置於整個網格系統、單列、甚至單個欄位。


```html
<div class="ts [[center aligned]] four column grid">
    <div class="column">置中的文字</div>
    <div class="[[left aligned]] two column row">
        <div class="column">置左的文字</div>
        <div class="[[right aligned]] column">置右的文字</div>
    </div>
</div>
```

## 響應式網格

響應式網格可以在行動裝置或小型螢幕上自動縮放，你甚至只需要加一個樣式，其他讓我們來就好了。


### 自動層疊

自動層疊會在手機上時自動將所有欄位縮成一排。

```html
<div class="ts [[stackable]] grid">
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
    <div class="four wide column"></div>
</div>
```

### 排序反轉

你可以在指定裝置上反轉網格系統的排序。

```html
<div class="ts [[mobile reversed]] two column grid">
    <div class="column">
        <div class="ts {{segment}}">第一個，手機第二個</div>
    </div>
    <div class="column">
        <div class="ts secondary {{segment}}">第二個，手機第ㄧ個</div>
    </div>
</div>
<div class="ts [[tablet reversed]] two column grid">
    <div class="column">
        <div class="ts {{segment}}">第一個，平板第二個</div>
    </div>
    <div class="column">
        <div class="ts secondary {{segment}}">第二個，平板第ㄧ個</div>
    </div>
</div>
<div class="ts [[computer reversed]] two column grid">
    <div class="column">
        <div class="ts {{segment}}">第一個，電腦第二個</div>
    </div>
    <div class="column">
        <div class="ts secondary {{segment}}">第二個，電腦第ㄧ個</div>
    </div>
</div>
```

### 雙倍層疊

這會讓你的欄位在手機和平板上以雙倍的寬度增加，例如一個**八個欄位**的行會在平板上成為**四個欄位**然後手機上會是**兩個欄位**。

```html
<div class="ts grid">
    <div class="[[doubling]] eight column row">
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
    </div>
    <div class="[[doubling]] six column row">
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
    </div>
    <div class="[[doubling]] four column row">
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
        <div class="column"></div>
    </div>
</div>
```

### 手動調整

你可以自訂在不同裝置上欄位所佔的格數，你總共有這些裝置可供選擇。

|          | < 767px  | > 767px  | > 991px    | > 1199px       |
|----------|----------|----------|------------|----------------|
| 樣式名稱  | `mobile` | `tablet` | `computer` | `large screen` |
| 裝置稱呼  | 行動裝置  | 平板      | 一般電腦     | 大型螢幕       |


透過 `[格數] wide [裝置]` 使用這些裝置，就像 `one wide computer` 即是在電腦上成為一格寬。

```html
<div class="ts grid">
    <div class="[[eight wide computer]] [[four wide mobile]] column"></div>
    <div class="[[eight wide computer]] [[four wide mobile]] column"></div>
    <div class="[[eight wide computer]] [[four wide mobile]] column"></div>
    <div class="[[eight wide computer]] [[four wide mobile]] column"></div>
    <div class="[[four wide computer]] [[eight wide mobile]] column"></div>
    <div class="[[four wide computer]] [[eight wide mobile]] column"></div>
    <div class="[[four wide computer]] [[eight wide mobile]] column"></div>
    <div class="[[four wide computer]] [[eight wide mobile]] column"></div>
</div>
```

### 手動隱藏

你可以透過 `[裝置] only` 在不同裝置上隱藏特定列、欄位。

```html
<div class="ts grid">
    <div class="eight wide [[computer only]] column"></div>
    <div class="eight wide [[computer only]] column"></div>
    <div class="four wide [[mobile only]] column"></div>
    <div class="four wide [[mobile only]] column"></div>
    <div class="four wide [[mobile only]] column"></div>
    <div class="four wide [[mobile only]] column"></div>
    <div class="[[large screen only]] row">
        <div class="six wide column"></div>
        <div class="six wide column"></div>
        <div class="four wide column"></div>
    </div>
    <div class="eight wide [[tablet only]] eight wide [[mobile only]] column"></div>
    <div class="eight wide [[tablet only]] eight wide [[mobile only]] column"></div>
</div>
```
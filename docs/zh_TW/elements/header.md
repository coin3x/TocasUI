---
layout: single
---

# 標題

.ts.header

## 種類

標題具有多個不同的種類。

### 基本標題

基於 `h1` 到 `h6` 的標題，這個標題的大小依照頁面基準文字大小為主。

```html
<h1 class="ts [[header]]">標題 1</h1>
<h2 class="ts [[header]]">標題 2</h2>
<h3 class="ts [[header]]">標題 3</h3>
<h4 class="ts [[header]]">標題 4</h4>
<h5 class="ts [[header]]">標題 5</h5>
<h6 class="ts [[header]]">標題 6</h6>
```

### 內容標題

這種標題是基於父容器的文字大小為基準點，因此在不同文字大小的容器中，標題的大小也會有所不同。

```html
<div class="ts [[massive]] header">重量級</div>
<div class="ts [[huge]] header">巨大</div>
<div class="ts [[big]] header">大的</div>
<div class="ts [[large]] header">大型</div>
<div class="ts [[medium]] header">中等</div>
<div class="ts [[small]] header">小型</div>
<div class="ts [[tiny]] header">微小</div>
<div class="ts [[mini]] header">迷你</div>
```

### 副標題

比正常標題還要稍微小一號的副標題。

```html
<h1 class="ts [[sub header]]">副標題 1</h1>
<h2 class="ts [[sub header]]">副標題 2</h2>
<h3 class="ts [[sub header]]">副標題 3</h3>
<h4 class="ts [[sub header]]">副標題 4</h4>
<h5 class="ts [[sub header]]">副標題 5</h5>
<h6 class="ts [[sub header]]">副標題 6</h6>
<div class="ts massive [[sub header]]">重量級副標題</div>
<div class="ts huge [[sub header]]">巨大副標題</div>
<div class="ts big [[sub header]]">大的副標題</div>
<div class="ts large [[sub header]]">大型副標題</div>
<div class="ts medium [[sub header]]">中等副標題</div>
<div class="ts small [[sub header]]">小型副標題</div>
<div class="ts tiny [[sub header]]">微小副標題</div>
<div class="ts mini [[sub header]]">迷你副標題</div>
```

### 圖示標題

標題可以帶有圖示和部分說明。

```html
<h3 class="ts center aligned [[icon header]]">
    <i class="gift {{icon}}"></i>挑選禮物
    <div class="sub header">為你的女朋友，喔不，你沒有女朋友。</div>
</h3>
```

## 內容

一些用以擺放在標題內不同的內容元素。

### 標題中的副標題

用來詮釋主標題的副標題。

```html
<div class="ts header">
    大標題
    <div class="[[sub header]]">然後我是子標題。</div>
</div>
```

#### 同行副標題

標題內的副標題可以跟主標題同一行，而不是換到下一行。

```html
<div class="ts header">
    大標題
    <div class="[[inline]] sub header">我是同行子標題，會跟大標題在一起。</div>
</div>
```

### 圖片

標題中可以帶有圖片。

```html
<h3 class="ts header">
    <img class="ts circular [[image]]" src="!-user-!">
    帳號設定
</h3>
```

### 圖示

標題中也可以帶有圖示。

```html
<h3 class="ts header">
    <i class="plug [[icon]]"></i>
    <div class="content">
        99.9% 上線時間保證
    </div>
</h3>
<h2 class="ts header">
    <i class="settings [[icon]]"></i>
    <div class="content">
        安全性設定
        <div class="sub header">管理好您的洨洨安，確保不受任何人詐騙。</div>
    </div>
</h2>
```

## 狀態

你可以隨時透過樣式類別切換一個標題的狀態。

### 已停用

用以顯示這個標題已經被停用。

```html
<h3 class="ts [[disabled]] header">已停用標題</h3>
```

## 外觀

你可以點綴標題的樣式。

### 語氣

標題也具有不同的語氣。

```html
<h3 class="ts [[primary]] header">主要語氣</h3>
<h3 class="ts [[info]] header">提示語氣</h3>
<h3 class="ts [[warning]] header">警告語氣</h3>
<h3 class="ts [[positive]] header">正面語氣</h3>
<h3 class="ts [[negative]] header">否定語氣</h3>
<div class="ts inverted {{segment}}">
    <h3 class="ts [[inverted]] header">反色語氣</h3>
</div>
```

### 分隔線

每個標題都可以在底下新增分隔線。

```html
<h1 class="ts [[dividing]] header">標題 1</h1>
<h2 class="ts [[dividing]] header">標題 2</h2>
<h3 class="ts [[dividing]] header">標題 3</h3>
<h4 class="ts [[dividing]] header">標題 4</h4>
<h5 class="ts [[dividing]] header">標題 5</h5>
<h6 class="ts [[dividing]] header">標題 6</h6>
```

### 對齊

標題可以置中、置左或者置右。

```html
<h5 class="ts [[left aligned]] header">我置左</h5>
<h5 class="ts [[center aligned]] header">我置中</h5>
<h5 class="ts [[right aligned]] header">我置障</h5>
```

### 浮動

標題可以置中、置左或者置右。

```html
<h5 class="ts [[left floated]] header">向左浮動</h5>
<h5 class="ts [[right floated]] header">向右浮動</h5>
```

### 區塊

標題能夠看起來像自己一個區塊。

```html
<h4 class="ts [[block]] header">我自己是一個區塊喔</h4>
```

### 吸附

標題能夠吸附在其他的元件上。

```html
<h5 class="ts [[top attached]] header">吸附在上部</h5>
<div class="ts attached {{segment}}">
    在這寂靜的夜晚，我又想起了你。
</div>
<h5 class="ts [[attached]] header">吸附於中間</h5>
<div class="ts attached {{segment}}">
    頓時；一陣涼風吹過，而我——又射了。
</div>
<h5 class="ts [[bottom attached]] header">吸附於底部</h5>
```

### 置上圖示

標題裡的圖示可以是置上而不是置中，當有子標題的時候圖示會對齊大標題。

```html
<div class="ts large header">
    <i class="announcement [[top aligned]] {{icon}}"></i>
    <div class="content">
        官方公告
        <div class="sub header">叭啦叭叭批哩叭啦，有新公告啦！</div>
    </div>
</div>
```
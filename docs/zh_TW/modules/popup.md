---
layout: single
tabs  :
    - styles
    - module
---

# 彈出式訊息

.ts.popup

## 說明

用上彈出式訊息通常是個不好的設計。此元件會在滑鼠移過某處時顯示一個氣泡訊息，這個訊息偏向提示，尚不打算增加過多豐富的功能。

## 種類

一個彈出式訊息具有多個不同的種類。

### 彈出式訊息

一個正常的彈出式訊息，彈出式訊息的位置預設在元素下方。

```html
<button class="ts info labeled icon {{button}}" [[data-tooltip]]="早安！我的朋友！你欠錢沒還！">
    <i class="mouse pointer {{icon}}"></i>
    滑鼠移至此查看範例
</button>
```

### 標籤

彈出式訊息可以看起來更像普通標籤，而不帶有指向某處的記號。

```html
<button class="ts info labeled icon {{button}}" [[data-tooltip-type]]="label" data-tooltip="這個彈出式訊息沒有箭頭，像普通標籤。">
    <i class="mouse pointer {{icon}}"></i>
    滑鼠移至此查看範例
</button>
```

### 附著於其他元素

彈出式訊息也可以套用在一般的文字或是連結甚至其他元素上，需要注意的是這依賴著 `:after` 與 `:before` 選擇器，任何不是「容器」的都不適用，如：文字欄位、圖示、影像等。
<br><br>
你需要有個額外的容器包覆這些不適用的元素，然後在容器上配置彈出式訊息，請參閱下面這個範例。


```html
<a href="#!" [[data-tooltip]]="這是洨洨安。">
    <img class="ts circular avatar {{image}}" src="!-user-!">
</a>
<a href="#!" [[data-tooltip]]="這是我好朋友，長得跟洨洨安有點像。">
    <img class="ts circular avatar {{image}}" src="!-user-!">
</a>
<span>當然，你也能夠讓</span>
<a href="#!" [[data-tooltip]]="早安！朋友！">
    普通的連結
</a>
<span>有彈出式訊息。</span>
<div class="ts {{input}}" [[data-tooltip]]="請輸入您的帳號。">
    <input type="text" placeholder="滑鼠移過來">
</div>
```

## 狀態

彈出式訊息也具有狀態。

### 無彈出式訊息

有些時候你可能已經有外掛、或是插件來協助你完成彈出式訊息的實作，倘若你的外掛、插件也使用到了 `[data-tooltip]` 屬性，這個時候可能會與 Tocas UI 有所衝突，為此，你可以在該元素上加上 `.untooltipped` 樣式即可停用 Tocas UI 的彈出式訊息。


```html
<button class="ts info [[untooltipped]] button" data-tooltip="早安！我的朋友！你欠錢沒還！">
    這個按鈕不會有彈出式訊息
</button>
```

## 外觀

你可以更改彈出式訊息的位置、大小。

### 訊息位置

彈出式訊息出現的位置能夠被更改。

```html
<button class="ts info button" [[data-tooltip-position]]="top left" data-tooltip="這是彈出式訊息。">上面左邊</button>
<button class="ts info button" [[data-tooltip-position]]="top center" data-tooltip="這是彈出式訊息。">上面中間</button>
<button class="ts info button" [[data-tooltip-position]]="top right" data-tooltip="這是彈出式訊息。">上面右邊</button>
<button class="ts info button" [[data-tooltip-position]]="bottom left" data-tooltip="這是彈出式訊息。">下面左邊</button>
<button class="ts info button" [[data-tooltip-position]]="bottom center" data-tooltip="這是彈出式訊息。">下面中間</button>
<button class="ts info button" [[data-tooltip-position]]="bottom right" data-tooltip="這是彈出式訊息。">下面右邊</button>
<button class="ts info button" [[data-tooltip-position]]="left" data-tooltip="這是彈出式訊息。">左邊</button>
<button class="ts info button" [[data-tooltip-position]]="right" data-tooltip="這是彈出式訊息。">右邊</button>
```

### 出現延遲

你可以決定滑鼠移至元素上後要過多久才會出現彈出式訊息。

```html
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="disabled">停用延遲</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="0.1">0.1 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="0.2">0.2 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="0.3">0.3 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="0.4">0.4 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="0.5">0.5 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="1">1 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="2">2 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="3">3 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="4">4 秒</button>
<button class="ts info button" data-tooltip="這是彈出式訊息。" [[data-tooltip-delay]]="5">5 秒</button>
```
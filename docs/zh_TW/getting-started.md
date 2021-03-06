---
layout: single
---

# 開始使用

人生已經很無聊了，別讓你的網頁也再無聊下去。

## 說明

Tocas UI 是一個基於 Semantic UI 的衍生分支，其傳承特色包括了獨具語意的寫法，同時也支援更彈性、多樣化的使用方式，並支援自動和手動響應式設計。

## 引用檔案

你需要引用 Tocas UI 的檔案才能夠開始使用，這裡提供兩種方式讓你使用。

### 透過線上 CDN

這是由一家知名 CDN 公司 [CloudFlare](https://www.cloudflare.com) 所提供的免費服務並且提供夠快的服務速度，這使你不需要下載 Tocas UI，只需要將下列標籤放置於 HTML 中的 `<head> .. </head>` 處即可，且該公司提供可靠的上線時間令你毋須擔心。

```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tocas-ui/2.3.3/tocas.css">
```

### 自行下載 Tocas UI

你需要到 [我們的 Github 下載 Tocas UI](https://github.com/TeaMeow/TocasUI)，然後取出其中的 `/dist` 資料夾，並像下面這樣引用 Tocas UI 檔案，如此的好處是你可以確保樣式不會因為遠端的伺服器離線而遺失。

```html
<link rel="stylesheet" href="tocas.css">
```

## 全域注意事項

你需要注意你的 HTML 和設計上是否有達到這些要求。

### 網頁字型

Tocas UI 2.2 之後的版本不再統一使用 Noto Sans CJK，因為其檔案量過大讀取費時。目前 Tocas UI 使用下列字型在各個系統（如：Ubuntu、macOS、Windows）上取得最相近且美觀的結果。

```
"SF Pro TC", "SF Pro Text", "SF Pro Icons", "PingFang TC", "Helvetica Neue", "Helvetica", "Arial", "Microsoft JhengHei", wf_SegoeUI, "Segoe UI", Segoe, "Segoe WP", Tahoma, Verdana, Ubuntu, "Bitstream Vera Sans", "DejaVu Sans", Tahoma, 微軟正黑體, "LiHei Pro", "WenQuanYi Micro Hei", "Droid Sans Fallback", "AR PL UMing TW", Roboto, "Helvetica Neue", "Hiragino Maru Gothic ProN", メイリオ, "ヒラギノ丸ゴ ProN W4", Meiryo, "Droid Sans", sans-serif
```

### HTML 5 宣告

請確定你有透過 `<!DOCTYPE HTML>` 將網頁宣告成 HTML5。

```html
<!DOCTYPE HTML>
<html>
...
</html>
```

### 響應式設計標籤

Tocas UI 支援響應式設計，為此你需要新增下列一段的標籤在你的 HTML 來告訴行動裝置你的網頁支援響應式設計，利用這個標籤還可以降低並解決行動裝置對於網頁的點擊延遲，請將這段放置於 HTML 中的 `<head> .. </head>` 處。

```html
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
```

### 響應式字體大小

Tocas UI 預設並不會自動幫你在不同裝置上變更字體大小，不過自從所有字型大小皆依賴網頁基底，那麼你就可以在不同尺寸的裝置上變更基底字體大小。令字體大小更加地符合多種尺寸的裝置。

```css
html {
    font-size: 16px;
}

// 在行動裝置上將字體轉換成 `14px` 大小。
@media (max-width: 768px) {
    html {
        font-size: 14px;
    }
}
```

## 與其他框架比較

這裡解釋著為什麼 Tocas UI 比起其他框架還要些卓越的部分。

### Bootstrap v4

Bootstrap 是一個十分常見的框架，但卻有個最為嚴重的問題，也是與 Tocas UI 所背馳的理念，就是太多雜亂的樣式名稱，並且不具有意義，像是這樣：`m-l-1`、`m-t-0`、`p-x-2`、`m-x-auto`、等，並不能夠一眼就看出這些樣式所具備的意義，相較之下 Tocas UI 的 `small`、`centered` 更具有意義。

此外，在 HTML 結構的部分 Bootstrap 常為了要補足某些缺陷或排列而新增過多不必要的結構，而 Tocas UI 則沒有這方面的問題。在元件的部分 Tocas UI 也較多元化並更具彈性。

### Semantic UI

Semantic UI 即是 Tocas UI 的衍生來源，雖然 Semantic UI 具備自訂主題功能，但要改變主題你必須自行手動編譯，會這樣做的人少之又少，預設的 Semantic UI 主題看起來十分地沈重並仰賴過多地白色和黑色，這個問Tocas UI 則有所改善。

在元件的部分 Semantic UI 過度依賴非原生元件（如下拉式輸入欄位），TocasUI這部分則保留並美化了原生的元件，而不是另外做一個。Tocas UI 還勝過 Semantic UI 一個優點，那就是元件更具有自訂性，舉例來說可具有陰影的卡片「扁平化」，或是其他更多外觀上的變動。

### Amaze UI

Amaze UI 在外觀上較為生硬，和 Bootstrap 一樣不具有語意並擁有 `am-` 的類別前輟，樣式和元件也過於死板不具彈性，還有一些非直覺的動畫，例如「按鈕」按下時的緩慢感，Tocas UI 讓按鈕和回饋充滿動感，不會讓使用者感到遲鈍，並讓元件多樣化，外觀上也看起來更為簡約。

### Kule Lazy

Kule Lazy 在一些結構上使用的是舊型的樣式，Tocas UI 則採用最新並具彈性的 Flexbox，在外觀的配色和陰影也比起 Kule Lazy 還要更加地輕盈，不會令人感到沈重，除此之外 Kule Lazy 的命名方式也和 Bootstrap 有著一樣的問題，且還不只如此， Kule Lazy 在用詞上也較為獨特使人不容易區分和上手，Tocas UI 在這方面則以直覺的方式稱呼元件讓人不感到困惑。

### Foundation

Foundation 在外觀上較為生硬，過多的方形設計，按鈕也不具有回饋力，令人按下時感到鈍感，並且在元件樣式上過度依賴標籤選擇器，這將使得你在自訂部分元件時會有所衝突，上述的所有問題都有在 Tocas UI 獲得改善。

### Tachyons

Tachyons 並沒有「元件觀念」，這意味著你將需要透過 Tachyons 內建的輔助樣式自行建立需要的元件，Tachyons 在樣式命名上有著與 Bootstrap 一樣厭垢並且更難以令人捉摸的問題，如 `mr3` 但其實是 `margin-right: 1rem`，並且在元素上使用過多的樣式如：`fw6 f3 f2-ns lh-title mt0 mb3`，這些都將導致未來整合有所困難，同時也意味著當你需要重複使用元件時，你的原始碼大小也會急劇地增加。

## 撰寫與命名規範

除了你不曉得怎麼實踐的程式外，其次最難的不外乎就是「命名」。通常使用其他的介面框架都不會有如此的規範。但我們在這裡希望你能夠遵循 Tocas UI 的命名精神，來讓頁面上的樣式名稱不再那麼混亂。

### 名稱

元素的名稱不可帶有底線或減號，以[小駝峰式命名法](https://zh.wikipedia.org/wiki/%E9%A7%9D%E5%B3%B0%E5%BC%8F%E5%A4%A7%E5%B0%8F%E5%AF%AB)為主，就像是命名程式變數，這令元素名稱能夠良好地符合普遍 JavaScript 程式。

```html
<!-- ✖ 別這樣 -->
<div id="large-jumbotron"></div>

<!-- ✓ 請這麼做 -->
<div id="largeJumbotron"></div>
```

```css
#largeJumbotron {}
```

### 區塊／容器

區塊的樣式名稱不應有任何符號，或者是大小寫，在這裡僅用空白區隔，就像是你直接稱呼元素那樣地輕切，透過這種用法還能令你更加地彈性化設計樣式。

```html
<!-- ✖ 別這樣 -->
<div class="blk-container"></div>

<!-- ✓ 請這麼做 -->
<div class="block container"></div>
```

```css
.container {}
.block.container {}
```

### 元素

元素的樣式名稱和區塊的命名方式相同。

```html
<!-- ✖ 別這樣 -->
<div class="blk-container">
    <div class="single-blk"></div>
</div>

<!-- ✓ 請這麼做 -->
<div class="block container">
    <div class="single block"></div>
</div>
```

```css
.block.container .single.block {}
```

### 子項目

當元素是某個合集（如：清單、選單、導航列）的項目時，沒有必要重新聲明這個項目屬於誰，這能夠大幅度減少 HTML 的重複與混濁度。

```html
<!-- ✖ 別這樣 -->
<div class="menu menu-lg">
    <div class="menu-item menu-active"></div>
    <div class="menu-item"></div>
    <div class="menu-item"></div>
</div>

<!-- ✓ 請這麼做 -->
<div class="large menu">
    <div class="active item"></div>
    <div class="item"></div>
    <div class="item"></div>
</div>
```

```css
.menu {}
.menu .item {}
.menu .item.active {}
```

### 語意而不是顏色

頁面上不應該充滿一堆顏色，請記住一點：「當所有事情都被凸顯，所有事情都將顯得不重要。」，為此 Tocas UI 中也沒有顏色樣式，因為語意才是最重要的，將顏色以語意命名，能夠限制你所使用的方式、避免濫用且導向正軌。

透過「負面的」、「警告的」來命名顏色，而不是「紅色」、「黃色」，這令你能夠替換樣式佈景的時候而不會因為改了顏色卻繼續使用像「黃色」這種制式名稱而有所不符。

```html
<!-- ✖ 別這樣 -->
<button class="red button"></button>
<button class="yellow button"></button>

<!-- ✓ 請這麼做 -->
<button class="negative button"></button>
<button class="warning button"></button>
```

```css
.negative.button {}
.warning.button {}
```

### 修飾詞

以樣式修飾一個元素的顏色、大小、外觀時和先前的區塊與元素命名方式皆相同且不可是縮寫，以避免你忘記過往是如何縮寫的。

簡單來說：小的（small）不可以被縮寫成（sm）；如果有兩個單字仍以空白隔開，例如：向左浮動（left floated）。

```html
<!-- ✖ 別這樣 -->
<div class="container container-lg">
    <div class="picture picture-sm"></div>
    <button class="btn btn-lf"></button>
</div>

<!-- ✓ 請這麼做 -->
<div class="large container">
    <div class="small picutre"></div>
    <button class="left floated button"></button>
</div>
```

```css
.large.container {}
.large.container .small.picture {}
.large.container [class*="left floated"].button {}
```

### 其他用途

有時候你會為了專門給 jQuery 或者 JavaScript 而另外命名了像是 `js-reply-btn`，這通常是設計不良所導致的，但如果你真的沒辦法的話，在這裡我們則是建議和先前的命名方式一樣，但最前方加上減號。

```html
<!-- ✖ 別這樣 -->
<div class="cts">
    <div class="single-ct">
        <button class="btn btn-lg js-main-reply-btn"></button>
    </div>
</div>

<!-- ✓ 請這麼做 -->
<div class="comments">
    <div class="single comment">
        <button class="large -main -reply button"></button>
    </div>
</div>
```

```css
.comments {}
.comments .single.comment {}
.comments .single.comment .large.button {}
```

```js
$(".-main.-reply.button").show()
```
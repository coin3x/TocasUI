// Generated by CoffeeScript 2.0.0-beta4
var ts;

ts = function(selector, context = null) {
  var module;
  // 如果傳入的選擇器不是物件，那麼就只是普通的選擇器。
  if (typeof selector !== 'function') {
    ts.selector = context !== null ? $selector(selector, context) : $selector(selector);
    return ts.fn;
  }
  // 如果傳入的是物件，那麼就是欲註冊的 Tocas 模組。
  // 改名為 module 比較符合接下來的使用方式。
  module = selector;
  // 在 Tocas 函式鏈中新增一個相對應的模組函式。
  return ts.fn[module.module] = function(arg = null, arg2 = null, arg3 = null) {
    var $elements, value;
    // 先用 Tocas Core 核心來選取指定元素，然後放到上下文物件之後傳遞到模組內使用。
    $elements = ts.selector;
    // 最終的回傳值。
    value = ts.fn;
    // 每個節點。
    $elements.each(function(_, index) {
      var $this, base, init, localModule;
      // 初始化這個模組。
      //console.log module
      //localModule = Object.assign( Object.create( Object.getPrototypeOf(module)), module)
      localModule = new module();
      localModule.delay = function(time = 0) {
        return new Promise(function(resolve) {
          return setTimeout(resolve, time);
        });
      };
      // 準備一些此元素的資料。
      $this = $selector(this);
      // 將此元素的資料放置這個模組中。
      localModule.$this = $this;
      localModule.index = index;
      // init 會初始化一個元素，並讓他執行模組中的初始化函式。
      init = function() {
        var attr, name, props;
        // 初始化一個屬性物件，用以保存此元素的自訂屬性。
        props = {};
        // 遞迴模組的屬性設置，並且找尋元素是否有相對應的屬性。
        for (name in localModule.props) {
          // 將設定的 camelCase 轉換成 hyphen-case。
          name = name.replace(/([A-Z])/g, (g) => {
            return `-${g[0].toLowerCase()}`;
          });
          // 建立相對應的元素屬性名稱。
          attr = $this.attr(`data-${name}`);
          if (attr == null) {
            // 如果元素沒有相對應的標籤，就略過這個設置。
            continue;
          }
          // 轉換標籤的字串型態到相對應的真正型態，例如：數字字串 -> 數值、布林字串 -> 布林值。
          switch (attr) {
            case attr === 'true':
            case attr === 'false':
              props[name] = attr === 'true';
              break;
            case !isNaN(attr):
              props[name] = parseInt(attr);
              break;
            default:
              props[name] = attr;
          }
        }
        // 用模組的預設選項加上元素標籤所設置的選項來初始化選取的模組。
        $this.data(Object.assign({}, localModule.props, props));
        // 然後呼叫自定義的初始化模組函式。
        value = localModule.init(Object.assign({}, localModule.props, props));
        // 將這個元素的 `tocas` 設置為 `true`，表示被初始化過了。
        return $this.data('tocas', true);
      };
      // 如果第一個參數是空的，那麼使用者想直接呼叫這個模組的初始化函式。
      if (arg === null) {
        if ($this.data('tocas') == null) {
          // 如果元素沒有 `tocas` 設置，就表示尚未被初始化。
          // 若真為此，則執行初始化函式。
          return init();
        }
      // 如果第一個參數是物件，就表示使用者想要傳入一個選項物件。
      } else if (typeof arg === 'object') {
        if ($this.data('tocas') != null) {
          // 如果該元素已經被初始化了，我們就呼叫摧毀函式。
          localModule.destroy();
        }
        // 套用新的選項到指定元素。
        // if $this.data('tocas')?
        // 如果先前初始化過了，就覆蓋先前的部分選項。
        //    $this.data arg
        // else
        // 套用覆蓋 + 預設的選項。
        $this.data(Object.assign({}, localModule.props, arg));
        // 以新的選項執行初始化函式並傳入部分參數。
        value = localModule.init(Object.assign({}, localModule.props, arg), arg2, arg3);
        // 將這個元素的 `tocas` 設置為 `true`，表示被初始化過了。
        return $this.data('tocas', true);
      // 如果第一個是字串，就表示使用者想要呼叫模組的自訂方法。
      } else if (typeof arg === 'string') {
        if ($this.data('tocas') == null) {
          // 如果該元素還沒被初始化，我們就要先呼叫初始化函式初始化這個元素。
          init();
        }
        // 呼叫指定的自訂方法並取得回傳值。
        return value = typeof (base = localModule.methods())[arg] === "function" ? base[arg](arg2, arg3) : void 0;
      }
    });
    return value;
  };
};

// 初始化選擇器。
ts.selector = {};

// 初始化 Tocas JS 的函式鏈。
ts.fn = {};

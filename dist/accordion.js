// Generated by CoffeeScript 2.0.0-beta4
// Accordion

// 手風琴
ts.fn.accordion = {
  value: function(parameters) {
    var $allModules, ClassName, EVENT_NAMESPACE, Error, Event, MODULE_NAMESPACE, NAME, Selector, Settings, methodInvoked, query, queryArguments, returnedValue;
    // ------------------------------------------------------------------------
    // 變數與常數設置
    // ------------------------------------------------------------------------

    // 模組名稱。
    NAME = 'accordion';
    // 模組事件鍵名。
    EVENT_NAMESPACE = `.${NAME}`;
    // 模組命名空間。
    MODULE_NAMESPACE = `module-${NAME}`;
    // 模組設定。
    Settings = {
      // 是否僅允許單個手風琴只有一個分頁能被打開。
      exclusive: true,
      // 消音所有提示，甚至是錯誤訊息。
      silent: false,
      // 顯示除錯訊息。
      debug: true,
      // 監聽 DOM 結構異動並自動重整快取。
      observeChanges: true,
      // 展開的手風琴是否可以被關閉。
      collapsible: true,
      // 當手風琴被關閉時，是否一同閉合子手風琴。
      closeNested: true,
      // 當手風琴正在展開時所會呼叫的函式。
      onOpening: function() {},
      // 當手風琴展開時所會呼叫的函式。
      onOpen: function() {},
      // 當手風琴正在關閉時所會呼叫的函式。
      onClosing: function() {},
      // 當手風琴關閉時所會呼叫的函式。
      onClose: function() {},
      // 當手風琴被切換開關時所會呼叫的函式。
      onChange: function() {}
    };
    // 事件名稱。
    Event = {
      OPENING: `opening${EVENT_NAMESPACE}`,
      OPEN: `open${EVENT_NAMESPACE}`,
      CLOSING: `closing${EVENT_NAMESPACE}`,
      CLOSE: `close${EVENT_NAMESPACE}`,
      CHANGE: `change${EVENT_NAMESPACE}`,
      CLICK: `click${EVENT_NAMESPACE}`
    };
    // 樣式名稱。
    ClassName = {
      ACTIVE: 'active',
      ANIMATING: 'animating'
    };
    // 選擇器名稱。
    Selector = {
      TITLE: '.title',
      CONTENT: '.content',
      ACCORDION: '.ts.accordion',
      ACTIVE_CONTENT: '.active.content',
      ACTIVE: '.active'
    };
    // 錯誤訊息。
    Error = {
      METHOD: '欲呼叫的方法並不存在'
    };
    // ------------------------------------------------------------------------
    // 私有變數
    // ------------------------------------------------------------------------
    $allModules = ts(this);
    query = arguments[0];
    queryArguments = [].slice.call(arguments, 1);
    methodInvoked = typeof query === 'string';
    returnedValue = void 0;
    // ------------------------------------------------------------------------
    // 元素遍歷
    // ------------------------------------------------------------------------
    $allModules.each(function() {
      var $content, $this, $title, element, instance, module, settings;
      // ------------------------------------------------------------------------
      // 區域變數
      // ------------------------------------------------------------------------
      $this = ts(this);
      element = this;
      $title = $this.find(Selector.TITLE);
      $content = $this.find(Selector.CONTENT);
      instance = $this.data(MODULE_NAMESPACE);
      settings = ts.isPlainObject(parameters) ? ts.extend(Settings, parameters) : ts.extend(Settings);
      // ------------------------------------------------------------------------
      // 模組定義
      // ------------------------------------------------------------------------
      module = {
        // Open

        // 展開
        open: function(index) {
          var $c, $t;
          $t = $title.eq(index);
          $c = $content.eq(index);
          if ($t.hasClass(ClassName.ACTIVE)) {
            return;
          }
          if (settings.exclusive) {
            module.debug('由於手風琴分頁同時間僅能有一個打開，因此關閉其他分頁', index, element);
            module.closeAll();
          }
          module.debug('開啟手風琴分頁', index, element);
          $this.trigger(Event.OPENING, $c.get());
          $this.trigger(Event.OPEN, $c.get());
          $this.trigger(Event.CHANGE, $c.get());
          $t.addClass(ClassName.ACTIVE);
          return $c.addClass(ClassName.ACTIVE);
        },
        // Close

        // 閉合
        close: function(index) {
          var $c, $t;
          module.debug('關閉手風琴分頁', index, element);
          $t = $title.eq(index);
          $c = $content.eq(index);
          if (!$t.hasClass(ClassName.ACTIVE)) {
            return;
          }
          $this.trigger(Event.CLOSING, $c.get());
          $this.trigger(Event.CLOSE, $c.get());
          $this.trigger(Event.CHANGE, $c.get());
          $t.removeClass(ClassName.ACTIVE);
          $c.removeClass(ClassName.ACTIVE);
          // 如果需要的話，一同關閉子手風琴。
          if (settings.closeNested) {
            module.debug('關閉子手風琴因應設定', index, element);
            return ts($this.find(Selector.ACCORDION)).accordion('close all');
          }
        },
        // Close Others

        // 閉合指定以外
        closeOthers: function(index) {
          module.debug('關閉指定手風琴分頁以外的其他分頁', index, element);
          return module.closeAll();
        },
        // Close All

        // 閉合所有
        closeAll: function() {
          var i, j, ref, results;
          module.debug('關閉所有手風琴分頁', element);
          results = [];
          for (i = j = 0, ref = $this.find(Selector.TITLE).length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
            results.push(module.close(i));
          }
          return results;
        },
        // Toggle

        // 切換開合
        toggle: function(index) {
          var $t;
          module.debug('切換手風琴分頁', index, element);
          $t = $title.eq(index);
          if ($t.hasClass(ClassName.ACTIVE)) {
            if (settings.collapsible) {
              module.close(index);
              return;
            }
            return module.debug('手風琴不允許閉合開啟的分頁，略過切換步驟', index, element);
          } else {
            return module.open(index);
          }
        },
        // Bind

        // 綁定
        bind: {
          // Events

          // 事件
          events: () => {
            $this.on(Event.CLICK, Selector.TITLE, function() {
              module.debug('發生 CLICK 事件', element, this);
              return module.toggle($title.indexOf(this));
            });
            $this.on(Event.OPENING, function(event, context) {
              module.debug('發生 OPENING 事件', context);
              return settings.onOpening.call(context, event);
            });
            $this.on(Event.OPEN, function(event, context) {
              module.debug('發生 OPEN 事件', context);
              return settings.onOpen.call(context, event);
            });
            $this.on(Event.CLOSING, function(event, context) {
              module.debug("發生 CLOSING 事件", context);
              return settings.onClosing.call(context, event);
            });
            $this.on(Event.CLOSE, function(event, context) {
              module.debug("發生 CLOSE 事件", context);
              return settings.onClose.call(context, event);
            });
            return $this.on(Event.CHANGE, function(event, context) {
              module.debug("發生 CHANGE 事件", context);
              return settings.onChange.call(context, event);
            });
          }
        },
        // ------------------------------------------------------------------------
        // 模組核心
        // ------------------------------------------------------------------------

        // Initialize

        // 初始化
        initialize: function() {
          module.debug('初始化手風琴', element);
          module.bind.events();
          if (settings.observeChanges) {
            module.observeChanges();
          }
          return module.instantiate();
        },
        // Instantiate

        // 實例化
        instantiate: function() {
          module.debug('實例化手風琴', element);
          instance = module;
          return $this.data(MODULE_NAMESPACE, instance);
        },
        // Observe Changes

        // 結構異動觀察者
        observeChanges: function() {
          var observer;
          if (!'MutationObserver' in window) {
            module.debug('找不到樹狀結構變更觀測者，略過結構監聽動作', element);
            return;
          }
          observer = new MutationObserver(function(mutations) {
            module.debug('DOM 樹狀結構已變更，更新快取資料');
            return module.refresh();
          });
          observer.observe(element, {
            childList: true,
            subtree: true
          });
          return module.debug('已設置 DOM 樹狀結構異動觀察者', observer);
        },
        // Refresh

        // 更新資料
        refresh: function() {
          $title = $this.find(Selector.TITLE);
          return $content = $this.find(Selector.CONTENT);
        },
        // Destroy

        // 摧毀
        destroy: function() {
          module.debug('摧毀手風琴', element);
          return $this.removeData(MODULE_NAMESPACE).off(EVENT_NAMESPACE);
        },
        // Invoke

        // 模組呼叫點
        invoke: function(query, passedArguments, context) {
          var camelCaseValue, depth, found, j, len, maxDepth, object, response, value;
          object = instance;
          maxDepth = void 0;
          found = void 0;
          response = void 0;
          passedArguments = passedArguments || queryArguments;
          context = element || context;
          // 如果語法是字串，本地區域也有被定義的話。
          if (typeof query === 'string' && object !== void 0) {
            // 將語法以空白分隔。
            query = query.split(/[\. ]/);
            // 取得此語法的深度。
            maxDepth = query.length - 1;
            // 解析語法的每個片段。
            for (depth = j = 0, len = query.length; j < len; depth = ++j) {
              value = query[depth];
              // 將語法轉換成駝峰式大小寫，用以對應本地模組的函式名稱。
              camelCaseValue = depth !== maxDepth ? value + query[depth + 1].charAt(0).toUpperCase() + query[depth + 1].slice(1) : query;
              // 如果此駝峰是大小寫有對應到模組中的物件，而且語法還未到底，那麼就依照此物件遞迴搜尋。
              if (ts.isPlainObject(object[camelCaseValue]) && depth !== maxDepth) {
                object = object[camelCaseValue];
              // 如果語法駝峰式大小寫有對應到模組的一個函式，則使用該函式。
              } else if (object[camelCaseValue] !== void 0) {
                found = object[camelCaseValue];
                break;
              // 如果語法有對應到模組中的物件，而且語法還未到底，那麼就依照此物件遞迴搜尋。
              } else if (ts.isPlainObject(object[value]) && depth !== maxDepth) {
                object = object[value];
              // 如果語法有對應一個函式，則使用該函式。
              } else if (object[value] !== void 0) {
                found = object[value];
                break;
              } else {
                // 如果語法沒有對應到任何東西則表示錯誤。
                module.error(Error.METHOD, query);
                break;
              }
            }
          }
          switch (false) {
            // 當找到的對應物件是個函式，就呼叫該函式並取得其結果。
            // 決定回應的結果。
            case typeof found !== 'function':
              response = found.apply(context, passedArguments);
              break;
            // 當找到的物件不是函式，就當其為結果。
            case found === void 0:
              response = found;
          }
          switch (false) {
            // 當回傳的值是一個陣列，就將回應結果推入回傳值陣列中。
            // 決定如何處置欲回傳的值。
            case !Array.isArray(returnedValue):
              returnedValue.push(response);
              break;
            // 如果回傳的值不是陣列，則建立一個陣列並包含自己和回應結果。
            case returnedValue === void 0:
              returnedValue = [returnedValue, response];
              break;
            // 當有回應時，就將回傳值設為其回應結果。
            case response === void 0:
              returnedValue = response;
          }
          // 回傳找到的物件。
          return found;
        },
        // Debug

        // 除錯訊息
        debug: function() {
          if (!settings.debug || settings.silent) {
            return;
          }
          module.debug = Function.prototype.bind.call(console.info, console, `${NAME}:`);
          return module.debug.apply(console, arguments);
        },
        // Error

        // 錯誤訊息
        error: function() {
          if (settings.silent) {
            return;
          }
          module.error = Function.prototype.bind.call(console.error, console, `${NAME}:`);
          return module.error.apply(console, arguments);
        }
      };
      // ------------------------------------------------------------------------
      // Tocas 核心安插
      // ------------------------------------------------------------------------
      if (methodInvoked) {
        if (instance === void 0) {
          module.initialize();
        }
        return module.invoke(query);
      } else {
        if (instance !== void 0) {
          instance.invoke('destroy');
        }
        return module.initialize();
      }
    });
    if (returnedValue !== void 0) {
      return returnedValue;
    } else {
      return ts;
    }
  }
};

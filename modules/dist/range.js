// Generated by CoffeeScript 2.0.0-beta4
// Range

// 範圍。
var Range;

Range = (function() {
  class Range {
    constructor() {
      // 元素初始化函式。
      this.init = this.init.bind(this);
      // 元素摧毀函式。
      this.destroy = this.destroy.bind(this);
      // 模組可用的方法。
      this.methods = this.methods.bind(this);
    }

    init() {
      // 監聽關閉按鈕的點擊事件。
      this.$this.find(this.selector.CLOSE_BUTTON).on('click.message', () => {
        var ref;
        if ((ref = this.$this.data('onClose')) != null) {
          ref.call(this.$this.get());
        }
        return this.$this.addClass(this.className.HIDDEN);
      });
      return ts.fn;
    }

    destroy() {
      return this.$this.find(this.selector.CLOSE_BUTTON).off('click.message');
    }

    methods() {
      return {
        add: (value) => {},
        subtract: (value) => {},
        'set value': (value) => {}
      };
    }

  };

  // 模組名稱。
  Range.module = 'range';

  // 模組屬性。
  Range.prototype.props = {
    
    onChange: function() {},
    
    onAdd: function() {},
    
    onSubtract: function() {}
  };

  // 類別樣式名稱。
  Range.prototype.className = {
    HIDDEN: 'hidden'
  };

  // 選擇器名稱。
  Range.prototype.selector = {
    CLOSE_BUTTON: '.ts.close.button'
  };

  return Range;

})();

ts(Message);
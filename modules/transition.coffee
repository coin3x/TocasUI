# Transition
#
# 過場效果。

class Transition
    # 模組名稱。
    @module:
        'transition'

    props:
        # 欲執行的動畫名稱。
        animation    : null
        # 這個動畫是否要反序執行。
        reverse      : false
        # 此動畫的元素間隔毫秒。
        interval     : 80
        # 此動畫的速度毫秒。
        duration     : 1000
        # 當此動畫完成時所會呼叫的函式。
        onComplete   : ->
        # 當此動畫的所有元素都完成播放時所會呼叫的函式。
        onAllComplete: ->
        # 此動畫開始演繹時所會呼叫的函式。
        onStart      : ->

    #
    init: (options) =>

        ts.fn

    # Until Visible
    #
    # 此函式會以 `await` 的方式持續阻擋，直到頁面在客戶端上可見為止。
    # 這是避免瀏覽器在不可見的時候會進行重繪，導致動畫亂序。
    untilVisible: =>
        new Promise (resolve) =>
            check = =>
                # 如果頁面是處於不可見狀態就返回，持續阻擋。
                if document.visibilityState isnt 'visible'
                    return

                # 如果可見了，就呼叫解決函式。
                resolve()

                # 然後移除頁面的可見度變更監聽事件。
                document.removeEventListener 'visibilitychange', check

            # 新增頁面可見度變更監聽事件，當可見度變更時就呼叫一次檢查函式。
            document.addEventListener 'visibilitychange', check

            # 立即檢查一次。
            check()

    # Data
    #
    # 取得動畫資料。
    data: =>
        # 如果主要的資料中心不存在，就初始化一個。
        if document.body.$data is undefined
            document.body.$data = {}

        # 從資料中心取得動畫資料。
        data = document.body.$data.animationData

        # 如果動畫資料不存在就初始化一個。
        if data is undefined
            data = {}
            document.body.$data.animationData = data

        # 如果動畫資料裡沒有這個選擇器的資料，就初始化一個。
        if data[@$elements.selector] is undefined
            data[@$elements.selector] =
                looping  : false
                index    : 0
                queue    : []
                animating: false
                queuing  : false
                quited   : false
                timer    : false
            document.body.$data.animationData = data

        # 回傳下列可用的輔助函式。
        return
            # save 會儲存新的動畫資料到目前的選擇器中。
            save: (newData) =>
                data[@$elements.selector] = newData
                document.body.$data.animationData = data

            # get 會取得目前選擇器的動畫資料。
            get: =>
                data[@$elements.selector]

    # Push
    #
    # 將新的動畫資料推入至目前選擇器的佇列中。
    push: (options) =>
        # 稍後一下等待保存變更。
        await @delay()

        options.duration   = options.duration   or 1000
        options.onComplete = options.onComplete or ->

        # 取得目前選擇器的動畫資料。
        data = @data().get()

        # 將本次的動畫推入至選擇器內的動畫佇列中。
        data.queue.push {
            # 預設的動畫選項。
            @props...
            # 加上使用者自訂的選項。
            options...
        }

        # 將這個變更保存到主要中心。
        @data().save(data)

        # 稍後一下等待保存變更。
        await @delay()

        # 如果這是第一個動畫，就開始播放。
        if data.index is 0
            @play()

    # Play
    #
    # 取得選擇器目前該播放的動畫，並且開始演繹。
    play: =>
        #
        @cleanTimer()

        # 取得目前選擇器的動畫資料。
        data = @data().get()

        # 表示目前正在執行動畫。
        data.animating = true

        # 從動畫資料中的佇列與索引取得出本次該播放的動畫。
        animation = data.queue[data.index]

        # 如果本次動畫不存在。
        if animation is undefined
            # 就重設動畫索引。
            data.index     = 0
            data.animating = false
            @data().save(data)

            # 如果這個選擇器的動畫是可供重複的，那麼就重頭開始播放動畫。
            if data.looping
                @play()
                return

            # 不然就清空動畫佇列。
            data.queue = []
            @data().save(data)

            return

        # 動畫索引遞加。
        data.index++
        @data().save(data)

        # 播放本次動畫並且到所有元素都演繹本次動畫結束才繼續。
        await @animate animation

        # 稍後一下。
        await @delay()

        # 播放下次的動畫。
        @play()

    # Is Quited
    #
    # 如果本次動畫佇列已經被標記為「離開」時，就重設並回傳 `true`。
    isQuited: =>
        if @data().get().quited
            data           = @data().get()
            data.animating = false
            data.quited    = false
            @data().save(data)
            return true
        return false

    cleanTimer: =>
        if @data().get().timer is true
            return

        data       = @data().get()
        data.timer = true
        @data().save(data)

        timer = setInterval =>
            if @data().get().quited is false
                return

            data           = @data().get()
            data.animating = false
            #data.quited    = false
            data.timer     = false
            @data().save(data)

            @$elements
                .removeAttr 'data-animating-hidden'
                .removeAttr 'data-animation'
                .removeAttr 'data-animating'
                .css        'animation-duration', ''
                .off        'animationend'

            clearInterval(timer)
        , 1

    # Animate
    #
    # 以指定動畫演繹選擇器中所有元素。
    animate: ({animation, reverse, forceOrder, interval, duration, onComplete, onAllComplete, onStart}) =>
        # 回傳 Promise 物件才能夠阻擋到所有元素在本輪都演繹結束。
        return new Promise (resolve) =>
            # 如果動畫佇列在這個時候被終止就停止演繹。
            if @isQuited()
                resolve()
                return

            # 將元素選擇器轉換為陣列，這樣才能以迴圈遞迴。
            # 因為 `await` 只能在 `for` 中使用，而不能用在 `.each` 或 `.forEach`。
            elements = @$elements.toArray()

            # 如果這個動畫要反序播放就反轉選擇器陣列。
            if reverse
                elements = elements.reverse()

            # 如果動畫是下列自訂動畫，就做額外處理。
            switch animation
                # delay 會延遲一段時間。
                when 'delay'
                    await @delay duration
                    resolve()
                    return

                # show 會讓元素可見，並且沒有延遲時間。
                when 'show'
                    @$elements.removeAttr 'data-animating-hidden'
                    resolve()
                    return

                # hide 會讓元素隱藏，並且沒有延遲時間。
                when 'hide'
                    @$elements.attr 'data-animating-hidden', 'true'
                    resolve()
                    return

                # toggle 會切換元素的可見與隱藏，並且沒有延遲時間。
                when 'toggle'
                    if @$this.attr('data-animating-hidden') is 'true'
                        @$this.removeAttr 'data-animating-hidden'
                    else
                        @$this.attr 'data-animating-hidden', 'true'
                    resolve()
                    return

                #
                #when 'show visibility'

                #
                #when 'hide visibility'

                #
                #when 'toggle visibility'

            # 遞迴元素選擇器陣列，這樣才能透過 `await` 一個一個逐一執行其動畫。
            for element, index in elements
                # 如果動畫佇列在這個時候被終止就停止演繹。
                return if @isQuited()

                # 已選擇器選擇這個元素。
                $element = $selector element

                # 持續以 `await` 阻擋，直到此頁面在螢幕上可見。
                # 這可以避免瀏覽器因為重新繪製而打亂動畫的順序，如果移除此方法會雜亂無章。
                await @untilVisible()

                # 以閉包方式執行本次動畫，避免 For 迴圈覆蓋了元素變數。
                do ($element, index) =>
                    # 本次動畫開始，呼叫開始回呼函式。
                    onStart.call $element.get()

                    # 如果動畫名稱中有 `in` 就表示這個動畫會顯示元素，所以就移除元素的隱藏標籤。
                    if animation.indexOf('in') isnt -1
                        $element.removeAttr 'data-animating-hidden'

                    # 套用動畫名稱、動畫速度。
                    $element
                        .attr 'data-animation'    , animation
                        .css  'animation-duration', "#{duration}ms"

                    # 稍微等待一下才套用執行動畫的標籤，這樣才會有動作。
                    await @delay()

                    # 套用執行動畫的標籤。
                    $element.attr 'data-animating', true

                    # 當這個元素的動畫執行結束時。
                    $element
                        .one 'animationend', =>
                            # 如果動畫佇列在這個時候被終止就結束。
                            return if @isQuited()

                            # 呼叫完成函式，並且傳遞自己作為 `this`。
                            onComplete.call $element.get()

                            # 動畫結束後移除自己所以和動畫有關的標籤。
                            $element
                                .removeAttr 'data-animation'
                                .removeAttr 'data-animating'
                                .css        'animation-duration', ''

                            # 如果動畫名稱中有 `out` 就表示這個動畫會隱藏元素，所以就在動畫結束後加上元素隱藏標籤。
                            if animation.indexOf('out') isnt -1
                                $element.attr 'data-animating-hidden', 'true'

                            # 如果這是本次動畫中的最後一個元素，而且又演繹結束的話。
                            if index is elements.length - 1
                                # 就呼叫所有動畫完成的回呼函式。
                                onAllComplete()

                                # 稍微等待一下。
                                await @delay()

                                # 然後呼叫 Promise 的解決函式，這樣就可以進行下一輪的動畫了。
                                resolve()
                        .emulate 'animationend', duration + interval + 10

                # 等待指定延遲才演繹下個元素。
                await @delay interval

    # Simple Push
    #
    # 簡易版的 Push，將動畫推入至動畫佇列中。
    simplePush: (animation, duration, onComplete) =>
        # 如果這不是選擇器中的第一個元素就離開，
        # 因為這個函式只能被執行一次避免重複。
        if @index isnt 0
            return ts.fn

        # 推入簡化的動畫資料到佇列中。
        @push
            animation : animation
            duration  : duration
            onComplete: onComplete

        ts.fn

    #
    destroy: =>

    # 模組可用的方法。
    methods: =>

        # Delay
        #
        # 延遲指定時間才執行下一個動畫。
        delay: (duration, onComplete) =>
            @simplePush 'delay', duration, onComplete

        # Stop
        #
        # 停止目前的這個動畫，執行下一個。
        stop: =>
            #
            @$elements
                .removeAttr 'data-animating-hidden'
                .removeAttr 'data-animation'
                .removeAttr 'data-animating'
                .css        'animation-duration', ''
                .trigger    'animationend'
            ts.fn

        # Stop All
        #
        # 停止目前的動畫並且移除整個動畫佇列。
        'stop all': =>
            if @index isnt 0
                return ts.fn

            # 重設選擇器中的動畫設定。
            data           = @data().get()
            data.index     = 0
            data.looping   = false
            data.queue     = []
            data.quited    = true
            data.animating = false
            @data().save(data)

            # 移除所有元素和動畫有關的標籤。
            #@$elements
            #    .removeAttr 'data-animating-hidden'
            #    .removeAttr 'data-animation'
            #    .removeAttr 'data-animating'
            #    .css        'animation-duration', ''
            #    .trigger    'animationend'

            ts.fn

        # Clear Queue
        #
        # 執行完目前的動畫後就停止並且移除整個動畫佇列。
        'clear queue': =>
            do =>
                # 重設選擇器中的動畫設定。
                data         = @data().get()
                data.looping = false
                data.index   = 0
                data.queue   = []
                @data().save(data)
            ts.fn

        # Show
        #
        # 不透過動畫顯示一個元素。
        show: (duration, onComplete) =>
            @simplePush 'show', duration, onComplete

        # Hide
        #
        # 不透過動畫隱藏一個元素。
        hide: (duration, onComplete) =>
            @simplePush 'hide', duration, onComplete

        # Toggle
        #
        # 不透過動畫切換一個元素的顯示或隱藏狀態。
        toggle: (duration, onComplete) =>
            @simplePush 'toggle', duration, onComplete

        # Show Visibility
        #
        # 不透過動畫顯示一個元素的可見狀態。
        'show visibility': (duration, onComplete) =>
            @simplePush 'show visibility', duration, onComplete

        # Hide Visibility
        #
        # 不透過動畫隱藏一個元素的可見狀態，這不會移除元素所佔用的空間。
        'hide visibility': (duration, onComplete) =>
            @simplePush 'hide visibility', duration, onComplete

        # Toggle Visibility
        #
        # 不透過動畫切換一個元素的顯示或隱藏可見狀態，這會令元素持續佔用其原本的空間。
        'toggle visibility': (duration, onComplete) =>
            @simplePush 'toggle visibility', duration, onComplete

        # Set Looping
        #
        # 允許動畫佇列執行到底之後重頭開始，不斷地循環。
        'set looping': =>
            do =>
                await @delay()
                await @delay()
                data = @data().get()
                data.looping = yes
                @data().save(data)
            ts.fn

        # Remove Looping
        #
        # 移除動畫佇列的循環效果。
        'remove looping': =>
            data = @data().get()
            data.looping = no
            @data().save(data)
            ts.fn

        # Is Visible
        #
        # 取得一個元素是否可見的布林值。
        'is visible': =>

        # Is Animating
        #
        # 取得一個元素是否正在進行動畫的布林值。
        'is animating': =>
            @data().get().animating

        # Is Looping
        #
        # 取得一個元素的動畫佇列是否允許循環的布林值。
        'is looping': =>
            @data().get().looping

        # Get Animation Name
        #
        # 取得一個元素的動畫佇列是否允許循環的布林值。
        'get animation name': =>
            data = @data().get()
            data.queue?[data.index]?.animation

        # Fade Out Down
        #
        #
        bounce: (duration, onComplete) =>
            @simplePush 'bounce', duration, onComplete

        # Fade Out Down
        #
        #
        flash: (duration, onComplete) =>
            @simplePush 'flash', duration, onComplete

        # Fade Out Down
        #
        #
        pulse: (duration, onComplete) =>
            @simplePush 'pulse', duration, onComplete

        # Fade Out Down
        #
        #
        'rubber band': (duration, onComplete) =>
            @simplePush 'rubber band', duration, onComplete

        # Fade Out Down
        #
        #
        shake: (duration, onComplete) =>
            @simplePush 'shake', duration, onComplete

        # Fade Out Down
        #
        #
        'head shake': (duration, onComplete) =>
            @simplePush 'head shake', duration, onComplete

        # Fade Out Down
        #
        #
        swing: (duration, onComplete) =>
            @simplePush 'swing', duration, onComplete

        # Fade Out Down
        #
        #
        tada: (duration, onComplete) =>
            @simplePush 'tada', duration, onComplete

        # Fade Out Down
        #
        #
        wobble: (duration, onComplete) =>
            @simplePush 'wobble', duration, onComplete

        # Fade Out Down
        #
        #
        jello: (duration, onComplete) =>
            @simplePush 'jello', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce in': (duration, onComplete) =>
            @simplePush 'bounce in', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce in down': (duration, onComplete) =>
            @simplePush 'bounce in down', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce in left': (duration, onComplete) =>
            @simplePush 'bounce in left', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce in right': (duration, onComplete) =>
            @simplePush 'bounce in right', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce in up': (duration, onComplete) =>
            @simplePush 'bounce in up', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce out': (duration, onComplete) =>
            @simplePush 'bounce out', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce down': (duration, onComplete) =>
            @simplePush 'bounce down', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce out left': (duration, onComplete) =>
            @simplePush 'bounce out left', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce out right': (duration, onComplete) =>
            @simplePush 'bounce out right', duration, onComplete

        # Fade Out Down
        #
        #
        'bounce out up': (duration, onComplete) =>
            @simplePush 'bounce out up', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in': (duration, onComplete) =>
            @simplePush 'fade in', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in down': (duration, onComplete) =>
            @simplePush 'fade in down', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in down heavily': (duration, onComplete) =>
            @simplePush 'fade in down heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in left': (duration, onComplete) =>
            @simplePush 'fade in left', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in left heavily': (duration, onComplete) =>
            @simplePush 'fade in left heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in right': (duration, onComplete) =>
            @simplePush 'fade in right', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in right heavily': (duration, onComplete) =>
            @simplePush 'fade in right heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in up': (duration, onComplete) =>
            @simplePush 'fade in up', duration, onComplete

        # Fade Out Down
        #
        #
        'fade in up heavily': (duration, onComplete) =>
            @simplePush 'fade in up heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out down': (duration, onComplete) =>
            @simplePush 'fade out down', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out down heavily': (duration, onComplete) =>
            @simplePush 'fade out down heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out left': (duration, onComplete) =>
            @simplePush 'fade out left', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out left heavily': (duration, onComplete) =>
            @simplePush 'fade out left heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out right': (duration, onComplete) =>
            @simplePush 'fade out right', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out right heavily': (duration, onComplete) =>
            @simplePush 'fade out right heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out up': (duration, onComplete) =>
            @simplePush 'fade out up', duration, onComplete

        # Fade Out Down
        #
        #
        'fade out up heavily': (duration, onComplete) =>
            @simplePush 'fade out up heavily', duration, onComplete

        # Fade Out Down
        #
        #
        'flip': (duration, onComplete) =>
            @simplePush 'flip', duration, onComplete

        # Fade Out Down
        #
        #
        'flip in x': (duration, onComplete) =>
            @simplePush 'flip in x', duration, onComplete

        # Fade Out Down
        #
        #
        'flip in y': (duration, onComplete) =>
            @simplePush 'flip in y', duration, onComplete

        # Fade Out Down
        #
        #
        'flip out x': (duration, onComplete) =>
            @simplePush 'flip out x', duration, onComplete

        # Fade Out Down
        #
        #
        'flip out y': (duration, onComplete) =>
            @simplePush 'flip out y', duration, onComplete

        # Fade Out Down
        #
        #
        'light speed in': (duration, onComplete) =>
            @simplePush 'light speed in', duration, onComplete

        # Fade Out Down
        #
        #
        'light speed out': (duration, onComplete) =>
            @simplePush 'light speed out', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate in': (duration, onComplete) =>
            @simplePush 'rotate in', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate in down left': (duration, onComplete) =>
            @simplePush 'rotate in down left', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate in down right': (duration, onComplete) =>
            @simplePush 'rotate in down right', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate in up left': (duration, onComplete) =>
            @simplePush 'rotate in up left', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate in up right': (duration, onComplete) =>
            @simplePush 'rotate in up right', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate out': (duration, onComplete) =>
            @simplePush 'rotate out', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate out down left': (duration, onComplete) =>
            @simplePush 'rotate out down left', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate out down right': (duration, onComplete) =>
            @simplePush 'rotate out down right', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate out up left': (duration, onComplete) =>
            @simplePush 'rotate out up left', duration, onComplete

        # Fade Out Down
        #
        #
        'rotate out up right': (duration, onComplete) =>
            @simplePush 'rotate out up right', duration, onComplete

        # Fade Out Down
        #
        #
        'hinge': (duration, onComplete) =>
            @simplePush 'hinge', duration, onComplete

        # Fade Out Down
        #
        #
        'roll in': (duration, onComplete) =>
            @simplePush 'roll in', duration, onComplete

        # Fade Out Down
        #
        #
        'roll out': (duration, onComplete) =>
            @simplePush 'roll out', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom in': (duration, onComplete) =>
            @simplePush 'zoom in', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom in down': (duration, onComplete) =>
            @simplePush 'zoom in down', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom in left': (duration, onComplete) =>
            @simplePush 'zoom in left', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom in up': (duration, onComplete) =>
            @simplePush 'zoom in up', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom in right': (duration, onComplete) =>
            @simplePush 'zoom in right', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom out': (duration, onComplete) =>
            @simplePush 'zoom out', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom out down': (duration, onComplete) =>
            @simplePush 'zoom out down', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom out left': (duration, onComplete) =>
            @simplePush 'zoom out left', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom out right': (duration, onComplete) =>
            @simplePush 'zoom out right', duration, onComplete

        # Fade Out Down
        #
        #
        'zoom out up': (duration, onComplete) =>
            @simplePush 'zoom out up', duration, onComplete

        # Fade Out Down
        #
        #
        'slide in down': (duration, onComplete) =>
            @simplePush 'slide in down', duration, onComplete

        # Fade Out Down
        #
        #
        'slide in left': (duration, onComplete) =>
            @simplePush 'slide in left', duration, onComplete

        # Fade Out Down
        #
        #
        'slide in right': (duration, onComplete) =>
            @simplePush 'slide in right', duration, onComplete

        # Fade Out Down
        #
        #
        'slide in up': (duration, onComplete) =>
            @simplePush 'slide in up', duration, onComplete

        # Fade Out Down
        #
        #
        'slide out down': (duration, onComplete) =>
            @simplePush 'slide out down', duration, onComplete

        # Fade Out Down
        #
        #
        'slide out left': (duration, onComplete) =>
            @simplePush 'slide out left', duration, onComplete

        # Fade Out Down
        #
        #
        'slide out right': (duration, onComplete) =>
            @simplePush 'slide out right', duration, onComplete

        # Fade Out Down
        #
        #
        'slide out up': (duration, onComplete) =>
            @simplePush 'slide out up', duration, onComplete

ts Transition
//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public protocol GlobalEventHandlers: JSBridgedClass {}
public extension GlobalEventHandlers {
    @inlinable var onabort: EventHandler {
        get { ClosureAttribute1Optional[.onabort, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onabort, in: jsObject] = newValue }
    }

    @inlinable var onauxclick: EventHandler {
        get { ClosureAttribute1Optional[.onauxclick, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onauxclick, in: jsObject] = newValue }
    }

    @inlinable var onbeforeinput: EventHandler {
        get { ClosureAttribute1Optional[.onbeforeinput, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforeinput, in: jsObject] = newValue }
    }

    @inlinable var onbeforematch: EventHandler {
        get { ClosureAttribute1Optional[.onbeforematch, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforematch, in: jsObject] = newValue }
    }

    @inlinable var onbeforetoggle: EventHandler {
        get { ClosureAttribute1Optional[.onbeforetoggle, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforetoggle, in: jsObject] = newValue }
    }

    @inlinable var onblur: EventHandler {
        get { ClosureAttribute1Optional[.onblur, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onblur, in: jsObject] = newValue }
    }

    @inlinable var oncancel: EventHandler {
        get { ClosureAttribute1Optional[.oncancel, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncancel, in: jsObject] = newValue }
    }

    @inlinable var oncanplay: EventHandler {
        get { ClosureAttribute1Optional[.oncanplay, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncanplay, in: jsObject] = newValue }
    }

    @inlinable var oncanplaythrough: EventHandler {
        get { ClosureAttribute1Optional[.oncanplaythrough, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncanplaythrough, in: jsObject] = newValue }
    }

    @inlinable var onchange: EventHandler {
        get { ClosureAttribute1Optional[.onchange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onchange, in: jsObject] = newValue }
    }

    @inlinable var onclick: EventHandler {
        get { ClosureAttribute1Optional[.onclick, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onclick, in: jsObject] = newValue }
    }

    @inlinable var onclose: EventHandler {
        get { ClosureAttribute1Optional[.onclose, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onclose, in: jsObject] = newValue }
    }

    @inlinable var oncontextlost: EventHandler {
        get { ClosureAttribute1Optional[.oncontextlost, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncontextlost, in: jsObject] = newValue }
    }

    @inlinable var oncontextmenu: EventHandler {
        get { ClosureAttribute1Optional[.oncontextmenu, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncontextmenu, in: jsObject] = newValue }
    }

    @inlinable var oncontextrestored: EventHandler {
        get { ClosureAttribute1Optional[.oncontextrestored, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncontextrestored, in: jsObject] = newValue }
    }

    @inlinable var oncopy: EventHandler {
        get { ClosureAttribute1Optional[.oncopy, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncopy, in: jsObject] = newValue }
    }

    @inlinable var oncuechange: EventHandler {
        get { ClosureAttribute1Optional[.oncuechange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncuechange, in: jsObject] = newValue }
    }

    @inlinable var oncut: EventHandler {
        get { ClosureAttribute1Optional[.oncut, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oncut, in: jsObject] = newValue }
    }

    @inlinable var ondblclick: EventHandler {
        get { ClosureAttribute1Optional[.ondblclick, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondblclick, in: jsObject] = newValue }
    }

    @inlinable var ondrag: EventHandler {
        get { ClosureAttribute1Optional[.ondrag, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondrag, in: jsObject] = newValue }
    }

    @inlinable var ondragend: EventHandler {
        get { ClosureAttribute1Optional[.ondragend, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondragend, in: jsObject] = newValue }
    }

    @inlinable var ondragenter: EventHandler {
        get { ClosureAttribute1Optional[.ondragenter, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondragenter, in: jsObject] = newValue }
    }

    @inlinable var ondragleave: EventHandler {
        get { ClosureAttribute1Optional[.ondragleave, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondragleave, in: jsObject] = newValue }
    }

    @inlinable var ondragover: EventHandler {
        get { ClosureAttribute1Optional[.ondragover, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondragover, in: jsObject] = newValue }
    }

    @inlinable var ondragstart: EventHandler {
        get { ClosureAttribute1Optional[.ondragstart, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondragstart, in: jsObject] = newValue }
    }

    @inlinable var ondrop: EventHandler {
        get { ClosureAttribute1Optional[.ondrop, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondrop, in: jsObject] = newValue }
    }

    @inlinable var ondurationchange: EventHandler {
        get { ClosureAttribute1Optional[.ondurationchange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ondurationchange, in: jsObject] = newValue }
    }

    @inlinable var onemptied: EventHandler {
        get { ClosureAttribute1Optional[.onemptied, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onemptied, in: jsObject] = newValue }
    }

    @inlinable var onended: EventHandler {
        get { ClosureAttribute1Optional[.onended, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onended, in: jsObject] = newValue }
    }

    @inlinable var onerror: OnErrorEventHandler {
        get { ClosureAttribute5Optional[.onerror, in: jsObject] }
        nonmutating set { ClosureAttribute5Optional[.onerror, in: jsObject] = newValue }
    }

    @inlinable var onfocus: EventHandler {
        get { ClosureAttribute1Optional[.onfocus, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onfocus, in: jsObject] = newValue }
    }

    @inlinable var onformdata: EventHandler {
        get { ClosureAttribute1Optional[.onformdata, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onformdata, in: jsObject] = newValue }
    }

    @inlinable var oninput: EventHandler {
        get { ClosureAttribute1Optional[.oninput, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oninput, in: jsObject] = newValue }
    }

    @inlinable var oninvalid: EventHandler {
        get { ClosureAttribute1Optional[.oninvalid, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.oninvalid, in: jsObject] = newValue }
    }

    @inlinable var onkeydown: EventHandler {
        get { ClosureAttribute1Optional[.onkeydown, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onkeydown, in: jsObject] = newValue }
    }

    @inlinable var onkeypress: EventHandler {
        get { ClosureAttribute1Optional[.onkeypress, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onkeypress, in: jsObject] = newValue }
    }

    @inlinable var onkeyup: EventHandler {
        get { ClosureAttribute1Optional[.onkeyup, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onkeyup, in: jsObject] = newValue }
    }

    @inlinable var onload: EventHandler {
        get { ClosureAttribute1Optional[.onload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onload, in: jsObject] = newValue }
    }

    @inlinable var onloadeddata: EventHandler {
        get { ClosureAttribute1Optional[.onloadeddata, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onloadeddata, in: jsObject] = newValue }
    }

    @inlinable var onloadedmetadata: EventHandler {
        get { ClosureAttribute1Optional[.onloadedmetadata, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onloadedmetadata, in: jsObject] = newValue }
    }

    @inlinable var onloadstart: EventHandler {
        get { ClosureAttribute1Optional[.onloadstart, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onloadstart, in: jsObject] = newValue }
    }

    @inlinable var onmousedown: EventHandler {
        get { ClosureAttribute1Optional[.onmousedown, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmousedown, in: jsObject] = newValue }
    }

    @inlinable var onmouseenter: EventHandler {
        get { ClosureAttribute1Optional[.onmouseenter, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmouseenter, in: jsObject] = newValue }
    }

    @inlinable var onmouseleave: EventHandler {
        get { ClosureAttribute1Optional[.onmouseleave, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmouseleave, in: jsObject] = newValue }
    }

    @inlinable var onmousemove: EventHandler {
        get { ClosureAttribute1Optional[.onmousemove, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmousemove, in: jsObject] = newValue }
    }

    @inlinable var onmouseout: EventHandler {
        get { ClosureAttribute1Optional[.onmouseout, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmouseout, in: jsObject] = newValue }
    }

    @inlinable var onmouseover: EventHandler {
        get { ClosureAttribute1Optional[.onmouseover, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmouseover, in: jsObject] = newValue }
    }

    @inlinable var onmouseup: EventHandler {
        get { ClosureAttribute1Optional[.onmouseup, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmouseup, in: jsObject] = newValue }
    }

    @inlinable var onpaste: EventHandler {
        get { ClosureAttribute1Optional[.onpaste, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpaste, in: jsObject] = newValue }
    }

    @inlinable var onpause: EventHandler {
        get { ClosureAttribute1Optional[.onpause, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpause, in: jsObject] = newValue }
    }

    @inlinable var onplay: EventHandler {
        get { ClosureAttribute1Optional[.onplay, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onplay, in: jsObject] = newValue }
    }

    @inlinable var onplaying: EventHandler {
        get { ClosureAttribute1Optional[.onplaying, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onplaying, in: jsObject] = newValue }
    }

    @inlinable var onprogress: EventHandler {
        get { ClosureAttribute1Optional[.onprogress, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onprogress, in: jsObject] = newValue }
    }

    @inlinable var onratechange: EventHandler {
        get { ClosureAttribute1Optional[.onratechange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onratechange, in: jsObject] = newValue }
    }

    @inlinable var onreset: EventHandler {
        get { ClosureAttribute1Optional[.onreset, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onreset, in: jsObject] = newValue }
    }

    @inlinable var onresize: EventHandler {
        get { ClosureAttribute1Optional[.onresize, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onresize, in: jsObject] = newValue }
    }

    @inlinable var onscroll: EventHandler {
        get { ClosureAttribute1Optional[.onscroll, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onscroll, in: jsObject] = newValue }
    }

    @inlinable var onscrollend: EventHandler {
        get { ClosureAttribute1Optional[.onscrollend, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onscrollend, in: jsObject] = newValue }
    }

    @inlinable var onsecuritypolicyviolation: EventHandler {
        get { ClosureAttribute1Optional[.onsecuritypolicyviolation, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onsecuritypolicyviolation, in: jsObject] = newValue }
    }

    @inlinable var onseeked: EventHandler {
        get { ClosureAttribute1Optional[.onseeked, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onseeked, in: jsObject] = newValue }
    }

    @inlinable var onseeking: EventHandler {
        get { ClosureAttribute1Optional[.onseeking, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onseeking, in: jsObject] = newValue }
    }

    @inlinable var onselect: EventHandler {
        get { ClosureAttribute1Optional[.onselect, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onselect, in: jsObject] = newValue }
    }

    @inlinable var onslotchange: EventHandler {
        get { ClosureAttribute1Optional[.onslotchange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onslotchange, in: jsObject] = newValue }
    }

    @inlinable var onstalled: EventHandler {
        get { ClosureAttribute1Optional[.onstalled, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onstalled, in: jsObject] = newValue }
    }

    @inlinable var onsubmit: EventHandler {
        get { ClosureAttribute1Optional[.onsubmit, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onsubmit, in: jsObject] = newValue }
    }

    @inlinable var onsuspend: EventHandler {
        get { ClosureAttribute1Optional[.onsuspend, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onsuspend, in: jsObject] = newValue }
    }

    @inlinable var ontimeupdate: EventHandler {
        get { ClosureAttribute1Optional[.ontimeupdate, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ontimeupdate, in: jsObject] = newValue }
    }

    @inlinable var ontoggle: EventHandler {
        get { ClosureAttribute1Optional[.ontoggle, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ontoggle, in: jsObject] = newValue }
    }

    @inlinable var onvolumechange: EventHandler {
        get { ClosureAttribute1Optional[.onvolumechange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onvolumechange, in: jsObject] = newValue }
    }

    @inlinable var onwaiting: EventHandler {
        get { ClosureAttribute1Optional[.onwaiting, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onwaiting, in: jsObject] = newValue }
    }

    @inlinable var onwebkitanimationend: EventHandler {
        get { ClosureAttribute1Optional[.onwebkitanimationend, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onwebkitanimationend, in: jsObject] = newValue }
    }

    @inlinable var onwebkitanimationiteration: EventHandler {
        get { ClosureAttribute1Optional[.onwebkitanimationiteration, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onwebkitanimationiteration, in: jsObject] = newValue }
    }

    @inlinable var onwebkitanimationstart: EventHandler {
        get { ClosureAttribute1Optional[.onwebkitanimationstart, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onwebkitanimationstart, in: jsObject] = newValue }
    }

    @inlinable var onwebkittransitionend: EventHandler {
        get { ClosureAttribute1Optional[.onwebkittransitionend, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onwebkittransitionend, in: jsObject] = newValue }
    }

    @inlinable var onwheel: EventHandler {
        get { ClosureAttribute1Optional[.onwheel, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onwheel, in: jsObject] = newValue }
    }

    @inlinable var ontouchstart: EventHandler {
        get { ClosureAttribute1Optional[.ontouchstart, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ontouchstart, in: jsObject] = newValue }
    }

    @inlinable var ontouchend: EventHandler {
        get { ClosureAttribute1Optional[.ontouchend, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ontouchend, in: jsObject] = newValue }
    }

    @inlinable var ontouchmove: EventHandler {
        get { ClosureAttribute1Optional[.ontouchmove, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ontouchmove, in: jsObject] = newValue }
    }

    @inlinable var ontouchcancel: EventHandler {
        get { ClosureAttribute1Optional[.ontouchcancel, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ontouchcancel, in: jsObject] = newValue }
    }
}



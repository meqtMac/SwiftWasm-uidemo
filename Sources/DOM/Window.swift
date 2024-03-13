//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/8/31.
//

import JavaScriptKit
import WebAPIBase
import JavaScriptEventLoop

public class Window: EventTarget,
                     GlobalEventHandlers,
                     WindowEventHandlers,
                     WindowOrWorkerGlobalScope,
                     AnimationFrameProvider,
                     WindowSessionStorage,
                     WindowLocalStorage {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Window].function }
    
    @inlinable public static var global: Window {
        Window(unsafelyWrapping: JSObject.global)
    }
    
    public var event: Event? {
        jsObject[.event].fromJSValue()
    }
    
    public var window: WindowProxy {
        jsObject[.window].fromJSValue()!
    }
    
    public var `self`: WindowProxy {
        jsObject[._self].fromJSValue()!
    }
    
    public var document: Document {
        jsObject[.document].fromJSValue()!
    }
    
    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }
    
    public var location: Location {
        jsObject[.location].fromJSValue()!
    }
    
    public var history: History {
        jsObject[.history].fromJSValue()!
    }
    
    public var navigation: Navigation {
        jsObject[.navigation].fromJSValue()!
    }
    
    public var customElements: CustomElementRegistry {
        jsObject[.customElements].fromJSValue()!
    }
    
    public var locationbar: BarProp {
        jsObject[.locationbar].fromJSValue()!
    }
    
    public var menubar: BarProp {
        jsObject[.menubar].fromJSValue()!
    }
    
    public var personalbar: BarProp {
        jsObject[.personalbar].fromJSValue()!
    }
    
    public var scrollbars: BarProp {
        jsObject[.scrollbars].fromJSValue()!
    }
    
    public var statusbar: BarProp {
        jsObject[.statusbar].fromJSValue()!
    }
    
    public var toolbar: BarProp {
        jsObject[.toolbar].fromJSValue()!
    }
    
    public var status: String {
        get { jsObject[.status].fromJSValue()!}
        set { jsObject[.status] = newValue.jsValue }
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    public var closed: Bool {
        jsObject[.closed].fromJSValue()!
    }
    
    @inlinable public func stop() {
        let this = jsObject
        _ = this[.stop].function!(this: this, arguments: [])
    }
    
    @inlinable public func focus() {
        let this = jsObject
        _ = this[.focus].function!(this: this, arguments: [])
    }
    
    @inlinable public func blur() {
        let this = jsObject
        _ = this[.blur].function!(this: this, arguments: [])
    }
    
    public var frames: WindowProxy {
        jsObject[.frames].fromJSValue()!
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    public var top: WindowProxy? {
        jsObject[.top].fromJSValue()
    }
    
    public var opener: JSValue {
        get { jsObject[.opener].fromJSValue()!}
        set { jsObject[.opener] = newValue.jsValue }
    }
    
    public var parent: WindowProxy? {
        jsObject[.parent].fromJSValue()
    }
    
    public var frameElement: Element? {
        jsObject[.frameElement].fromJSValue()
    }
    
    @inlinable public func open(url: String? = nil, target: String? = nil, features: String? = nil) -> WindowProxy? {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(url), _toJSValue(target), _toJSValue(features)]).fromJSValue()
    }
    
    @inlinable public subscript(key: String) -> JSObject {
        jsObject[key].fromJSValue()!
    }
    
    public var navigator: Navigator {
        jsObject[.navigator].fromJSValue()!
    }
    
    public var clientInformation: Navigator {
        jsObject[.clientInformation].fromJSValue()!
    }
    
    public var originAgentCluster: Bool {
        jsObject[.originAgentCluster].fromJSValue()!
    }
    
    @inlinable public func alert() {
        let this = jsObject
        _ = this[.alert].function!(this: this, arguments: [])
    }
    
    @inlinable public func alert(message: String) {
        let this = jsObject
        _ = this[.alert].function!(this: this, arguments: [_toJSValue(message)])
    }
    
    @inlinable public func confirm(message: String? = nil) -> Bool {
        let this = jsObject
        return this[.confirm].function!(this: this, arguments: [_toJSValue(message)]).fromJSValue()!
    }
    
    @inlinable public func prompt(message: String? = nil, default: String? = nil) -> String? {
        let this = jsObject
        return this[.prompt].function!(this: this, arguments: [_toJSValue(message), _toJSValue(`default`)]).fromJSValue()
    }
    
    @inlinable public func print() {
        let this = jsObject
        _ = this[.print].function!(this: this, arguments: [])
    }
    
    @inlinable public func postMessage(message: JSValue, targetOrigin: String, transfer: [JSObject]? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(targetOrigin), _toJSValue(transfer)])
    }
    
    @inlinable public func postMessage(message: JSValue, options: WindowPostMessageOptions? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(options)])
    }
    
    @inlinable public func captureEvents() {
        let this = jsObject
        _ = this[.captureEvents].function!(this: this, arguments: [])
    }
    
    @inlinable public func releaseEvents() {
        let this = jsObject
        _ = this[.releaseEvents].function!(this: this, arguments: [])
    }
    
    public var external: External {
        jsObject[.external].fromJSValue()!
    }
    
    @inlinable public func matchMedia(query: String) -> MediaQueryList {
        let this = jsObject
        return this[.matchMedia].function!(this: this, arguments: [_toJSValue(query)]).fromJSValue()!
    }
    
    public var screen: Screen {
        jsObject[.screen].fromJSValue()!
    }
    
    public var visualViewport: VisualViewport? {
        jsObject[.visualViewport].fromJSValue()
    }
    
    @inlinable public func moveTo(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.moveTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable public func moveBy(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.moveBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable public func resizeTo(width: Int32, height: Int32) {
        let this = jsObject
        _ = this[.resizeTo].function!(this: this, arguments: [_toJSValue(width), _toJSValue(height)])
    }
    
    @inlinable public func resizeBy(x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.resizeBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }
    
    public var innerWidth: Int32 {
        jsObject[.innerWidth].fromJSValue()!
    }
    
    public var innerHeight: Int32 {
        jsObject[.innerHeight].fromJSValue()!
    }
    
    public var scrollX: Double {
        jsObject[.scrollX].fromJSValue()!
    }
    
    public var pageXOffset: Double {
        jsObject[.pageXOffset].fromJSValue()!
    }
    
    public var scrollY: Double {
        jsObject[.scrollY].fromJSValue()!
    }
    
    public var pageYOffset: Double {
        jsObject[.pageYOffset].fromJSValue()!
    }
    
    @inlinable public func scroll(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [_toJSValue(options)])
    }
    
    @inlinable public func scroll(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable public func scrollTo(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scrollTo].function!(this: this, arguments: [_toJSValue(options)])
    }
    
    @inlinable public func scrollTo(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scrollTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable public func scrollBy(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scrollBy].function!(this: this, arguments: [_toJSValue(options)])
    }
    
    @inlinable public func scrollBy(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scrollBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }
    
    public var screenX: Int32 {
        jsObject[.screenX].fromJSValue()!
    }
    
    public var screenLeft: Int32 {
        jsObject[.screenLeft].fromJSValue()!
    }
    
    public var screenY: Int32 {
        jsObject[.screenY].fromJSValue()!
    }
    
    public var screenTop: Int32 {
        jsObject[.screenTop].fromJSValue()!
    }
    
    public var outerWidth: Int32 {
        jsObject[.outerWidth].fromJSValue()!
    }
    
    public var outerHeight: Int32 {
        jsObject[.outerHeight].fromJSValue()!
    }
    
    public var devicePixelRatio: Double {
        jsObject[.devicePixelRatio].fromJSValue()!
    }
}

public protocol WindowEventHandlers: JSBridgedClass {}
public extension WindowEventHandlers {
    @inlinable var onafterprint: EventHandler {
        get { ClosureAttribute1Optional[.onafterprint, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onafterprint, in: jsObject] = newValue }
    }
    
    @inlinable var onbeforeprint: EventHandler {
        get { ClosureAttribute1Optional[.onbeforeprint, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforeprint, in: jsObject] = newValue }
    }
    
    @inlinable var onbeforeunload: OnBeforeUnloadEventHandler {
        get { ClosureAttribute1Optional[.onbeforeunload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onbeforeunload, in: jsObject] = newValue }
    }
    
    @inlinable var onhashchange: EventHandler {
        get { ClosureAttribute1Optional[.onhashchange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onhashchange, in: jsObject] = newValue }
    }
    
    @inlinable var onlanguagechange: EventHandler {
        get { ClosureAttribute1Optional[.onlanguagechange, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onlanguagechange, in: jsObject] = newValue }
    }
    
    @inlinable var onmessage: EventHandler {
        get { ClosureAttribute1Optional[.onmessage, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmessage, in: jsObject] = newValue }
    }
    
    @inlinable var onmessageerror: EventHandler {
        get { ClosureAttribute1Optional[.onmessageerror, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onmessageerror, in: jsObject] = newValue }
    }
    
    @inlinable var onoffline: EventHandler {
        get { ClosureAttribute1Optional[.onoffline, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onoffline, in: jsObject] = newValue }
    }
    
    @inlinable var ononline: EventHandler {
        get { ClosureAttribute1Optional[.ononline, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.ononline, in: jsObject] = newValue }
    }
    
    @inlinable var onpagehide: EventHandler {
        get { ClosureAttribute1Optional[.onpagehide, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpagehide, in: jsObject] = newValue }
    }
    
    @inlinable var onpageshow: EventHandler {
        get { ClosureAttribute1Optional[.onpageshow, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpageshow, in: jsObject] = newValue }
    }
    
    @inlinable var onpopstate: EventHandler {
        get { ClosureAttribute1Optional[.onpopstate, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onpopstate, in: jsObject] = newValue }
    }
    
    @inlinable var onrejectionhandled: EventHandler {
        get { ClosureAttribute1Optional[.onrejectionhandled, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onrejectionhandled, in: jsObject] = newValue }
    }
    
    @inlinable var onstorage: EventHandler {
        get { ClosureAttribute1Optional[.onstorage, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onstorage, in: jsObject] = newValue }
    }
    
    @inlinable var onunhandledrejection: EventHandler {
        get { ClosureAttribute1Optional[.onunhandledrejection, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onunhandledrejection, in: jsObject] = newValue }
    }
    
    @inlinable var onunload: EventHandler {
        get { ClosureAttribute1Optional[.onunload, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onunload, in: jsObject] = newValue }
    }
}

public protocol WindowLocalStorage: JSBridgedClass {}
public extension WindowLocalStorage {
    @inlinable var localStorage: Storage { jsObject[.localStorage].fromJSValue()! }
}

public protocol WindowOrWorkerGlobalScope: JSBridgedClass {}
public extension WindowOrWorkerGlobalScope {
    @inlinable var origin: String { jsObject[.origin].fromJSValue()! }
    
    @inlinable var isSecureContext: Bool { jsObject[.isSecureContext].fromJSValue()! }
    
    @inlinable var crossOriginIsolated: Bool { jsObject[.crossOriginIsolated].fromJSValue()! }
    
    @inlinable func reportError(e: JSValue) {
        let this = jsObject
        _ = this[.reportError].function!(this: this, arguments: [_toJSValue(e)])
    }
    
    @inlinable func btoa(data: String) -> String {
        let this = jsObject
        return this[.btoa].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }
    
    @inlinable func atob(data: String) -> String {
        let this = jsObject
        return this[.atob].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }
    
    //public typealias TimerHandler = JSFunction
    @inlinable func setTimeout(handler: JSFunction, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[.setTimeout].function!(this: this, arguments: [_toJSValue(handler), _toJSValue(timeout)] + arguments.map(_toJSValue)).fromJSValue()!
    }
    
    @inlinable func clearTimeout(id: Int32? = nil) {
        let this = jsObject
        _ = this[.clearTimeout].function!(this: this, arguments: [_toJSValue(id)])
    }
    
    @inlinable
    func setInterval(handler: JSFunction, timeout: Int32? = nil, arguments: JSValue...) -> Int32 {
        let this = jsObject
        return this[.setInterval].function!(this: this, arguments: [_toJSValue(handler), _toJSValue(timeout)] + arguments.map(_toJSValue)).fromJSValue()!
    }
    
    @inlinable
    func clearInterval(id: Int32? = nil) {
        let this = jsObject
        _ = this[.clearInterval].function!(this: this, arguments: [_toJSValue(id)])
    }
    
    @inlinable func queueMicrotask(callback: @escaping VoidFunction) {
        let this = jsObject
        _ = this[.queueMicrotask].function!(this: this, arguments: [_toJSValue(callback)])
    }
    
    //    extension Blob: Any_ImageBitmapSource {}
    //    extension ImageData: Any_ImageBitmapSource {}
    //    extension HTMLCanvasElement: Any_ImageBitmapSource {}
    //    extension HTMLOrSVGImageElement: Any_ImageBitmapSource {}
    //    extension HTMLVideoElement: Any_ImageBitmapSource {}
    //    extension ImageBitmap: Any_ImageBitmapSource {}
    //    extension OffscreenCanvas: Any_ImageBitmapSource {}
    //    extension VideoFrame: Any_ImageBitmapSource {}
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: Blob, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageData, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLCanvasElement, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLOrSVGImageElement, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLVideoElement, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmap, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: OffscreenCanvas, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: VideoFrame, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: Blob, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageData, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLCanvasElement, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLOrSVGImageElement, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLVideoElement, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmap, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: OffscreenCanvas, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: VideoFrame, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
    }
    
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: Blob, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageData, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLCanvasElement, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLOrSVGImageElement, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: HTMLVideoElement, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: ImageBitmap, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: OffscreenCanvas, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func createImageBitmap(image: VideoFrame, sx: Int32, sy: Int32, sw: Int32, sh: Int32, options: ImageBitmapOptions? = nil) async throws -> ImageBitmap {
        let this = jsObject
        let _promise: JSPromise = this[.createImageBitmap].function!(this: this, arguments: [_toJSValue(image), _toJSValue(sx), _toJSValue(sy), _toJSValue(sw), _toJSValue(sh), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    
    @inlinable func structuredClone(value: JSValue, options: StructuredSerializeOptions? = nil) -> JSValue {
        let this = jsObject
        return this[.structuredClone].function!(this: this, arguments: [_toJSValue(value), _toJSValue(options)]).fromJSValue()!
    }
    
    @inlinable var performance: Performance { jsObject[.performance].fromJSValue()! }
    
    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) -> JSPromise {
        let this = jsObject
        return this[.fetch].function!(this: this, arguments: [_toJSValue(input), _toJSValue(`init`)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func fetch(input: RequestInfo, init: RequestInit? = nil) async throws -> Response {
        let this = jsObject
        let _promise: JSPromise = this[.fetch].function!(this: this, arguments: [_toJSValue(input), _toJSValue(`init`)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable var caches: CacheStorage { jsObject[.caches].fromJSValue()! }
}

public class WindowPostMessageOptions: BridgedDictionary {
    public convenience init(targetOrigin: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.targetOrigin] = _toJSValue(targetOrigin)
        self.init(unsafelyWrapping: object)
    }
    
    public var targetOrigin: String {
        get { jsObject[.targetOrigin].fromJSValue()!}
        set { jsObject[.targetOrigin] = newValue.jsValue }
    }
}

public protocol WindowSessionStorage: JSBridgedClass {}
public extension WindowSessionStorage {
    @inlinable var sessionStorage: Storage { jsObject[.sessionStorage].fromJSValue()! }
}


extension Window {
    public class CustomElementRegistry: JSBridgedClass {
        @inlinable public class var constructor: JSFunction? { JSObject.global[.CustomElementRegistry].function }
        
        public let jsObject: JSObject
        
        public required init(unsafelyWrapping jsObject: JSObject) {
            self.jsObject = jsObject
        }
        
        @inlinable public func define(name: String, constructor: CustomElementConstructor, options: ElementDefinitionOptions? = nil) {
            let this = jsObject
            _ = this[.define].function!(this: this, arguments: [_toJSValue(name), _toJSValue(constructor), _toJSValue(options)])
        }
        
        @inlinable public func get(name: String) -> CustomElementConstructor? {
            let this = jsObject
            return this[.get].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()!
        }
        
        @inlinable public func getName(constructor: CustomElementConstructor) -> String? {
            let this = jsObject
            return this[.getName].function!(this: this, arguments: [_toJSValue(constructor)]).fromJSValue()
        }
        
        @inlinable public func whenDefined(name: String) -> JSPromise {
            let this = jsObject
            return this[.whenDefined].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()!
        }
        
        @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
        @inlinable public func whenDefined(name: String) async throws -> CustomElementConstructor {
            let this = jsObject
            let _promise: JSPromise = this[.whenDefined].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()!
            return try await _promise.value.fromJSValue()!
        }
        
        @inlinable public func upgrade(root: Node) {
            let this = jsObject
            _ = this[.upgrade].function!(this: this, arguments: [_toJSValue(root)])
        }
    }
}

extension Window.CustomElementRegistry {
    public class ElementDefinitionOptions: BridgedDictionary {
        public convenience init(extends: String) {
            let object = JSObject.global[.Object].function!.new()
            object[.extends] = _toJSValue(extends)
            self.init(unsafelyWrapping: object)
        }
        
        public var extends: String {
            get { jsObject[.extends].fromJSValue()! }
            set { jsObject[.extends] = newValue.jsValue }
        }
    }
}

public class VisualViewport: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VisualViewport].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onresize = ClosureAttribute1Optional(jsObject: jsObject, name: .onresize)
        _onscroll = ClosureAttribute1Optional(jsObject: jsObject, name: .onscroll)
        _onscrollend = ClosureAttribute1Optional(jsObject: jsObject, name: .onscrollend)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var offsetLeft: Double {
        jsObject[.offsetLeft].fromJSValue()!
    }
    
    public var offsetTop: Double {
        jsObject[.offsetTop].fromJSValue()!
    }
    
    public var pageLeft: Double {
        jsObject[.pageLeft].fromJSValue()!
    }
    
    public var pageTop: Double {
        jsObject[.pageTop].fromJSValue()!
    }
    
    public var width: Double {
        jsObject[.width].fromJSValue()!
    }
    
    public var height: Double {
        jsObject[.height].fromJSValue()!
    }
    
    public var scale: Double {
        jsObject[.scale].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onresize: EventHandler
    
    @ClosureAttribute1Optional
    public var onscroll: EventHandler
    
    @ClosureAttribute1Optional
    public var onscrollend: EventHandler
}

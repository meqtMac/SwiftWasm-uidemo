//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase

public typealias OnErrorEventHandler = OnErrorEventHandlerNonNull?
public typealias OnBeforeUnloadEventHandler = OnBeforeUnloadEventHandlerNonNull?

public typealias DOMHighResTimeStamp = Double
public typealias EpochTimeStamp = UInt64

public typealias PerformanceEntryList = [PerformanceEntry]
public typealias MutationCallback = ([MutationRecord], MutationObserver) -> Void
public typealias BlobCallback = (Blob?) -> Void
public typealias FunctionStringCallback = (String) -> Void
public typealias NavigationInterceptHandler = () -> JSPromise
public typealias OnErrorEventHandlerNonNull = (Event_or_String, String, UInt32, UInt32, JSValue) -> JSValue
public typealias OnBeforeUnloadEventHandlerNonNull = (Event) -> String?
public typealias FrameRequestCallback = (DOMHighResTimeStamp) -> Void
public typealias UnderlyingSourceStartCallback = (ReadableStreamController) -> JSValue
public typealias UnderlyingSourcePullCallback = (ReadableStreamController) -> JSPromise
public typealias UnderlyingSourceCancelCallback = (JSValue) -> JSPromise
public typealias UnderlyingSinkStartCallback = (WritableStreamDefaultController) -> JSValue
public typealias UnderlyingSinkWriteCallback = (JSValue, WritableStreamDefaultController) -> JSPromise
public typealias UnderlyingSinkCloseCallback = () -> JSPromise
public typealias UnderlyingSinkAbortCallback = (JSValue) -> JSPromise
public typealias TransformerStartCallback = (TransformStreamDefaultController) -> JSValue
public typealias TransformerFlushCallback = (TransformStreamDefaultController) -> JSPromise
public typealias TransformerTransformCallback = (JSValue, TransformStreamDefaultController) -> JSPromise
public typealias QueuingStrategySize = (JSValue) -> Double
public typealias NavigatorUserMediaSuccessCallback = (MediaStream) -> Void
public typealias NavigatorUserMediaErrorCallback = (DOMException) -> Void
public typealias VideoFrameOutputCallback = (VideoFrame) -> Void
public typealias WebCodecsErrorCallback = (DOMException) -> Void
public typealias PerformanceObserverCallback = (PerformanceObserverEntryList, PerformanceObserver, PerformanceObserverCallbackOptions) -> Void


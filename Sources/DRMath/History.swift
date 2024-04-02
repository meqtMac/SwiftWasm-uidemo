//
//  History.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

// MARK: Checked

/// This struct tracks recent values of some time series.
///
/// It can be used as a smoothing filter for e.g. latency, fps etc,
/// or to show a log or graph of recent events.
///
/// It has a minimum and maximum length, as well as a maximum storage time.
/// * The minimum length is to ensure you have enough data for an estimate.
/// * The maximum length is to make sure the history doesn't take up too much space.
/// * The maximum age is to make sure the estimate isn't outdated.
///
/// Time difference between values can be zero, but never negative.
///
/// This can be used for things like smoothed averages (for e.g. FPS)
/// or for smoothed velocity (e.g. mouse pointer speed).
/// All times are in seconds.
public struct History<T> {
    /// In elements, i.e. of `values.count`.
    /// The length is initially zero, but once past `minLength` will not shrink below it.
    public let minLength: Int
    public let maxLength: Int
    public let maxAge: Float
    
    /// Total number of elements seen ever
    public private(set) var totalCount: UInt64 = 0
    
    /// (time, value) pairs, oldest front, newest back.
    /// Time difference between values can be zero, but never negative.
    @usableFromInline
    internal var values: [(time: Double, value: T)] = []
    
    /// Example:
    /// ```
    /// // Drop events that are older than one second,
    /// // as long we keep at least two events. Never keep more than a hundred events.
    /// let history = History<Int>(lengthRange: 2..<100, maxAge: 1.0)
    /// assert(history.average() == nil)
    /// history.add(now: 0.0, value: 40)
    /// history.add(now: 0.0, value: 44)
    /// assert(history.average() == 42.0)
    /// ```
    public init(lengthRange: Range<Int>, maxAge: Float) {
        self.minLength = lengthRange.lowerBound
        self.maxLength = lengthRange.upperBound
        self.maxAge = maxAge
    }
    
}
public extension History {
    @inlinable
    var isEmpty: Bool { values.isEmpty }
    
    /// Current number of values kept in history
    @inlinable
    func count() -> Int { values.count }
    
    
    func latest() -> T? {
        return values.last?.value
    }
    
    /// Amount of time contained from start to end in this [`History`].
    func duration() -> Float32 {
        if let first = values.first, let last = values.last {
            Float32(last.time - first.time)
        } else {
            0.0
        }
    }
    
    // iter
    // value
    // clear
    @inlinable
    mutating func clear() {
        self.values.removeAll()
    }
    
    /// Values must be added with a monotonically increasing time, or at least not decreasing.
    mutating func add(now: Double, value: T) {
        if let lastTime = values.last?.time {
            precondition(now >= lastTime, "Time shouldn't move backwards")
        }
        totalCount += 1
        values.append((time: now, value: value))
        flush(now: now)
    }
    
    /// Mean time difference between values in this [`History`].
    func meanTimeInterval() -> Float? {
        guard let first = values.first,
              let last = values.last, values.count >= 2 else { return nil }
        let n = values.count
        return Float((last.time - first.time) / Double(n - 1))
    }
    
    // Mean number of events per second.
    func rate() -> Float? {
        guard let timeInterval = meanTimeInterval() else { return nil }
        return 1.0 / timeInterval
    }
    
    /// Remove samples that are too old.
    mutating func flush(now: Double) {
        while values.count > maxLength {
            values.removeFirst()
        }
        while values.count > minLength {
            if let frontTime = values.first?.time, frontTime < now - Double(maxAge) {
                values.removeFirst()
            } else {
                break
            }
        }
    }
}

public extension History where T: FloatingPoint {
    @inlinable
    func sum() -> T {
        
        values.map {
            $0.value
        }.reduce(.zero) {
            $0 + $1
        }
    }
    
    func average() -> T? {
        let num = self.count()
        return if num > 0 {
            self.sum() / T(num)
        } else {
            nil
        }
    }
    
    /// Calculate a smooth velocity (per second) over the entire time span.
    /// Calculated as the last value minus the first value over the elapsed time between them.
    
    
}

public extension History where T == Float32 {
    
    /// Average times rate.
    /// If you are keeping track of individual sizes of things (e.g. bytes),
    /// this will estimate the bandwidth (bytes per second).
    func bandwidth() -> T? {
        guard let average_val = self.average(),
              let rate_val = self.rate() else {
            return nil
        }
        return average_val *  rate_val
    }
    
    func velocity() -> T? {
        if let first = values.first,
           let last = values.last {
            let dt = (last.0 - first.0);
            if dt > .zero {
                return (last.value - first.value) / Float(dt)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
}

public extension History where T == Float64 {
    func bandwidth() -> T? {
        guard let average_val = self.average(),
              let rate_val = self.rate() else {
            return nil
        }
        return average_val *  Double(rate_val)
    }
    func velocity() -> T? {
        if let first = values.first,
           let last = values.last {
            let dt = (last.0 - first.0);
            if dt > .zero {
                return (last.value - first.value) / dt
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

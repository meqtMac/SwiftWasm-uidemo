//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

@resultBuilder
public enum TableBodyBuilder {
    public typealias Element = Tr
    public typealias Component = [Element]
    
    static func buildBlock(_ components: Element...) -> Component {
        return components
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    public static func buildExpression(_ expression: Element) -> Component {
        return [expression]
    }
    public static func buildExpression(_ expression: Component) -> Component {
        return expression
    }
    
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    
    
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        if let component {
            return component
        } else {
            return []
        }
    }
}

@resultBuilder
public enum TableRowBuilder {
    public enum Element: HTMDSL {
        case td(Td)
        case th(Th)
        public var element: some HTMLElement {
            switch self {
            case let .td(td):
                return td.element
            case let .th(th):
                return th.element
            }
        }
    }
    
    public typealias Component = [Element]
    
    static func buildBlock(_ components: Element...) -> Component {
        return components
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    public static func buildExpression(_ expression: Td) -> Component {
        return [.td(expression)]
    }
    public static func buildExpression(_ expression: Th) -> Component {
        return [.th(expression)]
    }
    public static func buildExpression(_ expression: Component) -> Component {
        return expression
    }
    
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        if let component {
            return component
        } else {
            return []
        }
    }
    
}

@resultBuilder
public enum TableCellBuilder {
    public enum Element {
        case text(Text)
        case elment(HTMLElement)
    }
    public typealias Component = [Element]
    
    static func buildBlock(_ components: Element...) -> Component {
        return components
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    public static func buildExpression(_ expression: String) -> Component {
        return [.text(document.createTextNode(data: expression))]
    }
    
    public static func buildExpression(_ expression: some HTMDSL) -> Component {
        return [.elment(expression.element)]
    }
    
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        if let component {
            return component
        } else {
            return []
        }
    }
    
}


@resultBuilder
public enum TableColGroupBuilder {
//    public enum Element {
//        case string(String)
//        case elment(HTMLElement)
//    }
    public typealias Element = Col
    public typealias Component = [Element]
    
    static func buildBlock(_ components: Element...) -> Component {
        return components
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    public static func buildExpression(_ expression: Element) -> Component {
        return [expression]
    }
    
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        if let component {
            return component
        } else {
            return []
        }
    }
    
}


@resultBuilder
enum HTMLBuilder {
    public typealias Component = [any HTMDSL]
    
    static func buildBlock(_ components: any HTMDSL...) -> Component {
        return components
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildExpression(_ expression: any HTMDSL) -> Component {
        return [expression]
    }
    
    public static func buildExpression(_ expression: [any HTMDSL]) -> Component {
        return expression
    }
    

    
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        if let component {
            return component
        } else {
            return []
        }
    }
}

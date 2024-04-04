//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public protocol ARIAMixin: JSBridgedClass {}
public extension ARIAMixin {
    @inlinable var role: String? {
        get { jsObject[.role].fromJSValue() }
        nonmutating set { jsObject[.role] = _toJSValue(newValue) }
    }

    @inlinable var ariaActiveDescendantElement: Element? {
        get { jsObject[.ariaActiveDescendantElement].fromJSValue() }
        nonmutating set { jsObject[.ariaActiveDescendantElement] = _toJSValue(newValue) }
    }

    @inlinable var ariaAtomic: String? {
        get { jsObject[.ariaAtomic].fromJSValue() }
        nonmutating set { jsObject[.ariaAtomic] = _toJSValue(newValue) }
    }

    @inlinable var ariaAutoComplete: String? {
        get { jsObject[.ariaAutoComplete].fromJSValue() }
        nonmutating set { jsObject[.ariaAutoComplete] = _toJSValue(newValue) }
    }

    @inlinable var ariaBusy: String? {
        get { jsObject[.ariaBusy].fromJSValue() }
        nonmutating set { jsObject[.ariaBusy] = _toJSValue(newValue) }
    }

    @inlinable var ariaChecked: String? {
        get { jsObject[.ariaChecked].fromJSValue() }
        nonmutating set { jsObject[.ariaChecked] = _toJSValue(newValue) }
    }

    @inlinable var ariaColCount: String? {
        get { jsObject[.ariaColCount].fromJSValue() }
        nonmutating set { jsObject[.ariaColCount] = _toJSValue(newValue) }
    }

    @inlinable var ariaColIndex: String? {
        get { jsObject[.ariaColIndex].fromJSValue() }
        nonmutating set { jsObject[.ariaColIndex] = _toJSValue(newValue) }
    }

    @inlinable var ariaColIndexText: String? {
        get { jsObject[.ariaColIndexText].fromJSValue() }
        nonmutating set { jsObject[.ariaColIndexText] = _toJSValue(newValue) }
    }

    @inlinable var ariaColSpan: String? {
        get { jsObject[.ariaColSpan].fromJSValue() }
        nonmutating set { jsObject[.ariaColSpan] = _toJSValue(newValue) }
    }

    @inlinable var ariaControlsElements: [Element]? {
        get { jsObject[.ariaControlsElements].fromJSValue() }
        nonmutating set { jsObject[.ariaControlsElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaCurrent: String? {
        get { jsObject[.ariaCurrent].fromJSValue() }
        nonmutating set { jsObject[.ariaCurrent] = _toJSValue(newValue) }
    }

    @inlinable var ariaDescribedByElements: [Element]? {
        get { jsObject[.ariaDescribedByElements].fromJSValue() }
        nonmutating set { jsObject[.ariaDescribedByElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaDescription: String? {
        get { jsObject[.ariaDescription].fromJSValue() }
        nonmutating set { jsObject[.ariaDescription] = _toJSValue(newValue) }
    }

    @inlinable var ariaDetailsElements: [Element]? {
        get { jsObject[.ariaDetailsElements].fromJSValue() }
        nonmutating set { jsObject[.ariaDetailsElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaDisabled: String? {
        get { jsObject[.ariaDisabled].fromJSValue() }
        nonmutating set { jsObject[.ariaDisabled] = _toJSValue(newValue) }
    }

    @inlinable var ariaErrorMessageElements: [Element]? {
        get { jsObject[.ariaErrorMessageElements].fromJSValue() }
        nonmutating set { jsObject[.ariaErrorMessageElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaExpanded: String? {
        get { jsObject[.ariaExpanded].fromJSValue() }
        nonmutating set { jsObject[.ariaExpanded] = _toJSValue(newValue) }
    }

    @inlinable var ariaFlowToElements: [Element]? {
        get { jsObject[.ariaFlowToElements].fromJSValue() }
        nonmutating set { jsObject[.ariaFlowToElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaHasPopup: String? {
        get { jsObject[.ariaHasPopup].fromJSValue() }
        nonmutating set { jsObject[.ariaHasPopup] = _toJSValue(newValue) }
    }

    @inlinable var ariaHidden: String? {
        get { jsObject[.ariaHidden].fromJSValue() }
        nonmutating set { jsObject[.ariaHidden] = _toJSValue(newValue) }
    }

    @inlinable var ariaInvalid: String? {
        get { jsObject[.ariaInvalid].fromJSValue() }
        nonmutating set { jsObject[.ariaInvalid] = _toJSValue(newValue) }
    }

    @inlinable var ariaKeyShortcuts: String? {
        get { jsObject[.ariaKeyShortcuts].fromJSValue() }
        nonmutating set { jsObject[.ariaKeyShortcuts] = _toJSValue(newValue) }
    }

    @inlinable var ariaLabel: String? {
        get { jsObject[.ariaLabel].fromJSValue() }
        nonmutating set { jsObject[.ariaLabel] = _toJSValue(newValue) }
    }

    @inlinable var ariaLabelledByElements: [Element]? {
        get { jsObject[.ariaLabelledByElements].fromJSValue() }
        nonmutating set { jsObject[.ariaLabelledByElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaLevel: String? {
        get { jsObject[.ariaLevel].fromJSValue() }
        nonmutating set { jsObject[.ariaLevel] = _toJSValue(newValue) }
    }

    @inlinable var ariaLive: String? {
        get { jsObject[.ariaLive].fromJSValue() }
        nonmutating set { jsObject[.ariaLive] = _toJSValue(newValue) }
    }

    @inlinable var ariaModal: String? {
        get { jsObject[.ariaModal].fromJSValue() }
        nonmutating set { jsObject[.ariaModal] = _toJSValue(newValue) }
    }

    @inlinable var ariaMultiLine: String? {
        get { jsObject[.ariaMultiLine].fromJSValue() }
        nonmutating set { jsObject[.ariaMultiLine] = _toJSValue(newValue) }
    }

    @inlinable var ariaMultiSelectable: String? {
        get { jsObject[.ariaMultiSelectable].fromJSValue() }
        nonmutating set { jsObject[.ariaMultiSelectable] = _toJSValue(newValue) }
    }

    @inlinable var ariaOrientation: String? {
        get { jsObject[.ariaOrientation].fromJSValue() }
        nonmutating set { jsObject[.ariaOrientation] = _toJSValue(newValue) }
    }

    @inlinable var ariaOwnsElements: [Element]? {
        get { jsObject[.ariaOwnsElements].fromJSValue() }
        nonmutating set { jsObject[.ariaOwnsElements] = _toJSValue(newValue) }
    }

    @inlinable var ariaPlaceholder: String? {
        get { jsObject[.ariaPlaceholder].fromJSValue() }
        nonmutating set { jsObject[.ariaPlaceholder] = _toJSValue(newValue) }
    }

    @inlinable var ariaPosInSet: String? {
        get { jsObject[.ariaPosInSet].fromJSValue() }
        nonmutating set { jsObject[.ariaPosInSet] = _toJSValue(newValue) }
    }

    @inlinable var ariaPressed: String? {
        get { jsObject[.ariaPressed].fromJSValue() }
        nonmutating set { jsObject[.ariaPressed] = _toJSValue(newValue) }
    }

    @inlinable var ariaReadOnly: String? {
        get { jsObject[.ariaReadOnly].fromJSValue() }
        nonmutating set { jsObject[.ariaReadOnly] = _toJSValue(newValue) }
    }

    @inlinable var ariaRequired: String? {
        get { jsObject[.ariaRequired].fromJSValue() }
        nonmutating set { jsObject[.ariaRequired] = _toJSValue(newValue) }
    }

    @inlinable var ariaRoleDescription: String? {
        get { jsObject[.ariaRoleDescription].fromJSValue() }
        nonmutating set { jsObject[.ariaRoleDescription] = _toJSValue(newValue) }
    }

    @inlinable var ariaRowCount: String? {
        get { jsObject[.ariaRowCount].fromJSValue() }
        nonmutating set { jsObject[.ariaRowCount] = _toJSValue(newValue) }
    }

    @inlinable var ariaRowIndex: String? {
        get { jsObject[.ariaRowIndex].fromJSValue() }
        nonmutating set { jsObject[.ariaRowIndex] = _toJSValue(newValue) }
    }

    @inlinable var ariaRowIndexText: String? {
        get { jsObject[.ariaRowIndexText].fromJSValue() }
        nonmutating set { jsObject[.ariaRowIndexText] = _toJSValue(newValue) }
    }

    @inlinable var ariaRowSpan: String? {
        get { jsObject[.ariaRowSpan].fromJSValue() }
        nonmutating set { jsObject[.ariaRowSpan] = _toJSValue(newValue) }
    }

    @inlinable var ariaSelected: String? {
        get { jsObject[.ariaSelected].fromJSValue() }
        nonmutating set { jsObject[.ariaSelected] = _toJSValue(newValue) }
    }

    @inlinable var ariaSetSize: String? {
        get { jsObject[.ariaSetSize].fromJSValue() }
        nonmutating set { jsObject[.ariaSetSize] = _toJSValue(newValue) }
    }

    @inlinable var ariaSort: String? {
        get { jsObject[.ariaSort].fromJSValue() }
        nonmutating set { jsObject[.ariaSort] = _toJSValue(newValue) }
    }

    @inlinable var ariaValueMax: String? {
        get { jsObject[.ariaValueMax].fromJSValue() }
        nonmutating set { jsObject[.ariaValueMax] = _toJSValue(newValue) }
    }

    @inlinable var ariaValueMin: String? {
        get { jsObject[.ariaValueMin].fromJSValue() }
        nonmutating set { jsObject[.ariaValueMin] = _toJSValue(newValue) }
    }

    @inlinable var ariaValueNow: String? {
        get { jsObject[.ariaValueNow].fromJSValue() }
        nonmutating set { jsObject[.ariaValueNow] = _toJSValue(newValue) }
    }

    @inlinable var ariaValueText: String? {
        get { jsObject[.ariaValueText].fromJSValue() }
        nonmutating set { jsObject[.ariaValueText] = _toJSValue(newValue) }
    }
}


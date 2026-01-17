import CSSDefinitions
import Elementary

/// Creates a block-level element (defaults to `div`).
/// - Parameters:
///   - styles: Styles to apply.
///   - tag: The HTML tag to use.
///   - content: The element's content.
@inlinable
public func Block<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.div.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryFlowBlockClass) {
        content()
    }
}

/// Creates an inline element (defaults to `span`).
/// - Parameters:
///   - styles: Styles to apply.
///   - tag: The HTML tag to use.
///   - content: The element's content.
@inlinable
public func Inline<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.span.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryFlowInlineClass) {
        content()
    }
}

/// Creates a paragraph element (defaults to `p`).
/// - Parameters:
///   - styles: Styles to apply.
///   - tag: The HTML tag to use.
///   - content: The element's content.
@inlinable
public func Paragraph<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.p.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryFlowBlockClass) {
        content()
    }
}

/// Creates a heading element (defaults to `h1`).
/// - Parameters:
///   - styles: Styles to apply.
///   - tag: The HTML tag to use (e.g., `HTMLTag.h2`).
///   - content: The element's content.
@inlinable
public func Heading<Tag: HTMLTagDefinition, Wrapped: HTML>(
    _ styles: ElementaryStyle...,
    tag: Tag.Type = HTMLTag.h1.self,
    @HTMLBuilder content: () -> Wrapped
) -> HTMLElement<Tag, Wrapped> where Tag: HTMLTrait.Paired {
    Tag.makeStyledElement(styles, elementClass: ElementaryFlowBlockClass) {
        content()
    }
}

import Elementary
import ElementaryCSS

struct DemoPage: HTML {

    var body: some HTML {
        let cards = [
            (title: "Card 1", description: "This is the first card."),
            (title: "Card 2", description: "This is the second card."),
            (title: "Card 3", description: "This is the third card."),
        ]

        Block(.maxWidth(800), .margin(x: .auto), .fontFamily(.monospace)) {
            Heading(
                .fontSize(24),
                .fontWeight(.bold),
                .color(.secondary),
                .padding(y: 16)
            ) {
                "DEMO PAGE"
            }

            FlexColumn(gap: 12) {
                for card in cards {
                    Card(title: card.title, description: card.description)
                }
            }
        }
    }
}

struct Card: HTML {
    var title: String
    var description: String

    var body: some HTML {
        Block(
            .background(.background),
            .borderWidth(.px(3)),
            .borderRadius(5),
            .padding(16)
        ) {
            Paragraph(.fontSize(.em(1.5)), .fontWeight(.bold), .color(.primary)) {
                title
            }
            Paragraph(.fontSize(.em(1.2)), .color(.secondary)) {
                description
            }
        }.style(
            when: .hover,
            .background(.hoverBackground),
            .borderColor(.accent)
        )
    }
}

extension CSSColor {
    static var primary: CSSColor { "#C2410C" }
    static var secondary: CSSColor { "#854D0E" }
    static var accent: CSSColor { "#EA580C" }
    static var background: CSSColor { "#FFF7ED" }
    static var hoverBackground: CSSColor { "#FFEDD5" }
}

import QtQuick 2.4

TextInput {
    id: resizable
    FontMetrics {
        id: textFontMetrics
        font.family: resizable.font.family
    }
    property double heightFactor: height / textFontMetrics.height
    property double widthFactor: width / textFontMetrics.boundingRect(text).width
    property double advanceWidthFactor: width / textFontMetrics.advanceWidth(text)
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.pointSize: textFontMetrics.font.pointSize * ((widthFactor > 0 && advanceWidthFactor > 0) ? Math.min(heightFactor, widthFactor, advanceWidthFactor) : heightFactor)
}

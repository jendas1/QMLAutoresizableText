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
    property double smallestFactor: Math.min(heightFactor, widthFactor, advanceWidthFactor)

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter

    // if factorized pointSize is non-posive than something not all the variables are initialized yet, set also default point size to get rid of warnings
    font.pointSize: textFontMetrics.font.pointSize * (smallestFactor > 0 ? smallestFactor : (heightFactor > 0 ? heightFactor : 1))
}

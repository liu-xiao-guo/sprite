import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "sprite.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        id: page
        title: i18n.tr("sprite")

        Column {
            anchors.fill: parent

            FishSprite {
                height: units.gu(30)
                width: units.gu(30)
            }

            BearSprite {
                id: bear
                height: units.gu(30)
                width: units.gu(30)

                NumberAnimation on x {
                    to: page.width
                    duration: 8*800

                    onRunningChanged: {
                        if ( running == false) {
                            bear.x = 0
                            start()
                        }
                    }
                }
            }
        }
    }
}


import QtQuick 2.0
import QtMultimedia 5.0

Item {
    width: 64
    height: 64
    property real hp: 3

    SoundEffect {
        id: spawnSound
        source: "./audio/catch.wav"
        loops:SoundEffect.Infinite
    }

    SoundEffect {
        id: killedSound
        source: "./audio/catch-action.wav"
    }

    SpriteSequence {
        id: fishSprite
        anchors.fill: parent
        interpolate: false
        goalSprite: ""

        Sprite {
            name: "left"
            source: "./gfx/mob-idle.png"
            frameWidth: 64
            frameHeight: 64
            frameCount: 1
            frameDuration: 800
            frameDurationVariation: 400
            to: { "front" : 1 }
        }

        Sprite {
            name: "front"
            source: "./gfx/mob-idle.png"
            frameCount: 1
            frameX: 64
            frameWidth: 64
            frameHeight: 64
            frameDuration: 800
            frameDurationVariation: 400
            to: { "left" : 1, "right" : 1 }
        }

        Sprite {
            name: "right"
            source: "./gfx/mob-idle.png"
            frameCount: 1
            frameX: 128
            frameWidth: 64
            frameHeight: 64
            frameDuration: 800
            frameDurationVariation: 400
            to: { "front" : 1 }
        }


        Sprite { //WORKAROUND: This prevents the triggering of a rendering error which is currently under investigation.
            name: "dummy"
            source: "./gfx/melee-idle.png"
            frameCount: 8
            frameWidth: 64
            frameHeight: 64
            frameX: 0
            frameDuration: 200
        }

        NumberAnimation on x {
            id: fishSwim
            running: false
            property bool goingLeft: fishSprite.currentSprite == "right"
            to: goingLeft ? -360 : 360
            duration: 300
        }

        Component.onCompleted: {
            spawnSound.play()
        }
    }

    SpriteSequence {
        id: bubble
        width: 64
        height: 64
        scale: 0.4 + (0.2  * hp)
        interpolate: false
        goalSprite: ""

        Behavior on scale {
            NumberAnimation { duration: 150; easing.type: Easing.OutBack }
        }

        Sprite {
            name: "big"
            source: "./gfx/catch.png"
            frameCount: 1
            to: { "burst" : 0 }
        }

        Sprite {
            name: "burst"
            source: "./gfx/catch-action.png"
            frameCount: 3
            frameX: 64
            frameDuration: 200
        }

        Sprite { //WORKAROUND: This prevents the triggering of a rendering error which is currently under investigation.
            name: "dummy"
            source: "./gfx/melee-idle.png"
            frameCount: 8
            frameWidth: 64
            frameHeight: 64
            frameX: 0
            frameDuration: 200
        }
        SequentialAnimation on width {
            loops: Animation.Infinite
            NumberAnimation { from: width * 1; to: width * 1.1; duration: 800; easing.type: Easing.InOutQuad }
            NumberAnimation { from: width * 1.1; to: width * 1; duration: 1000; easing.type: Easing.InOutQuad }
        }
        SequentialAnimation on height {
            loops: Animation.Infinite
            NumberAnimation { from: height * 1; to: height * 1.15; duration: 1200; easing.type: Easing.InOutQuad }
            NumberAnimation { from: height * 1.15; to: height * 1; duration: 1000; easing.type: Easing.InOutQuad }
        }
    }
}

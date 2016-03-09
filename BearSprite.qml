import QtQuick 2.0

Item  {
    width: 256
    height: 256

    SpriteSequence {
        id: fishSprite
        anchors.fill: parent
        interpolate: false
        goalSprite: ""

        Sprite {
            name: "first"
            source: "./gfx/Bear2.png"
            frameWidth: 256
            frameHeight: 256
            frameCount: 1
            frameDuration: 800
            frameDurationVariation: 400
            to: { "second" : 1 }
        }

        Sprite {
            name: "second"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "third" : 1 }
        }

        Sprite {
            name: "third"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256*2
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "fourth" : 1 }
        }

        Sprite {
            name: "fourth"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256*3
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "fifth" : 1 }
        }

        Sprite {
            name: "fifth"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256*4
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "sixth" : 1 }
        }

        Sprite {
            name: "sixth"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256*5
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "seventh" : 1 }
        }

        Sprite {
            name: "seventh"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256*6
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "eighth" : 1 }
        }

        Sprite {
            name: "eighth"
            source: "./gfx/Bear2.png"
            frameCount: 1
            frameX: 256*7
            frameWidth: 256
            frameHeight: 256
            frameDuration: 800
            frameDurationVariation: 400
            to: { "first" : 1 }
        }

        Sprite { //WORKAROUND: This prevents the triggering of a rendering error which is currently under investigation.
            name: "dummy"
            source: "./gfx/Bear2.png"
            frameCount: 8
            frameWidth: 256
            frameHeight: 256
            frameX: 0
            frameDuration: 200
        }
    }

}

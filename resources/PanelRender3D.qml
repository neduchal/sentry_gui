import QtQuick 2.5 as QQ2
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import ros.mapentity 1.0

Entity{
    id: sceneRoot

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 60
        aspectRatio: 16/9
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d( 0.0, 50.0, 0.0 )
        upVector: Qt.vector3d( 1.0, 0.0, 0.0 )
        viewCenter: Qt.vector3d( -0.0, -0.0, -0.0 )
    }

    OrbitCameraController {
        camera: camera
    }

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                clearColor: Qt.rgba(0, 0.5, 1, 1)
                camera: camera
            }
        },
        // Event Source will be set by the Qt3DQuickWindow
        InputSettings { }
    ]

   ROSMapEntity{
       id: mapEntity
       objectName: "mapEntity"
   }

}

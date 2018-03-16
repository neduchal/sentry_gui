#ifndef ROSMAPENTITY_HPP
#define ROSMAPENTITY_HPP


#include <Qt3DCore>
#include <Qt3DRender>
#include <Qt3DInput>
#include <Qt3DLogic>
#include <Qt3DExtras>
#include <Qt3DAnimation>

class ROSMapEntity : public Qt3DCore::QEntity {
    public:
        ROSMapEntity( Qt3DCore::QEntity* parent=0 ) : Qt3DCore::QEntity(parent) {
          Qt3DRender::QMaterial *material = new Qt3DExtras::QPhongMaterial;

          Qt3DExtras::QPlaneMesh *planeMesh = new Qt3DExtras::QPlaneMesh;
          planeMesh->setWidth(50);
          planeMesh->setHeight(50);

          addComponent(planeMesh);
          addComponent(material);
        }
        virtual ~ROSMapEntity() {}
};


#endif // MAPSCENE_HPP

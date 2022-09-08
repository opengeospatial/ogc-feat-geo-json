#!/bin/sh

# validation using https://www.npmjs.com/package/ajv-cli

ajv validate -d building.json -s "../schemas/feature.json" --spec=draft2019 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/link.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json"

ajv validate -d fence.json -s "../schemas/feature.json" --spec=draft2019 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/link.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json"

ajv validate -d pylon.json -s "../schemas/feature.json" --spec=draft2019 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/link.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json"

ajv validate -d toronto-city-hall.json -s "../schemas/feature.json" --spec=draft2019 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/link.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" 

ajv validate -d cologne-cathedral.json -s "../schemas/featurecollection.json" --spec=draft2019 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/link.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" 

ajv validate -d airports.json -s "../schemas/featurecollection.json" --spec=draft2019 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/link.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" 

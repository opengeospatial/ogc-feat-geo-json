#!/bin/sh

# validation using https://www.npmjs.com/package/ajv-cli

# resolved schemas

ajv validate -d building.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d fence.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d pylon.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d toronto-city-hall.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d cologne-cathedral.json -s "../schemas/featurecollection.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d airports.json -s "../schemas/featurecollection.min.json" --spec=draft2020 --validateFormats=false --strict=true 

# unresolved schemas

ajv validate -d building.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" 

ajv validate -d fence.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" 

ajv validate -d pylon.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" 

ajv validate -d toronto-city-hall.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" 

ajv validate -d cologne-cathedral.json -s "../schemas/featurecollection.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" 

ajv validate -d airports.json -s "../schemas/featurecollection.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/geometry-objects.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" 

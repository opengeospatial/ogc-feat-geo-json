#!/bin/sh

# validation using https://www.npmjs.com/package/ajv-cli

echo "Validate using resolved schemas"

ajv validate -d building.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d road-segment.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d fence.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d pylon.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d toronto-city-hall.json -s "../schemas/feature.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d cologne-cathedral.json -s "../schemas/featurecollection.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d airports.json -s "../schemas/featurecollection.min.json" --spec=draft2020 --validateFormats=false --strict=true 

echo "Validate using resolved jsonfg-object schema"

ajv validate -d building.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d road-segment.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d fence.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d pylon.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d toronto-city-hall.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d cologne-cathedral.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d airports.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

ajv validate -d circle-document.json -s "../schemas/jsonfg-object.min.json" --spec=draft2020 --validateFormats=false --strict=true 

echo "Validate using unresolved schemas"

ajv validate -d building.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d road-segment.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d fence.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d pylon.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d toronto-city-hall.json -s "../schemas/feature.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d cologne-cathedral.json -s "../schemas/featurecollection.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d airports.json -s "../schemas/featurecollection.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/geometry-object.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d arc.json -s "../schemas/geometry-object.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/featurecollection.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d circle.json -s "../schemas/geometry-object.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/featurecollection.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d compound-curve.json -s "../schemas/geometry-object.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/featurecollection.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d curve-polygon.json -s "../schemas/geometry-object.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/featurecollection.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d multi-curve.json -s "../schemas/geometry-object.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/featurecollection.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

ajv validate -d multi-surface.json -s "../schemas/geometry-object.json" --spec=draft2020 --validateFormats=false --strict=true -r "../schemas/feature.json" -r "../schemas/featuretype.json" -r "../schemas/featurecollection.json" -r "../schemas/geometry.json" -r "../schemas/featureschema.json" -r "../schemas/place.json" -r "../schemas/coordrefsys.json" -r "../schemas/time.json" -r "../schemas/conformsto.json" -r "../schemas/measures.json" 

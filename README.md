# OGC Features and Geometries JSON (JSON-FG)

This GitHub repository contains [OGC](https://www.ogc.org/)'s candidate standard for OGC Features and Geometries JSON.

OGC Features and Geometries JSON (JSON-FG) builds on the widely used [GeoJSON standard](https://geojson.org/) and extends it with minimal extensions to support additional concepts that are important for the wider geospatial community and the [OGC API standards](https://ogcapi.ogc.org/).

## Status

The current version is [0.2.2](https://docs.ogc.org/DRAFTS/21-045.html). 

This version will be the basis for the OGC Public Comment phase for 90 days, which is the final call for comments before the candidate standard will go through the process for approval as an OGC Standard after resolving the comments received during the OGC Public Comment period.

The editor's draft of the specification can be found at [docs.ogc.org/DRAFTS/21-045r1.html](https://docs.ogc.org/DRAFTS/21-045r1.html). A [PDF version](https://docs.ogc.org/DRAFTS/21-045r1.pdf) is available, too.

The Open Geospatial Consortium (OGC) invites organisations and developers that have a need for the extensions specified by this specification to implement and test the extensions. Please submit feedback [in this repository](https://github.com/opengeospatial/ogc-feat-geo-json/issues). Are these extensions useful for your use cases? Are they simple enough to implement?

There are a number of [open issues under discussion](https://github.com/opengeospatial/ogc-feat-geo-json/labels/waiting%20for%20input). 

Uptake in implementations and sufficient feedback from implementation experience are a prerequisite for this specification to eventually progress towards an OGC Standard.

## Overview

[GeoJSON](https://www.rfc-editor.org/rfc/rfc7946.html) is a very popular encoding for geospatial vector data. GeoJSON is widely supported, including in most deployments of APIs implementing the OGC API Features Standard. However, GeoJSON has intentional restrictions that prevent or limit its use in certain geospatial application contexts. For example, GeoJSON is restricted to WGS 84 coordinates, does not support volumetric geometries and has no concept of classifying features according to their type.

OGC Features and Geometries JSON (JSON-FG) is an OGC Candidate Standard for GeoJSON extensions that provide standard ways to support such requirements. The goal is to focus on capabilities that may require some geospatial expertise, but that are useful for many. Edge cases are considered out-of-scope of JSON-FG.

Since JSON-FG specifies extensions to GeoJSON that conform to the GeoJSON standard, valid JSON-FG features or feature collections are also valid GeoJSON features or feature collections.

The JSON-FG Standard specifies the following extensions to the GeoJSON format:

* The ability to use Coordinate Reference Systems (CRSs) other than WGS84 (OGC:CRS84);
* Allows the use of non-Euclidean metrics, in particular ellipsoidal metrics;
* Support for solids and prisms as geometry types;
* The ability to encode temporal characteristics of a feature; and
* The ability to declare the type and the schema of a feature.

Geographic features, their properties, and their spatial extents that can be represented as GeoJSON objects are encoded as GeoJSON. Additional information not supported by the GeoJSON standard is mainly encoded in additional members of the GeoJSON objects. The additional members use keys that do not conflict with existing GeoJSON keys. This was done so that existing and future GeoJSON clients can continue to successfully parse and understand GeoJSON encoded content. JSON-FG enabled clients will also be able to parse and understand the additional members.

JSON Schema is used to formally specify the JSON-FG syntax.

## Example use cases

The JSON-FG extensions to GeoJSON are intended to support requirements that professional users of geospatial feature data frequently have. Some examples:

- In many jurisdictions, coordinates are not stored in WGS 84 longitude/latitude, but using a Cartesian coordinate system and/or in a different geodetic datum (for example, [NAD-83](https://en.wikipedia.org/wiki/North_American_Datum#North_American_Datum_of_1983) in North America or [ETRS89](https://en.wikipedia.org/wiki/European_Terrestrial_Reference_System_1989) in Europe). Representing such feature data in GeoJSON would require converting the coordinates to WGS 84 longitude/latitude, which would introduce geometric errors depending on the accuracy of the conversion. Such errors may or may not be acceptable for the intended purpose. To avoid such errors, JSON-FG supports that geometries can be represented in the CRS that the user wants or has to use when processing the data.
  - For example, coordinate conversions are typically not acceptable in an application to edit features. Feature geometries need to be represented throughout the editing process in the CRS in which the data is stored.
- Feature geometries increasingly include volumetric geometries, for example, to represent the shape of buildings or airspaces. GeoJSON implements the geometries specified by the [OGC Simple Feature Access Standard](https://www.ogc.org/standard/sfa/), which does not support solids as geometries. To be able to represent solid geometries in feature data, JSON-FG adds support for solids as well as extruded GeoJSON geometries ([prisms](https://en.wikipedia.org/wiki/Prism_(geometry))).
- The GeoJSON "geometry" member enables GeoJSON clients to process the geometry of a feature without understanding the schema or the semantics of the feature. This, for example, enables clients to render any feature on a map or to select features based on their geometry. For feature data where time is important, a new member "time" is introduced and enables, for example, JSON-FG map clients to select or render features in a time interval using a time slider - without the need to understand the schema or the semantics of the features.
- It is a common practice to publish feature datasets organized by the type of the features, e.g., roads, railways, etc. This information is utilized by clients when processing the data. For example, when rendering the features in a map, the feature type will typically determine the portrayal rules that are used to display a feature. To support such workflows, JSON-FG adds a JSON member "featureType" that can be used to convey the feature type of each feature.
- It is also a common practice, and a characteristic of commonly used data formats for feature data, e.g., [Shapefile](https://en.wikipedia.org/wiki/Shapefile) or [GeoPackage](https://en.wikipedia.org/wiki/GeoPackage), to have a fixed set of attributes for each feature type. These are expressed in a schema describing the attributes. The knowledge about the attributes can help clients when processing the data. To support such clients, JSON-FG specifies the JSON member "featureSchema" to reference the schema of the features of a feature type. Following the [approach taken by the OGC API Features Standard](https://docs.ogc.org/DRAFTS/23-058.html), the schema is a logical schema expressed in JSON Schema.

## Implementations and Examples

This section provides links to existing implementations of JSON-FG and examples of using JSON-FG. For each entry, the following information is provided:

- Name: A name for the implementation or example.
- Status: An indication of the status of the implementation or example.
- Remarks: Additional remarks about the scope of the implementation or example.
- Core ("place"): An indication that the "coord" member is supported or used.
- Core ("time"): An indication that the "time" member is supported or used.
- 3D (Polyhedron):  An indication that (Multi-)Polyhedron geometries are supported or used in the "place" member.
- 3D (Prism): An indication that Prism geometries are supported or used in the "place" member.
- Feature Type: An indication that the "featureType" member is supported or used.
- Schema: An indication that the "featureSchema" member is supported or used.

If you are aware of other implementations or examples, please open an issue or a Pull Request with the information to add.

### Map clients

| Name | Status | Remarks | Core ("place") | Core ("time") | 3D (Polyhedron) | 3D (Prism) | Feature Type | Schema | 
| ---- | ------ | ------- | :------------: | :-----------: | :-------------: | :--------: | :----------: | :----: |
| [GLeo](https://gitlab.com/IvanSanchez/gleo) | Demonstrator | Web client, [Example client that can display JSON-FG data added by drag & drop to the map](https://ivansanchez.gitlab.io/gleo/demos/jsonfg-drag-drop.html) | X | - | - | - | - | - |
| [JSON-FG OpenLayers example](https://github.com/Geonovum-labs/json-fg-examples)  | Demonstrator | [Web client demonstrating how JSON-FG data can be shown in an OpenLayers map](https://geonovum-labs.github.io/json-fg-examples/), supports a time slider to select features in an interval | X | X | - | - | - | - |
| [GNOSIS Cartographer (Ecere)](https://ecere.ca/gnosis/overview/#cartographer) | Stable | Desktop client, supports v0.1 | X | X | ? | - | ? | - |
| [3D viewer (3DGI)](https://dev.3dgi.xyz/jsonfg-viewer) | Stable | Web client for features with polyhedron geometries, support file upload and access via OGC API Features | X | X | X | - | X | - |

### Converters

| Name | Status | Remarks | Core ("place") | Core ("time") | 3D (Polyhedron) | 3D (Prism) | Feature Type | Schema | 
| ---- | ------ | ------- | :------------: | :-----------: | :-------------: | :--------: | :----------: | :----: |
| [GDAL](https://gdal.org/drivers/vector/jsonfg.html) | Stable | Convert between JSON-FG and other feature formats | X | X | (X) | - | X | - |
| [CityJSON to JSON-FG (3DGI)](https://pypi.org/project/cityjson2jsonfg) | Stable | A command line tool for converting CityJSON files to JSON-FG format | X | X | X | - | X | - |

### Publish Web APIs implementing OGC API Features

| Name | Status | Remarks | Core ("place") | Core ("time") | 3D (Polyhedron) | 3D (Prism) | Feature Type | Schema | 
| ---- | ------ | ------- | :------------: | :-----------: | :-------------: | :--------: | :----------: | :----: |
| [ldproxy](https://docs.ldproxy.net/services/building-blocks/features_-_json-fg.html) | Stable | OGC API Features Reference Implementation | X | X | X | - | X | X |
| CubeServ | Stable | A suite of OGC web services and OGC API endpoints by CubeWerx Inc. | X | X | - | - | X | X |
| [GoKoala](https://github.com/PDOK/gokoala) | Development | Cloud Native OGC API server | X | X | - | - | - | - |

Examples of OGC Web APIs providing features in JSON-FG:

* [Vancouver infrastructure data (CubeServ)](https://test.cubewerx.com/cubewerx/cubeserv/default/ogcapi/Vancouver)
* [Topographic data, Daraa, Syria (ldproxy)](https://demo.ldproxy.net/daraa)
* [3D Buildings in Cologne (ldproxy)](https://demo.ldproxy.net/cologne_lod2)
* [OS Open Zoomstack (ldproxy)](https://demo.ldproxy.net/zoomstack)

### Validators

| Name | Status | Remarks | Core ("place") | Core ("time") | 3D (Polyhedron) | 3D (Prism) | Feature Type | Schema | 
| ---- | ------ | ------- | :------------: | :-----------: | :-------------: | :--------: | :----------: | :----: |
| [json-fg-linter](https://github.com/Geonovum-labs/ogc-checker) | Initial version | Validate JSON-FG using JSON Schema validation and additional tests. [Online linter](https://geonovum-labs.github.io/ogc-checker/) | X | X | X | X | X | X |
| [json-fg-validator](https://github.com/tomkralidis/json-fg-validator) | Initial version | Validate JSON-FG (command line, Python) using JSON Schema validation and additional tests. | (X) | (X) | (X) | (X) | (X) | (X) |
| [val3dity](https://github.com/tudelft3d/val3dity) | Stable | Validate Polyhedron gemetries | (X) | - | X | - | - | - |

### Parsers

| Name | Status | Remarks | Core ("place") | Core ("time") | 3D (Polyhedron) | 3D (Prism) | Feature Type | Schema | 
| ---- | ------ | ------- | :------------: | :-----------: | :-------------: | :--------: | :----------: | :----: |
| [JSON-FG for Java](https://github.com/Geonovum-labs/json-fg-java) | Development | Java classes to simplfy handling JSON-FG | X | X | X | X | X | X |

### Data Specifications

| Name | Status | Remarks | Core ("place") | Core ("time") | 3D (Polyhedron) | 3D (Prism) | Feature Type | Schema | 
| ---- | ------ | ------- | :------------: | :-----------: | :-------------: | :--------: | :----------: | :----: |
| [XPlanung](https://xleitstelle.de/xplanung) | Development | XPlanung is the mandatory specification for the exchange of spatial plans in Germany. XPlanung specifies a GML encoding. Support for a JSON-FG encoding is under investigation, schemas are available at [JSON Schemas for XPlanung](https://gitlab.opencode.de/xleitstelle/xplanung/schemas/json).  | X | X | - | - | X | - |
| [ShapeChange](https://github.com/ShapeChange/ShapeChange) | Stable | ShapeChange processes application schemas for geographic information modelled in UML according to ISO 19109. The [JSON Schema target](https://shapechange.github.io/ShapeChange/3.0.0/targets/JSON_Schema.html) supports generating schemas for validating JSON-FG or GeoJSON instances. | X | X | X | - | X | - |
| [Imvertor]( https://armatiek.nl/imvertor.html) | Stable | Imvertor processes information models modelled in UML according to (Dutch) [metamodel for information modeling](https://docs.geostandaarden.nl/mim/mim/). The JSON Schema target supports generating schemas for validating JSON-FG or GeoJSON instances. | X | X | X | - | X | - |

## Communication

Work on the specification takes place in [GitHub issues](https://github.com/opengeospatial/ogc-feat-geo-json/issues),
so browse there to get a good idea of what is happening, as well as past decisions.

Recordings of meetings can be found on the [OGC portal](https://portal.ogc.org/index.php?m=projects&a=view&project_id=660&tab=2&artifact_id=97658) (access for members of the OGC and the OGC Features and Geometries JSON Standards Working Group).

## Contributing

The contributor understands that any contributions, if accepted by the OGC Membership, shall be incorporated into OGC standards documents and that all copyright and intellectual property shall be vested to the OGC.

The OGC Features and Geometries JSON Standards Working Group (SWG) is the group at OGC responsible for the stewardship of the standard, but is working to do as much work in public as possible.

* [Open issues](https://github.com/opengeospatial/ogc-feat-geo-json/issues)
* [Copy of License Language](https://raw.githubusercontent.com/opengeospatial/ogc-feat-geo-json/master/LICENSE)

For more information, see [CONTRIBUTING.md](CONTRIBUTING.md).

Pull Requests from contributors are welcomed. However, please note that by sending a Pull Request or Commit to this GitHub repository, you are agreeing to the terms in the [SWG Charter](CHARTER.adoc).

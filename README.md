# OGC Features and Geometries JSON (JSON-FG)

This GitHub repository contains [OGC](https://www.ogc.org/)'s candidate standard for OGC Features and Geometries JSON.

OGC Features and Geometries JSON (JSON-FG) builds on the widely used [GeoJSON standard](https://geojson.org/) and extends it with minimal extensions to support additional concepts that are important for the wider geospatial community and the [OGC API standards](https://ogcapi.ogc.org/).

## Status

The current version is draft 0.2.2. 

The current version will be the basis for the OGC Public Comment phase for 90 days, which is the final call for public comments before the candidate standard will go through the process for approval as an OGC Standard after resolving the comments received during the OGC Public Comment period.

The editor's draft of the specification can be found at [docs.ogc.org/DRAFTS/21-045.html](https://docs.ogc.org/DRAFTS/21-045.html). A [PDF version](https://docs.ogc.org/DRAFTS/21-045.pdf) is available, too.

The Open Geospatial Consortium (OGC) invites organisations and developers that have a need for the extensions specified by this specification to implement and test the extensions. Please submit feedback in the [in this repository](https://github.com/opengeospatial/ogc-feat-geo-json/issues). Are these extensions useful for your use cases? Are they simple enough to implement?

There are a number of [open issues under discussion](https://github.com/opengeospatial/ogc-feat-geo-json/labels/waiting%20for%20input). 

Uptake in implementations and sufficient feedback from implementation experience are a prerequisite for this specification to eventually progress towards an OGC Standard.

## Overview

[GeoJSON](https://datatracker.ietf.org/doc/html/rfc7946) is a very popular encoding for geospatial vector data. GeoJSON is widely supported, including in most deployments of APIs implementing the OGC API Features Standard. However, GeoJSON has intentional restrictions that prevent or limit its use in certain geospatial application contexts. For example, GeoJSON is restricted to WGS 84 coordinates, does not support volumetric geometries and has no concept of classifying features according to their type.

OGC Features and Geometries JSON (JSON-FG) is an OGC Candidate Standard for GeoJSON extensions that provide standard ways to support such requirements. The goal is to focus on capabilities that may require some geospatial expertise, but that are useful for many. Edge cases are considered out-of-scope of JSON-FG.

Since JSON-FG specifies extensions to GeoJSON that conform to the GeoJSON standard, valid JSON-FG features or feature collections are also valid GeoJSON features or feature collections.

The JSON-FG Standard specifies the following extensions to the GeoJSON format:

* The ability to use Coordinate Reference Systems (CRSs) other than WGS 84 (OGC:CRS84);
* The ability to use non-Euclidean metrics, in particular ellipsoidal metrics;
* Support for solids and prisms as geometry types;
* The ability to encode temporal characteristics of a feature; and
* The ability to declare the type and the schema of a feature.

Geographic features, their properties, and their spatial extents that can be represented as GeoJSON objects are encoded as GeoJSON. Additional information not specified in the GeoJSON RFC is mainly encoded in additional members of the GeoJSON objects. The additional members use keys that do not conflict with existing GeoJSON keys. This was done so that existing and future GeoJSON clients can continue to successfully parse and understand GeoJSON encoded content. JSON-FG enabled clients will also be able to parse and understand the additional members.

JSON Schema is used to formally specify the JSON-FG syntax.

## Example use cases

NOTE: TODO

## Implementations

NOTE: Work in progress, more to be added, information to be checked

### Converters

| Software Tool | Remarks | Core: `place` | Core: `time` | 3D: Polyhedron | 3D: Prisms | Feature Type | Schema | 
| ------------- | ------- | :-----------: | :----------: | :------------: | :--------: | :----------: | :----: |
| [GDAL](https://gdal.org/drivers/vector/jsonfg.html) | Convert between JSON-FG and other feature formats | X | X | (X) | - | X | - |
| [cityjson2jsonfg](https://pypi.org/project/cityjson2jsonfg/) | CityJSON to JSON-FG converter | X | X | (X) | - | - | - |

### Publish Web APIs implementing OGC API Features

| Software Tool | Remarks | Core: `place` | Core: `time` | 3D: Polyhedron | 3D: Prisms | Feature Type | Schema | 
| ------------- | ------- | :-----------: | :----------: | :------------: | :--------: | :----------: | :----: |
| [ldproxy](https://docs.ldproxy.net/services/building-blocks/features_-_json-fg.html) | | X | X | X | - | X | X |
| CubeServ (MariaDB) | | X | X | ? | ? | ? | ? |

### Mapping clients

| Software Tool | Remarks | Core: `place` | Core: `time` | 3D: Polyhedron | 3D: Prisms | Feature Type | Schema | 
| ------------- | ------- | :-----------: | :----------: | :------------: | :--------: | :----------: | :----: |
| [GLeo](https://gitlab.com/IvanSanchez/gleo) | Web client, [Example client](https://ivansanchez.gitlab.io/gleo/demos/jsonfg-drag-drop.html) | X | ? | - | - | - | - |
| [GNOSIS Cartographer (Ecere)](https://ecere.ca/gnosis/overview/#cartographer) | Desktop client | X | ? | ? | ? | ? | ? |

### Validators

| Software Tool | Remarks | Core: `place` | Core: `time` | 3D: Polyhedron | 3D: Prisms | Feature Type | Schema | 
| ------------- | ------- | :-----------: | :----------: | :------------: | :--------: | :----------: | :----: |
| [val3dity](https://github.com/tudelft3d/val3dity) | Validate Polyhedron gemetries | (X) | - | X | - | - | - |
| [json-fg-validator](https://github.com/tomkralidis/json-fg-validator) | Validate JSON-FG (command line, Python) | X | X | ? | ? | ? | ? |
| [json-fg-linter](https://github.com/Geonovum-labs/json-fg-linter) | Validate JSON-FG (Node JS) | X | X | ? | ? | ? | ? |

### Libraries

| Software Tool | Remarks | Core: `place` | Core: `time` | 3D: Polyhedron | 3D: Prisms | Feature Type | Schema | 
| ------------- | ------- | :-----------: | :----------: | :------------: | :--------: | :----------: | :----: |
| [JSON-FG for Java](https://github.com/Geonovum-labs/json-fg-java) | Java classes to simplfy handling JSON-FG | X | X | ? | ? | ? | ? |

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

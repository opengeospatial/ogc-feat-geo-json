# OGC Features and Geometries JSON (JSON-FG)

This GitHub repository contains [OGC](https://www.ogc.org/)'s candidate standard for OGC Features and Geometries JSON.

OGC Features and Geometries JSON (JSON-FG) builds on the widely used [GeoJSON standard](https://geojson.org/) and extends it with minimal extensions to support additional concepts that are important for the wider geospatial community and the [OGC API standards](https://ogcapi.ogc.org/).

## Status

The current version is 0.2.2. 

This version will be the basis for the OGC Public Comment phase for 90 days, which is the final call for comments before the candidate standard will go through the process for approval as an OGC Standard after resolving the comments received during the OGC Public Comment period.

The editor's draft of the specification can be found at [docs.ogc.org/DRAFTS/21-045.html](https://docs.ogc.org/DRAFTS/21-045.html). A [PDF version](https://docs.ogc.org/DRAFTS/21-045.pdf) is available, too.

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

<table style="width:100%">
<thead>
<tr>
<th style="width:12%">Name</th>
<th style="width:10%">Status</th>
<th style="width:30%">Remarks</th>
<th style="width:8%" align="center">Core ("place")</th>
<th style="width:8%" align="center">Core ("time")</th>
<th style="width:8%" align="center">3D (Polyhedron)</th>
<th style="width:8%" align="center">3D (Prism)</th>
<th style="width:8%" align="center">Feature Type</th>
<th style="width:8%" align="center">Schema</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://gitlab.com/IvanSanchez/gleo" rel="nofollow">GLeo</a></td>
<td>Demonstrator</td>
<td>Web client, <a href="https://ivansanchez.gitlab.io/gleo/demos/jsonfg-drag-drop.html" rel="nofollow">Example client that can display JSON-FG data added by drag &amp; drop to the map</a></td>
<td align="center">X</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
</tr>
<tr>
<td><a href="https://github.com/Geonovum-labs/json-fg-examples">JSON-FG OpenLayers example</a></td>
<td>Demonstrator</td>
<td><a href="https://geonovum-labs.github.io/json-fg-examples/" rel="nofollow">Web client demonstrating how JSON-FG data can be shown in an OpenLayers map</a>, supports a time slider to select features in an interval</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
</tr>
<tr>
<td><a href="https://ecere.ca/gnosis/overview/#cartographer" rel="nofollow">GNOSIS Cartographer (Ecere)</a></td>
<td>Stable</td>
<td>Desktop client</td>
<td align="center">X</td>
<td align="center">?</td>
<td align="center">?</td>
<td align="center">?</td>
<td align="center">?</td>
<td align="center">?</td>
</tr>
</tbody>
</table>

### Converters

<table>
<thead>
<tr>
<th style="width:12%">Name</th>
<th style="width:10%">Status</th>
<th style="width:30%">Remarks</th>
<th style="width:8%" align="center">Core ("place")</th>
<th style="width:8%" align="center">Core ("time")</th>
<th style="width:8%" align="center">3D (Polyhedron)</th>
<th style="width:8%" align="center">3D (Prism)</th>
<th style="width:8%" align="center">Feature Type</th>
<th style="width:8%" align="center">Schema</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://gdal.org/drivers/vector/jsonfg.html" rel="nofollow">GDAL</a></td>
<td>Stable</td>
<td>Convert between JSON-FG and other feature formats</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">(X)</td>
<td align="center">-</td>
<td align="center">X</td>
<td align="center">-</td>
</tr>
<tr>
<td><a href="https://pypi.org/project/cityjson2jsonfg/" rel="nofollow">cityjson2jsonfg</a></td>
<td>Initial Version</td>
<td>CityJSON to JSON-FG converter</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">(X)</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
</tr>
</tbody>
</table>

### Publish Web APIs implementing OGC API Features

<table>
<thead>
<tr>
<th style="width:12%">Name</th>
<th style="width:10%">Status</th>
<th style="width:30%">Remarks</th>
<th style="width:8%" align="center">Core ("place")</th>
<th style="width:8%" align="center">Core ("time")</th>
<th style="width:8%" align="center">3D (Polyhedron)</th>
<th style="width:8%" align="center">3D (Prism)</th>
<th style="width:8%" align="center">Feature Type</th>
<th style="width:8%" align="center">Schema</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://docs.ldproxy.net/services/building-blocks/features_-_json-fg.html" rel="nofollow">ldproxy</a></td>
<td>Stable</td>
<td></td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">-</td>
<td align="center">X</td>
<td align="center">X</td>
</tr>
<tr>
<td>CubeServ (CubeWerx)</td>
<td>TBD</td>
<td></td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">?</td>
<td align="center">?</td>
<td align="center">?</td>
<td align="center">?</td>
</tr>
</tbody>
</table>

Examples of APIs providing JSON-FG:

* [Topographic data, Daraa, Syria](https://demo.ldproxy.net/daraa)
* [Vineyards in Rhineland-Palatinate, Germany](https://demo.ldproxy.net/vineyards)
* [OS Open Zoomstack](https://demo.ldproxy.net/zoomstack)
* (more to be added soon)

### Validators

<table>
<thead>
<tr>
<th style="width:12%">Name</th>
<th style="width:10%">Status</th>
<th style="width:30%">Remarks</th>
<th style="width:8%" align="center">Core ("place")</th>
<th style="width:8%" align="center">Core ("time")</th>
<th style="width:8%" align="center">3D (Polyhedron)</th>
<th style="width:8%" align="center">3D (Prism)</th>
<th style="width:8%" align="center">Feature Type</th>
<th style="width:8%" align="center">Schema</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://github.com/Geonovum-labs/json-fg-linter">json-fg-linter</a></td>
<td>Initial version</td>
<td>Validate JSON-FG using JSON Schema validation and</td>
<td align="center"></td>
<td align="center"></td>
<td align="center"></td>
<td align="center"></td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td>additional tests. <a href="https://geonovum-labs.github.io/json-fg-linter/" rel="nofollow">Online linter</a></td>
<td>X</td>
<td>X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center"></td>
<td align="center"></td>
</tr>
<tr>
<td><a href="https://github.com/tomkralidis/json-fg-validator">json-fg-validator</a></td>
<td>Initial version</td>
<td>Validate JSON-FG (command line, Python) using JSON Schema validation and additional tests.</td>
<td align="center">(X)</td>
<td align="center">(X)</td>
<td align="center">(X)</td>
<td align="center">(X)</td>
<td align="center">(X)</td>
<td align="center">(X)</td>
</tr>
<tr>
<td><a href="https://github.com/tudelft3d/val3dity">val3dity</a></td>
<td>Stable</td>
<td>Validate Polyhedron gemetries</td>
<td align="center">(X)</td>
<td align="center">-</td>
<td align="center">X</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">-</td>
</tr>
</tbody>
</table>

### Parsers

<table>
<thead>
<tr>
<th style="width:12%">Name</th>
<th style="width:10%">Status</th>
<th style="width:30%">Remarks</th>
<th style="width:8%" align="center">Core ("place")</th>
<th style="width:8%" align="center">Core ("time")</th>
<th style="width:8%" align="center">3D (Polyhedron)</th>
<th style="width:8%" align="center">3D (Prism)</th>
<th style="width:8%" align="center">Feature Type</th>
<th style="width:8%" align="center">Schema</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://github.com/Geonovum-labs/json-fg-java">JSON-FG for Java</a></td>
<td>Development</td>
<td>Java classes to simplfy handling JSON-FG</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
</tr>
</tbody>
</table>

### Data Specifications

<table>
<thead>
<tr>
<th style="width:12%">Name</th>
<th style="width:10%">Status</th>
<th style="width:30%">Remarks</th>
<th style="width:8%" align="center">Core ("place")</th>
<th style="width:8%" align="center">Core ("time")</th>
<th style="width:8%" align="center">3D (Polyhedron)</th>
<th style="width:8%" align="center">3D (Prism)</th>
<th style="width:8%" align="center">Feature Type</th>
<th style="width:8%" align="center">Schema</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://xleitstelle.de/xplanung" rel="nofollow">XPlanung</a></td>
<td>Development</td>
<td>XPlanung is the mandatory specification for the exchange of spatial plans in Germany. XPlanung specifies a GML encoding. Support for a JSON-FG encoding is under investigation, schemas are available at <a href="https://gitlab.opencode.de/xleitstelle/xplanung/schemas/json" rel="nofollow">JSON Schemas for XPlanung</a>.</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">-</td>
<td align="center">-</td>
<td align="center">X</td>
<td align="center">-</td>
</tr>
<tr>
<td><a href="https://github.com/ShapeChange/ShapeChange">ShapeChange</a></td>
<td>Stable</td>
<td>ShapeChange processes application schemas for geographic information modelled in UML accoring to ISO 19109. The <a href="https://shapechange.github.io/ShapeChange/3.0.0/targets/JSON_Schema.html" rel="nofollow">JSON Schema target</a> supports generating schemas for validating JSON-FG or GeoJSON instances.</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">X</td>
<td align="center">-</td>
<td align="center">X</td>
<td align="center">-</td>
</tr>
</tbody>
</table>

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

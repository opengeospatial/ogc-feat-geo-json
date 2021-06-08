# Discussion Paper template

## Content

This folder contains the text for the Discussion Paper

* dp.adoc - the main Discussion Paper document with references to all sections
* remaining adocs - each section of the Discussion Paper document is in a separate document: follow directions in each document to populate
* figures - figures go here
* images - Image files for graphics go here. Image files for figures go in the "figures" directory. Only place in here images not used in figures (e.g., as parts of tables, as logos, etc.)
* requirements - (OPTIONAL) directory for requirements and requirement classes to be referenced in clause_7_normative_text.adoc
* code - (OPTIONAL)sample code to accompany the Discussion Paper, if desired
* abstract_tests - (OPTIONAL)the Abstract Test Suite comprising one test for every requirement, optional
* UML - UML diagrams, if applicable

## Building

To produce the HTML of the Discussion Paper run `asciidoctor --safe -a data-uri -o
<Discussion Paper name>.html dp.adoc`

To produce the PDF of the Discussion Paper run `asciidoctor-pdf --safe -o
<Discussion Paper name>.pdf dp.adoc`

# Proposals

This folder contains proposals for building blocks of OGC Features and Geometries JSON for discussion before content is eventually moved to the specification document.

Current proposals:

* [Encoding the temporal extent of a feature](temporal-extent.adoc)
* [Encoding the spatial geometry of a feature](spatial-geometry.adoc)
* [Encoding of reference systems](ref-sys.adoc)
* [Identifying the schema](schema-ref.adoc)

To add a new proposal:

* Every proposal should be a single AsciiDoc page based on [TEMPLATE.adoc](Template.adoc). The initial version should be 0.1.0. Add the document in the proposal folder and add a link to the proposal in this README page. This can be in a pull request or as a direct commit to the main branch.
* Create an issue for the proposal and add a link to it. This issue is a notice about the new proposal and can be used by anyone to add comments on a proposal.

To update a proposal:

* Update the document. Increase the version number.
* Use a pull request. If the changes were already agreed in a meeting or the change is a bugfix, the pull request may be merged directly. Otherwise the pull request will be discussed and merged during a SWG meeting.

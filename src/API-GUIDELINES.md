> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

# Principles

- RECOMMENDED to read [Zalando RESTful API and Event Guidelines](https://opensource.zalando.com/restful-api-guidelines/) as a base and use as a reference
- SHOULD implement versioning
- MUST have versioning strategy decided prior the first release
- RECOMMENDED not use URL versioning
- RECOMMENDED to use HTTP Headers to carry version information
- RECOMMENDED have version information also in response headers
- MUST not break backward compatibility once the version has been released

\pagebreak

\stoptocwriting

# Appendix 1

## Commentary

### Resource

A resource is a conceptual mapping to a set of entities, not the entity that corresponds to the mapping at any particular point in time. In other word, resource is unique and anything with an URL and entity is its representation of that resource in current time when requested.

Even though we’re recommending to adapt some of [Zalando’s good practices](https://opensource.zalando.com/restful-api-guidelines/), we’re not saying your APIs should be RESTful (but they can be!) or just [APIs built with good old conventions with HTTP semantics on distributed World Wide Web](https://kieranpotts.com/rebranding-rest/).

\resumetocwriting

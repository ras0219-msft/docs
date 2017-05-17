## vcpkg_from_github

Download and extract a project from GitHub. Enables support for `install --head`.

### Usage:
```cmake
vcpkg_from_github(
    OUT_SOURCE_PATH <SOURCE_PATH>
    REPO <Microsoft/cpprestsdk>
    [REF <v2.0.0>]
    [SHA512 <45d0d7f8cc350...>]
    [HEAD_REF <master>]
)
```

### Parameters:
#### `OUT_SOURCE_PATH`
Specifies the out-variable that will contain the extracted location.

This should be set to `SOURCE_PATH` by convention.

#### `REPO`
The organization or user and repository on GitHub.

#### `REF`
A stable git commit-ish (ideally a tag) that will not change contents.

If `REF` is specified, `SHA512` must also be specified.

#### `SHA512`
The SHA512 hash that matches the downloaded archive.

This is most easily determined by first setting it to `1`, then trying to build the port. The error message will contain the full hash, which can be copied back into the portfile.

#### `HEAD_REF`
The unstable git commit-ish (ideally a branch) to pull for `--head` builds.

For most projects, this should be `master`. The chosen branch should be one that is expected to be always buildable on all supported platforms.

### Notes:
At least one of `REF` and `HEAD_REF` must be specified.

This exports the `VCPKG_HEAD_VERSION` variable during head builds.

### Examples:

* [cpprestsdk](https://github.com/Microsoft/vcpkg/blob/master/ports/cpprestsdk/portfile.cmake)
* [ms-gsl](https://github.com/Microsoft/vcpkg/blob/master/ports/ms-gsl/portfile.cmake)
* [beast](https://github.com/Microsoft/vcpkg/blob/master/ports/beast/portfile.cmake)

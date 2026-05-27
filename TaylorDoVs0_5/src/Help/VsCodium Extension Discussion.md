# MyDefrag Script Preprocessor Architecture

## Overview

MyDefrag scripts are preprocessed before being executed by the application. Any occurrences of:

```text
!include "..\Volume\VolumeStatisticsDetailGet.MyDc"!
````

will insert the referenced file into the script.

This is a recursive process. Processing then starts.

I generate (make) an output (or preview) document. It is for later use with my VSCodium extension for the MyDefrag script language.

---

## Include Processing

An include directive such as:

```text
!include "..\Volume\VolumeStatisticsDetailGet.MyDc"!
```

causes the referenced file contents to be inserted inline.

Included files may themselves contain additional include directives, resulting in recursive expansion.

Expansion continues until all includes have been resolved and a final flattened script is produced.

After preprocessing completes, the resulting expanded script is what the MyDefrag engine parses and executes.

---

## Expanded / Preview Document

A separate “output” or “preview” document is generated representing the fully expanded script.

This expanded representation is expected to become an important component of the future VSCodium extension for the MyDefrag scripting language.

Potential uses include:

* Navigation to resolved includes
* “Peek expanded script”
* Diagnostics on the post-preprocessed script
* Symbol indexing across included files
* Include cycle detection
* Include graph visualization
* Semantic validation after expansion
* Source-map style mapping from expanded lines back to original source files

---

## Suggested Extension Architecture

### 1. Raw Source Model

Stores the original script files.

Responsibilities:

* Preserve original `.MyD` and `.MyDc` files
* Preserve include directives
* Track workspace file relationships

### 2. Preprocessor Engine

Responsible for recursive include expansion.

Responsibilities:

* Recursive include resolution
* Path normalization
* Include caching
* Include cycle protection
* Future conditional processing support

### 3. Expanded Document Model

Represents the fully flattened script after preprocessing.

Responsibilities:

* Store the expanded script
* Maintain line/source mapping tables
* Provide diagnostics against the expanded form

### 4. Language Services

Provides editor functionality for the scripting language.

Potential features:

* Syntax highlighting
* Hover help
* Auto-completion
* Go-to-definition
* Validation
* Symbol outline support

### 5. Preview / Output Generator

Produces a readable representation of the fully expanded script.

Potential features:

* Human-readable expanded script
* Optional annotated include boundaries
* Export support

---

## Source Mapping

A source-map style structure would be useful for diagnostics and navigation.

Example:

```json
{
  "expandedLine": 420,
  "sourceFile": "VolumeStatisticsDetailGet.MyDc",
  "sourceLine": 12,
  "includedFrom": "MainScript.MyD"
}
```

This allows the extension to report errors originating from the original source file rather than only from the flattened output.

Example diagnostic:

```text
Error originating from VolumeStatisticsDetailGet.MyDc:12
```

instead of only:

```text
Error on expanded line 420
```

---

## Parser Considerations

The MyDefrag include syntax is distinctive enough that a dedicated tokenizer/parser will likely be cleaner and more maintainable than attempting to adapt a generic C-style preprocessor model.

```text
```

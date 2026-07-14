# Development Environment

## Overview

TaylorDo is maintained using a dedicated development environment built specifically for the MyDefrag scripting language.

The primary development tool is **mydefrag-syntax**, a language extension for VSCodium and Visual Studio Code. The extension provides language-aware editing, validation, diagnostics, and repository guidance for MyDefrag scripts.

Although TaylorDo can be used without this extension, all official TaylorDo development and releases are produced and validated using this environment.

## Objectives

The development environment has four primary objectives:

* Improve developer productivity.
* Detect script errors before deployment.
* Encourage consistent repository organization.
* Preserve long-term maintainability of the TaylorDo script library.

The goal is to provide tooling comparable to that available for modern programming languages while remaining faithful to the original MyDefrag scripting language.

## Primary Components

### mydefrag-syntax

The MyDefrag Language Extension provides features including:

* Syntax highlighting.
* Semantic analysis.
* Real-time diagnostics.
* Error and warning reporting.
* Repository organization guidance.
* Code navigation.
* Language-aware editing.
* Validation of scripts before release.

The extension understands the MyDefrag language and assists authors in creating valid, maintainable scripts.

## Official Development Tool

All official TaylorDo scripts are maintained using mydefrag-syntax.

The extension serves as the reference development environment used during:

* Feature development.
* Script maintenance.
* Validation.
* Quality assurance.
* Release preparation.

This ensures that all published scripts conform to the expected language rules and if desired the TaylorDo development standards.

## Custom Development

System administrators and advanced users may also use mydefrag-syntax when:

* Modifying existing TaylorDo scripts.
* Developing organization-specific optimization policies.
* Creating custom optimization scripts.
* Previewing composed executable scripts.
* Cross-referencing MyDefrag errors to locations in source code.
* Maintaining private script repositories.
* Validating scripts before deployment.

Using the extension is strongly recommended whenever MyDefrag scripts are edited.

## Relationship to TaylorDo

TaylorDo and mydefrag-syntax are complementary projects.

**TaylorDo** provides:

* Disk optimization strategy.
* Script library.
* Configuration tools.
* Installation and scheduling.

**mydefrag-syntax** provides:

* Development environment.
* Language support.
* Diagnostics.
* Validation.
* Authoring assistance.

The projects are maintained independently while evolving together.

## Long-Term Vision

The development environment is intended to preserve and extend the MyDefrag scripting ecosystem.

As TaylorDo evolves, mydefrag-syntax will continue to provide modern tooling for script authors, helping ensure that both official and custom scripts remain correct, maintainable, and well organized.

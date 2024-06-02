# Feature First Design Pattern (FFDP)
The term "feature-first design pattern" specifically refers to an approach for structuring the codebase of an application, Instead of organizing code by layers (e.g., Model-View-Controller), the focus is on features.

## Benefits:
- Improved maintainability: Code related to a specific feature is grouped together, making it easier to understand, modify, and test.
- Enhanced reusability: UI components and logic within a feature can be potentially reused in other features.
- Faster development: Developers can focus on implementing a single feature at a time without getting tangled in complex layer interactions.
- Easier testing: Testing becomes more focused as you can isolate the logic within a feature.

## Introduction
This repo attempts to explain the feature first design pattern and it's use in flutter apps specifically, as well as the various folders and their components. This repo will be updated as my understanding of best practices increase

## Layers
The FFDP as 3 main layers and 2 assistant layers
The 3 main layers are:
 - Data
 - Domain
 - Presentation

The 2 assistant layers are:
 - Config
 - Core

### Data Layer
It is responsible for data retrieval and repository interface implementations. It has 3 parts
​1. Repositories Implementation (coordinating data from data sources)
		- Uses endpoint of data source 
		- It contains functions that use endpoint to get the data
​2. Data Sources (Local or remote)
		- Defines methods used by the repository
		- For remote data sources retrofit is used in this project
​3. Models (formatting data from data source)
		- Contains methods for the use of an entity in a app
		- It extends entity
    - It is the extension of the entity that allows the entity to remain independent of the other layers

The Domain Layer is not always required but for complicated apps it can have its advantages, primarily with the usecases, that allow for easy resusability and testing of code while restricting the access between the UI and the data layers, 
As for the entity in domain vs model in data layer, properly distinguishing the two can be quite difficult and the line between them is blurry. But my understanding of an entity at least in relation to this progect is a presentation of a real world object bearing its properties but no methods that alter these properties (for this progect the properties of the ArticleEntity where made immutable), the model however should extend the entity and contain methods that alter these properties or the model itself. The model is meant to be a way for the domain layer entity to remain independent of all other layers. although the entity is defined as a parameter for certain functions at certain points in this progect which i found confusing. Currently I cant think of any reason why the entity folder is needed and the model on its own is just fine but perhaps ther is some usecase when it comes to multiple models that extend the same entity



## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).


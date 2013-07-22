# Doe Eye API Documentation - v1

## Vendors

#### POST /api/v1/vendors/login

Parameters

- `api_key`
- `api_password`

Returns

- `access_token`

The authentication parameters are supplied by DFTi

## Projects

#### POST /api/v1/projects

Parameters

- `access_token`
- `name`

Returns

- `project_id`

#### GET /api/v1/projects

Parameters

- `access_token`

Returns

All the projects for the authenticated vendor

#### GET /api/v1/projects/:id

Parameters

- `access_token`
- `id`

Returns the project data

## Documents

#### POST /api/v1/documents

Parameters

- `access_token`
- `project_id`
- `title`
- `file`

Returns

- `document_id`

#### GET /api/v1/documents/:id

Parameters

- `access_token`
- `id`

Returns the document data

#### GET /api/v1/projects/:project_id/documents

Parameters

- `access_token`
- `project_id`

Returns all the documents for a project

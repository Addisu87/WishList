# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {
      '/api/v1/books':
        get:
          summary: Get all books
          tags:
            - Books
          security:
            - Bearer: []
          parameters:
            - name: Authorization
              in: header
              required: true
              description: Authorization token
              schema:
                type: string
          responses:
            '200':
              description: books found
            '401':
              description: unauthorized
        post:
          summary: Create a book
          tags:
            - Books
          security:
            - Bearer: []
          parameters:
            - name: Authorization
              in: header
              required: true
              description: Authorization token
              schema:
                type: string
          responses:
            '302':
              description: redirected
            '401':
              description: unauthorized
          requestBody:
            content:
              application/json:
                schema:
                  type: object
                  properties:
                    book:
                      title:
                        type: string
                      body:
                        type: string
                  required:
                    - title
                    - body
              application/xml:
                schema:
                  type: object
                  properties:
                    book:
                      title:
                        type: string
                      body:
                        type: string
                  required:
                    - title
                    - body
      '/api/v1/books/{id}':
        get:
          summary: Get a book
          tags:
            - Books
          security:
            - Bearer: []
          parameters:
            - name: Authorization
              in: header
              required: true
              description: Authorization token
              schema:
                type: string
            - name: id
              in: path
              required: true
              description: ID of the book
              schema:
                type: string
          responses:
            '200':
              description: book found
            '404':
              description: book not found
            '401':
              description: unauthorized
          }
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
            default: '127.0.0.1:3000/'
          }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end

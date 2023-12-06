import radius as radius

@description('The ID of your Radius Application. Set automatically by the rad CLI.')
param application string

resource hello-radius 'Applications.Core/containers@2023-10-01-preview' = {
  name: 'hello-radius'
  properties: {
    application: application
    container: {
      env: {
        MESSAGE: "Hello, Radius!"
      }
      image: 'ghcr.io/mathieu-benoit/my-sample-app:latest'
      ports: {
        tcp: {
          containerPort: 8080
        }
      }
    }
  }
}
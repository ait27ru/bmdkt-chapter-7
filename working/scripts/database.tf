# Deploys a MongoDB database to the Kubernetes cluster.

// declare a k8s deployment for MongoDB server
resource "kubernetes_deployment" "database" {
  // set metadata for the deployment
  metadata {
    // set the name of the deployment
    name = "database"
    // label the deployment
    labels = {
      pod = "database"
    }
  }

  spec {
    // set the number of replicas to create for pods in this deployment
    replicas = 1
    // attach the deployment to its pods by matching labels
    selector {
      match_labels = {
        pod = "database"
      }
    }

    // templates for pods that are created by this deployment
    template {
      // set metadata for each pod
      metadata {
        // label the pod
        labels = {
          pod = "database"
        }
      }

      spec {
        // specify details for the single container instantiated by the pod
        container {
          // set the image from which to instantiate the container
          image = "mongo:5.0.11"
          // set the name of the container
          name = "database"

          port {
            // show the ports in the container to be exposed (MongoDB default)
            container_port = 27017
          }
        }
      }
    }
  }
}

// declare a k8s service that creates a DNS record so the database is accessible by other containers within the cluster
resource "kubernetes_service" "database" {
  metadata {
    // set the name of the service
    name = "database"
  }

  spec {
    selector = {
      // attach the service to the deployment by matching labels
      pod = kubernetes_deployment.database.metadata[0].labels.pod
    }

    port {
      // set the port that is exposed by this service
      port = 27017
    }

    // expose the service to the external world using Azure Load Balancer
    // type             = "LoadBalancer"
  }
}

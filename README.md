Wolkpack Demo Assset v0.5

The assets and applications in this repository are designed to demonstrate the integration of the various services and capabilities of the IBM Cloud platform.   The focus is on showcasing the potential of how IBM’s next generation of business partners can both embed IBM Cloud capabilities into their solutions and/or build completely new solutions for their customers.  This is done by providing a standard scenario and data set to support any of the following:

1.	High-level walkthrough focused on integration of services, providing accelerated development times
2.	Demonstrations of subsets of IBM Cloud capabilities
3.	Deep dives into one or more capabilities

An overview of the demo scenario can be viewed in the Wolfpack Demo Asset.pdf file.

In order to make it easy to get up and running with these assets, a significant portion of the required IBM Cloud services and applications have been setup in advance.  However, if you would like to setup the applications and services from scratch, the assets in the "setup yourself" folder can be used (coming in the next release).

The demo currently consists of the following pre-configured assets:
    - Two pre-defined containerized Node-Red apps that are deployed in an IBM Cloud hosted Kubernetes cluster.  If you prefer to use your own cluster they can also be deployed to other clusters (including ICP), since they are registered in a Docker Hub repository.
    - A set of pre-configured service instances in the NAChannels IBM Cloud organization.  These include,
            - A Kubernetes cluster (wolfpack-cluster)
            - Watson Conversation service (Conversation-wolfpack)
            - Watson IoT (Internet-of-Things-Platform-Wolkpack)
            - Watson Machine Learning (Machine-Learning-wolfpack)
            - Watson NLU (Natural Language Understanding-wolfpack)
            - Streaming Analytics (streaming-analytics-wolfpack)
            - Watson Tone Analyzer (Tone-Analyzer-wolfpack)
            - Db2 Warehouse (Wolfpack Demo Db2 Warehouse)
            - A Cognos instance hosted on Cloud Concierge
    - The following assets in a shard WDP Project and Catalog (you can share the assets to your own project as well)
        - A Python Notebook (Fitness Club USA Social Media Analysis.ipynb)
        - Four CSV files (next version will have this data in a simulated "on-prem" database hosted on Cloud Concierge):
            - Fitness_Data_1.csv
            - FCUSA Facebook Post Data.csv
            - Fitness Club Member Status.csv
            - Fitness Club Class Revenue.csv
        - A streaming analytics workflow
    - A Cognos dashboard

In addition to these asset, you will be required to setup the following in your own IBM Cloud or local environment, since these cannot be easily shared due to limitations

            - Kubernetes CLI tools
            - Bluemix Cloud/Local CLI tools

Please note that Refinery is not yet included due to its limited functionality in the Beta.  I expect to have it added in the next release, once join and other capabilities are available.  At that point, we can add some additional scenarios that include Catalog, Refinery, and hybrid-cloud data scenarios.

There are two Node-Red-based application provided as part of this demo:
    1.  Fitness Club Equipment Monitoring:  This application simulates and controls a setup of fitness equipment for a fitness club (treadmills and elipticals, specifically).  It provides updates to the Watson IoT Platform on the status of the devices, as well as reporting on any failures.  It also contains an example website that highlights the use of embedding Cognos dashboards into an app.

    2.  The Watson Conversation App:  Demonstrates an improved customer experience for the Fitness Club's members using Watson Conversation.  This app was originally developed by Sam Ennis and is being re-used for this part of the demo.  I have included the full asset set here for in the event it is needed.

Both apps are already deployed in the Wolfpack Kubernetes cluster.  The "Fitness Club App Deployment" provides details on how this currently deployment can be accessed and used, as well as how they can be re-deployed in another IBM Cloud Cluster or ICP.

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
    - A Cognos dashboard hosting on a Cloud Conseirge server

Please note that Refinery is not yet included due to its limited functionality in the Beta.  I expect to have it added in the next release, once join and other capabilities are available.  At that point, we can add some additional scenarios that include Catalog, Refinery, and hybrid-cloud data scenarios.

Setup Instructions (assuming you are running on a Mac or Linux):

In order to get started using these existing assets, you will be required to setup the following in your own IBM Cloud or local environment, since these cannot be easily shared due to limitations:

1.  Install the IBM Cloud CLI- https://console.bluemix.net/docs/cli/reference/bluemix_cli/get_started.html#getting-started

2.  Install the Kubernetes CLI (kubectl)- https://kubernetes.io/docs/tasks/tools/install-kubectl/

3.  Once the CLIs are install, ensure that they are both in your command line path.

4.  Install the IBM Cloud Container service plugin with the following: 

bx plugin install container-service -r Bluemix

There are two Node-Red-based application provided as part of this demo:
1.  Fitness Club Equipment Monitoring:  This application simulates and controls a setup of fitness equipment for a fitness club (treadmills and elipticals, specifically).  It provides updates to the Watson IoT Platform on the status of the devices, as well as reporting on any failures.  It also contains an example website that highlights the use of embedding Cognos dashboards into an app.

2.  The Watson Conversation App:  Demonstrates an improved customer experience for the Fitness Club's members using Watson Conversation.  This app was originally developed by Sam Ennis and is being re-used for this part of the demo.  I have included the full asset set here for in the event it is needed.
    
The following are links to sample instances of the applications in order to get an understand as to how these applications work.  However, for real-world use with partners and customer, you will need to create your own instance as described above.

  - Fitness Club Equipment Simulation Application (node-red) Sample Instance: http://184.172.250.58:32250
  - Fitness Club Equipment Dashboard Sample Instance: http://184.172.250.58:32250/app
  - Fitness Club Chat Node-Red Sample Instance: http://184.172.250.58:31259
  - Fitness Club Chat Application (node red): http://184.172.250.58:31259/red

While instances of these applications are hosted centrally on our Kubernetes cluster, it is HIGHLY advised that you create your own instances on the cluster with a unique name, ect.  This will enable us to do demos, etc. wihtout interferring with each other. To automate the process of setting up your instance, the following script has been created.  

app_deploy_script.sh

The script will ask you for a unique name to prefix the instance name of your apps in the cluster (I recommend using your email id minus the @ibm.com).  The script will then create your unique running instances of the applications on the Wolfpack Kubernetes cluster.

A few known issues with the script:

1.  You be asked to enter a one-time passcode for IBM Cloud.  Unfortunately, this is a security feature in the IBM Cloud when we use SSO accounts that we cannot work around for now (if anyone has any ideas on this, please let me know :) ).  However, a url will be listed to obtain this passcode.  Anyone who has used the IBM Cloud command line should be familar with this step.

2.  Its possible that you may get an error because the you need to setup your unique KUBECONFIG environment variable.  Fortunately, one of the commands in the script will provide the right command to manually execute to do this.  The output will look similar to below.  When the script fails, copy and paste the specific command listed and then re-run the script.  In the future, I expect to this piece automated.

export KUBECONFIG=/Users/ibm/.bluemix/plugins/container-service/clusters/wolfpack-cluster/kube-config-hou02-wolfpack-cluster.yml

3.  Its possible that you may get an error requiring you to have "viewer" privledges to the Container Service.  While I have setup these permissions for the entire team, its possible that I may have missed someone.  If you get this error, please let me know and I will fix ASAP.

Once you are done with using your instances, a clean-up script is also provided to remove them from the cluster.

app_cleanup_script.sh

Running the Demo:

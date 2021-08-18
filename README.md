
# ... We are working on it, this project is not yet completed ...

## Project:- Patient Data Management

I am new for blockchain technology, i am working with my team on this project (Patient Data Management).


## Login flow

1. All the stakeholders of the application (solution admin, hospital admin, doctor and patient) begin the user flow by logging into their respective dashboards.
2. Clicking the login button leads to the login portal of the Blockchain Solution Manager, hosted on the IBM cloud.
3. The login portal uses OpenAPI Connect and allows the user the login through any onboarded identity provider (in our example, we have on-boarded IBMID ad GoogleID). Successful authentication leads to the JWT credentials for the user

## Admin dashboard
1. The solution admin flow begins at the admin component, and requires the user to authenticate themselves through the login flow described above.
2. After successful authentication, the user can access the solution admin dashboard. They are able to view the solution, and add/remove hospitals from the solution using the Admin API's.
3. All the admin API's connect with the Blockchain Solution Manager through REST to process the user queries.
4. The Blockchain Solution Manager connects with the IBM Blockchain Platform and updates the ledger appropriately.

## Organization dashboard
1. The hospital admin flow begins at the organization component, and requires the user to authenticate themselves through the login flow described above.
2. After successful authentication, the user can access the hospital admin dashboard. They are able to add/remove any user in their respective hospital with the on-boarded roles (patient/doctor in our case) using the organization API's.
3. All the organization API's connect with the Blockchain Solution Manager through REST to process the user queries.
4. The Blockchain Solution Manager connects with the IBM Blockchain Platform and updates the ledger appropriately.
## Doctor dashboard
1. The doctor flow begins at the doctor component, and requires the user to authenticate themselves through the login flow described above.
2. After successful authentication, the user can access the doctor dashboard. They are able to upload a medical record for a patient who is part of their hospital and download any medical record associated with a patient to which they have access to, using the Doctor API's. The ACL's for all the patient documents is application level and is maintained through the Document ACL flow described below.
3. All the doctor API's connect with the Blockchain Document Store through REST to process the user queries.
4. The Blockchain Document Store connects with the IBM Blockchain Platform and updates the ledger appropriately.

## Patient dashboard
1. The patient flow begins at the patient component, and requires the user to authenticate themselves through the login flow described above.
2. After successful authentication, the user can access the patient dashboard. They are able to upload a medical record for themselves, download any of their medical records, view the access logs of their documents, and view/manage permissions to their documents, using the Patient API's. The ACL's for all the documents is application level and is maintained through the document ACL flow described below.
3. All the patient API's connect with the Blockchain Document Store through REST to process the user queries.
4. The Blockchain Document Store connects with the IBM Blockchain Platform and updates the ledger appropriately.

## Document access control list (ACL) flow
1. The doctor and patient component are connected with the Redis API's that invoke methods to manage the document level access control across hospitals.
2. The Redis API's talk to a NodeJS server deployed in a Docker container in a Kubernetes cluster on the IBM Cloud.
3. The server talks to two Redis databases which hold the access-per-document and access-per-user permissions.

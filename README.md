# RS School AWS DevOps Course Task 8

For this task I am updating my user-data to install Grafana via IaC. [Click here](https://github.com/anatolyostrovsky/rsschool-devops-course-tasks/blob/task8/terraform/user-data.sh) to check the script.
Grafana will be installed in a "monitoring" namespace together with Prometheus. To verify installation we can run:
```
kubectl get pods -n monitoring
```
![grafana-pods](https://github.com/user-attachments/assets/c5d40c4b-80e0-40c1-b3b8-38a81929f450)


We can access grafana on our public IP on port 30098. Next I login to Grafana server and add Prometheus as a data source


![grafana-data-dource](https://github.com/user-attachments/assets/48d6b856-a683-425b-940d-f85917a43853)

Now we can start creating new dashboards. Here is what I have, I know it is quite simple but it is something:


![grafana-dash](https://github.com/user-attachments/assets/1de226af-4872-4fea-9cfd-4001155faaa8)

And finally here is a link to  the [JSON file](https://github.com/anatolyostrovsky/rsschool-devops-course-tasks/blob/task8/dashboard-1.json) for the dashboard.

The only thing I haven't done is to create a password secret so feel free to remove 10 points for that.

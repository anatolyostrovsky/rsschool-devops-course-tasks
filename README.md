# RS School AWS DevOps Course Task 9

For this task I am updating my Grafana configuration with new values to configure SMTP. I am using Amazon SES.
I have a values file ready to be updated and used [here](https://github.com/anatolyostrovsky/rsschool-devops-course-tasks/blob/task9/grafana.yaml). Next we use updated values.yaml and run following commands to update and restart Grafana.
```
kubectl apply -f grafana.yaml -n monitoring
kubectl rollout restart deployment grafana -n monitoring

```
Next I am creating Contact Points and sending Test e-mail to verify my SMTP setup. 
![contact-points](https://github.com/user-attachments/assets/50ee7493-0364-4f2b-a8f6-1c921d13d531)


Now I can start creating Alert Rules:
![cpu-alert](https://github.com/user-attachments/assets/7b08d6b7-2bb8-46c5-a55d-9349e869fa5e)
![memory-alert](https://github.com/user-attachments/assets/6c473d48-a11c-4a3a-8601-ae435e16061b)

Then I can run stress command to maximize cpu usage (stress and sysbench are installed automatically via user-data)


```
stress --cpu 2
```
![cpu-alert2](https://github.com/user-attachments/assets/a47cd7c2-a5c7-4b87-8737-1fbf13b27aa5)
![ram-percent](https://github.com/user-attachments/assets/e9c21c9e-1feb-423e-9e30-15668727483e)

Shortly I am recieving an email alerts!

![Screenshot from 2024-12-14 18-39-18](https://github.com/user-attachments/assets/b2719d76-3e74-4c91-a85d-33ca0fbdec42)
![Screenshot from 2024-12-14 18-38-47](https://github.com/user-attachments/assets/d0d3b143-1558-43e1-bcb9-d28d167f7b20)



Everything seems to be working just fine.

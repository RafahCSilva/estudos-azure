# RESUMO


- Service; Purpose; Type; When to use:
    - **Event Grid**: (ONLY INFO) Reactive programming; Event distribution (discrete); React to status changes
    - **Event Hubs**: (BIG DATA) Big data pipeline; Event streaming (series); Telemetry and distributed data streaming
    - **Service Bus**: (NEED PROCESS) High-value enterprise messaging; Message; Order processing and financial transactions

- What is the difference between Azure Front Door and Azure Application Gateway?
    - While both Front Door and application Gateway are layer 7 (HTTP/HTTPS) load balancers, the primary difference is that Front Door is a global service whereas Application Gateway is a regional service. While Front Door can load balance between your different scale units/clusters/stamp units across regions, Application Gateway allows you to load balance between your VMs/containers etc. that is within the scale unit.
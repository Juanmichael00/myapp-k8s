# Sample application with EKS 

Neste tutorial aprenderemos a subir uma aplicação simples em K8s, configurando as roles de permissões, criando o Cluster EKS, Node Groups e expondo a aplicação com LoadBalancer
---

## Passo a passo

### 1 - Clone o repositório: 
https://github.com/Juanmichael00/myapp-k8s.git

### 2 - Configure uma chave CLI
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

### 3 - Instale o kubectl  (linux)
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
./kubectl
echo $PATH
mv kubectl /usr/local/bin
```
### Opcional: Se quiser subir uma estrutura de VPC utilizando Cloud Formation:
https://docs.aws.amazon.com/eks/latest/userguide/creating-a-vpc.html

```
https://docs.aws.amazon.com/eks/latest/userguide/creating-a-vpc.html
```
### 4 - Crie um cluster do EKS (versão 1.25) com role eks cluster atachada - politica AmazonEKSClusterPolicy

### 5 -Crie um node group no EKS criado com role "ec2" atachada com política "AmazonEKSWorkerNodePolicy", "AmazonEKS_CNI_Policy" e "AmazonEC2ContainerRegistryReadOnly"

### 6 - Conecte-se ao cluster EKS para atualizar o arquivo de configuração kubeconfig com as informações do seu cluster:
```
aws eks --region <região> update-kubeconfig --name <nome_do_cluster> 
```
### 7 - Verifique se você pode acessar o cluster executando:
```
kubectl get nodes
```
Obs: Você deve ver uma lista dos nós do cluster

## Prepare sua aplicação:

### 8 - Crie os arquivos de manifesto YAML para os recursos do Kubernetes necessários, como implantações, serviços e ingressos, no nosso lab usaremos o deployment.yaml para nossa aplicação e o service.yaml para configuração do serviço da sua aplicação.

### 9 - Implante sua aplicação:
```
kubectl apply -f deployment.yaml 
```
### 10 - Verifique o status da implantação executando 
```
kubectl get deployments 
```
### 11 - Verificar a implantação e os pods em execução.
```
kubectl get pods
```
### 12 - Exponha sua aplicação:
```
kubectl apply -f service.yaml 
```
### 13 - Verifique o status do serviço executando 
```
kubectl get services
```

# Congratulations, you have deployed your first application using Kubernetes
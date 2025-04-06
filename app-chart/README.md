# 🚀 Infraestrutura AWS com EKS + Helm Chart

Este repositório contém a infraestrutura base para provisionar um ambiente Kubernetes na AWS com EKS, utilizando Helm para deploy de duas aplicações (backend e frontend) e exposição via Ingress ALB.

---

## 📦 Componentes da Stack

- **Backend**: API REST containerizada
- **Frontend**: Aplicação estática que consome dados da API
- **Ingress Controller (ALB)**: Exposição pública via HTTPS
- **Banco de Dados**: Previsto para rodar em subnet dedicada com acesso restrito
- **Monitoramento**: (A ser adicionado nas próximas fases)

---

## 🗂️ Estrutura do Projeto

```bash
infra-eks-desafio/
├── app-chart/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── deployment-backend.yaml
│       ├── deployment-frontend.yaml
│       ├── service-backend.yaml
│       ├── service-frontend.yaml
│       └── ingress.yaml

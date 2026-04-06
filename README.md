# 🛠️ FixIt - Manutenção de TI On-Demand

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-green?style=for-the-badge)

O **FixIt** é um aplicativo multiplataforma desenvolvido para conectar usuários que precisam de assistência técnica (hardware e software) a técnicos de TI locais (estudantes e freelancers). O objetivo é facilitar a busca por profissionais qualificados, promover a geração de renda para estudantes da área e centralizar a negociação de orçamentos de forma segura e transparente.

---

## 📱 Funcionalidades (Requisitos Atendidos)

O projeto foi arquitetado focado na experiência do usuário e na gestão eficiente de estado. As principais funcionalidades incluem:

- **Autenticação de Usuários (RF001 - RF003):** Fluxo completo de Login, Cadastro de conta e Recuperação de senha com validação de formulários.
- **Painel de Lances / Orçamentos (RF007):** Os clientes recebem propostas de técnicos para seus chamados abertos e podem aceitá-las diretamente pelo app.
- **Geolocalização e Proximidade (RF005):** Mapa simulado e lista dinâmica exibindo técnicos disponíveis em um raio de distância próximo ao cliente.
- **Abertura de Chamados (RF006):** Formulário intuitivo para clientes descreverem problemas (ex: "Limpeza de PS5", "PC não liga") e anexarem informações.
- **Perfil e Portfólio (RF008):** Perfil detalhado dos técnicos, contendo avaliações, descrição e uma galeria interativa de "Antes e Depois" dos serviços prestados.
- **Chat Interno (RF009):** Canal de comunicação em tempo real entre o cliente e o técnico escolhido para combinar entrega e detalhes do serviço.

---

## 💻 Tecnologias e Arquitetura

O aplicativo foi construído utilizando as seguintes tecnologias e boas práticas:

* **Linguagem:** Dart
* **Framework:** Flutter (Mobile/Multiplataforma)
* **Gerenciamento de Estado:** `ChangeNotifier` (Provider) - *Garante a atualização reativa das telas (ex: publicação de novos chamados atualizando o painel de lances).*
* **Responsividade:** Pacote `device_preview` para garantir adaptação de interface em diversos tamanhos de tela (Smartphones e Tablets).

---

## 🎓 Contexto Acadêmico

Este projeto está sendo desenvolvido como parte prática de avaliação acadêmica no curso de **Análise e Desenvolvimento de Sistemas (ADS)** da **FATEC**. O escopo foca na implementação de interfaces gráficas, fluxo de navegação e gerenciamento de estado exigidos pela disciplina.

---

## 🚀 Como rodar o projeto localmente

Se você deseja clonar o repositório e testar o aplicativo na sua máquina, siga os passos abaixo:

### Pré-requisitos
* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado na sua máquina.
* Um emulador configurado (Android/iOS) ou um dispositivo físico conectado.

### Passo a passo

1. Clone este repositório:
   ```bash
   git clone [https://github.com/SEU-USUARIO/fixit.git](https://github.com/SEU-USUARIO/fixit.git)

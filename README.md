![Dart Version](https://img.shields.io/static/v1?label=dart&message=2.19.6&color=00579d)
![Flutter Version](https://img.shields.io/static/v1?label=flutter&message=3.7.12&color=42a5f5)
![Null Safety](https://img.shields.io/static/v1?label=null-safety&message=done&color=success)

# MCU App
Esse é um app desenvolvido em flutter/dart que exibe um perfil aleatório e que pode ser salvo localmente

## ➕ Principais bibliotecas/tecnologias utilizadas
- Gerenciamento de estado: [MobX](https://pub.dev/packages/mobx), [Flutter_mobx](https://pub.dev/packages/flutter_mobx)
- Gerenciamento de rotas: [FlutterModular](https://pub.dev/packages/flutter_modular)
- Injeção de dependências: [FlutterModular](https://pub.dev/packages/flutter_modular)
- Requisições http: [Dio](https://pub.dev/packages/dio)
- Testes: [Mocktail](https://pub.dev/packages/mocktail)
- Armazenamento local: [SharedPreferences](https://pub.dev/packages/shared_preferences)

## 📐 Arquitetura
Nesse projeto foi utilizada uma arquitetura limpa com Domain, Infra, External e Presenter

## 🌐 API
Foi utilizado uma api que gera um perfil aleatório: https://randomuser.me/

## 🔥 Build
Passo 1: [Instale o Flutter](https://docs.flutter.dev/get-started/install)
(Versão utilizada no desenvolvimento: 3.7.12)

Passo 2: Baixe ou clone este repositório usando o link abaixo:
```
https://github.com/GerlanStanley/random_user.git
```

Passo 3: Vá para a raiz do projeto e execute o seguinte comando no console para obter as dependências necessárias:
```
flutter pub get
```

Passo 4: Para executar o projeto realize o comando
```
flutter run
```

## ✅ Testes
Foram implementados testes de unidades e integração

Para executar os testes de unidade realize o comando
```
flutter test
```

Para executar os testes de integração realize o comando
```
flutter test integration_test
```

## 🖼️ Screenshots
<p float="left">
    <img src="./screenshots/1.png" width="300" style="padding: 50px" />
    <img src="./screenshots/2.png" width="300" /> 
</p>
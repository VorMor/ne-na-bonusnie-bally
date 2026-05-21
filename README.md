# Поисковик рецептов

Учебное web-приложение на Ruby on Rails для русскоязычной аудитории. Проект позволяет искать домашние рецепты по названию, категории, ингредиентам и времени приготовления.

## Возможности

- каталог опубликованных рецептов;
- поиск и фильтрация на сервере и через JSON API;
- живое обновление выдачи через Stimulus;
- страница рецепта с ингредиентами и инструкцией;
- панель администратора с CRUD для рецептов, категорий и ингредиентов;
- кастомные админ-действия: публикация и снятие рецепта с публикации;
- история поисковых запросов;
- тесты моделей, публичных страниц, API и админки.

## База данных

Используется SQLite. Основные таблицы:

- `categories` — категории рецептов;
- `recipes` — рецепты;
- `ingredients` — справочник ингредиентов;
- `recipe_ingredients` — связь рецептов и ингредиентов;
- `search_logs` — история поиска;
- `admin_users` — пользователи панели администратора.

## Запуск

```bash
bundle install
ruby bin/rails db:setup
ruby bin/rails server
```

После запуска откройте:

- сайт: `http://localhost:3000`;
- админка: `http://localhost:3000/admin`.

Тестовый администратор:

- email: `admin@example.ru`;
- пароль: `password123`.

## API

```http
GET /api/recipes?q=каша&ingredients=молоко&sort=time
GET /api/recipes/:slug
POST /api/recipes
PATCH /api/recipes/:slug
DELETE /api/recipes/:slug
```

Пример создания рецепта:

```json
{
  "recipe": {
    "title": "Омлет с сыром",
    "description": "Быстрый завтрак.",
    "instructions": "Смешать яйца, добавить сыр и приготовить на сковороде.",
    "cooking_time": 12,
    "servings": 1,
    "difficulty": "easy",
    "category_id": 1,
    "published": true
  }
}
```

## Проверка

```bash
ruby bin/rails test
```

## Деплой

Проект содержит стандартные Rails-файлы для контейнерного запуска: `Dockerfile`, `config/puma.rb`, `config/database.yml`. Для учебной проверки достаточно локального запуска через SQLite. Для production-размещения рекомендуется заменить SQLite на PostgreSQL и задать секреты окружения Rails.

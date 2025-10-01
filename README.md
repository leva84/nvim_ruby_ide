# 🚀 Neovim Ruby IDE — Конфигурация для настоящих разработчиков

> Полноценная легкая IDE-подобная конфигурация Neovim для Ruby-разработков с поддержкой LSP, Telescope, Git и всеми удобствами современного редактора.

---

## ✨ Что внутри

- **LSP** (Ruby LSP + Lua LS) — автодополнение, переход к определениям, умное переименование
- **Telescope** — мгновенный поиск файлов и grep по всему проекту
- **Spectre** — поиск и замена по всему проекту с превью изменений
- **Harpoon** — быстрые закладки для мгновенной навигации между файлами
- **nvim-tree** — файловый менеджер в стиле IDE
- **Git-интеграция** — Gitsigns (inline diff) + Fugitive (полноценный Git-клиент)
- **Treesitter** — умная подсветка синтаксиса нового поколения
- **Darcula Dark** — тема в стиле JetBrains (RubyMine)
- **render-markdown.nvim** — рендеринг Markdown прямо в Neovim
- **Чёткое разделение** локального и глобального поиска/замены
- **Which-key** — подсказки всех доступных шорткатов прямо в редакторе

---

## 📦 Требования

### Обязательно:
- **Neovim >= 0.9.0** (рекомендуется 0.10+)
- **Git**
- **Ruby** (для ruby-lsp)

### Рекомендуется (для полного функционала):
- **ripgrep** — для grep по проекту (`Space + fg`, `Space + fw`)
- **fd** — для быстрого поиска файлов (опционально)
- **Node.js** — только если нужны JS/TS LSP (для Ruby не требуется)

### ⚠️ Что будет БЕЗ рекомендуемых зависимостей:

**Без `ripgrep`:**
- ❌ `Space + fg` (grep по проекту) — не работает
- ❌ `Space + fw` (найти слово под курсором по проекту) — не работает
- ✅ Всё остальное работает (поиск файлов, LSP, навигация)

**Без `fd`:**
- ✅ Всё работает, но поиск файлов медленнее
- Telescope использует стандартный `find` вместо `fd`

**Без `Node.js`:**
- ✅ Ruby LSP работает нормально
- ❌ JS/TS LSP не будут работать (но они для Ruby и не нужны)

**Минимальная установка:** Neovim + Git + Ruby = всё работает, кроме grep по проекту

---

## 🥊 Установка: два раунда на выбор

### Раунд 1: Нокаут одной командой (для боксёров)

Если хочешь быстро и без лишних движений — вот твой апперкот:

    bash | zsh | anything <(curl -s https://raw.githubusercontent.com/leva84/nvim_ruby_ide/main/install.sh)

**Что делает:**
1. Проверяет, что Neovim установлен
2. Предлагает установить ripgrep и fd (если их нет)
3. Делает бэкап твоего текущего конфига (если он есть)
4. Клонирует репозиторий в `~/.config/nvim`
5. Устанавливает ruby-lsp
6. Готово! Запускай nvim и работай

---

### Раунд 2: Бой по очкам (для программистов)

Если любишь контроль и хочешь видеть каждый шаг:

#### Установка зависимостей

**macOS:**

    # Homebrew (если не установлен)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Neovim + зависимости
    brew install neovim ripgrep fd

**Ubuntu/Debian:**

    sudo apt update
    sudo apt install neovim ripgrep fd-find
    
    # fd на Ubuntu называется fdfind, создаём симлинк
    sudo ln -s $(which fdfind) /usr/local/bin/fd

**Fedora:**

    sudo dnf install neovim ripgrep fd-find

**Arch Linux:**

    sudo pacman -S neovim ripgrep fd

#### Установка конфига

    # Бэкап старого конфига (если есть)
    mv ~/.config/nvim ~/.config/nvim.backup
    
    # Клонируй репозиторий
    git clone https://github.com/leva84/nvim_ruby_ide.git ~/.config/nvim
    
    # Запусти Neovim (плагины установятся автоматически)
    nvim
    
    # Установи Ruby LSP
    gem install ruby-lsp

---

## ⌨️ Шпаргалка по шорткатам

### Общие действия

| Команда | Действие |
|---------|----------|
| jj | Выход в Normal mode (работает в Insert/Visual/Command/Terminal) |
| Space + w | Сохранить файл |
| Space + q | Выйти |
| Space + wq | Сохранить и выйти |
| Space + Q | Выйти без сохранения (принудительно) |

---

### Локальный поиск и замена (текущий файл)

| Команда | Действие |
|---------|----------|
| Space + / | Поиск в текущем файле (Telescope fuzzy) |
| Space + Space | Очистить подсветку поиска |
| /pattern | Стандартный Vim-поиск |
| n / N | Следующее/предыдущее совпадение |
| * / # | Найти слово под курсором (вперёд/назад) |
| Space + r | Замена в текущем файле (:%s/) |
| Space + rc | Замена слова под курсором с подтверждением |

**Ручная замена:**

    :%s/old/new/g     # Заменить все вхождения
    :%s/old/new/gc    # Заменить с подтверждением

---

### Глобальный поиск и замена (весь проект)

| Команда | Действие |
|---------|----------|
| Space + ff | Найти файл (Telescope) |
| Space + fg | Grep по всему проекту (Telescope) |
| Space + fw | Найти слово под курсором (весь проект) |
| Space + fb | Список открытых буферов |
| Space + fr | Недавние файлы |
| Space + fh | Поиск в помощи Neovim |
| Space + S | Spectre — замена по проекту с превью |
| Space + rp | Замена слова под курсором (весь проект) |

---

### LSP навигация (умная работа с кодом)

| Команда | Действие |
|---------|----------|
| gd | Перейти к определению |
| gD | Перейти к объявлению |
| gi | Перейти к реализации |
| gr | Найти все использования |
| K | Показать документацию |
| Space + rn | Переименовать через LSP (умное переименование по всему проекту) |
| Space + ca | Code Action (быстрые исправления) |
| [d | Предыдущая ошибка/предупреждение |
| ]d | Следующая ошибка/предупреждение |

---

### Markdown preview

| Команда | Действие |
|---------|----------|
| Space + mo | Включить рендеринг Markdown |
| Space + mc | Выключить рендеринг Markdown |
| Space + mt | Переключить рендеринг Markdown |

Рендеринг происходит прямо в Neovim — видишь красиво оформленный Markdown без браузера.

---

### Harpoon (быстрые закладки)

| Команда | Действие |
|---------|----------|
| Space + a | Добавить текущий файл в Harpoon |
| Ctrl + e | Открыть меню Harpoon |
| Space + 1 | Мгновенно перейти к файлу 1 |
| Space + 2 | Мгновенно перейти к файлу 2 |
| Space + 3 | Мгновенно перейти к файлу 3 |
| Space + 4 | Мгновенно перейти к файлу 4 |

**Как использовать:**
1. Открой важный файл
2. Нажми Space + a (добавит в слот 1)
3. Открой другой файл
4. Нажми Space + a (добавит в слот 2)
5. Теперь Space + 1 = первый файл, Space + 2 = второй файл

---

### Файловое дерево (nvim-tree)

| Команда | Действие |
|---------|----------|
| Space + e | Открыть/закрыть файловое дерево |
| Space + ef | Найти текущий файл в дереве |

**Внутри nvim-tree:**
- Enter — открыть файл/папку
- a — создать файл
- d — удалить
- r — переименовать
- x — вырезать
- c — копировать
- p — вставить

---

### Навигация между окнами

| Команда | Действие |
|---------|----------|
| Ctrl + h | Окно влево |
| Ctrl + j | Окно вниз |
| Ctrl + k | Окно вверх |
| Ctrl + l | Окно вправо |
| Ctrl + ↑/↓/←/→ | Изменить размер окна |

---

### Буферы

| Команда | Действие |
|---------|----------|
| Tab | Следующий буфер |
| Shift + Tab | Предыдущий буфер |
| Space + bd | Закрыть текущий буфер |

---

### Git

| Команда | Действие |
|---------|----------|
| Space + gs | Git status |
| Space + gc | Git commit |
| Space + gp | Git push |
| Space + gl | Git pull |

---

### Редактирование

| Команда | Действие |
|---------|----------|
| gcc | Закомментировать/раскомментировать строку |
| gc (Visual mode) | Закомментировать выделение |
| ⌥/Alt + j | Переместить строку вниз (⌥ на Mac, Alt на Linux/Windows) |
| ⌥/Alt + k | Переместить строку вверх |
| ⌥/Alt + j/k (Visual) | Переместить выделение вверх/вниз |
| p (Visual mode) | Вставить без замены регистра |

---

### Leap (быстрая навигация прыжками)

| Команда | Действие |
|---------|----------|
| s + 2 символа | Прыгнуть к символам (вперёд) |
| S + 2 символа | Прыгнуть к символам (назад) |

**Пример:** нажми s, затем de — курсор прыгнет к ближайшему de в файле.

---

## 🌲 Структура проекта

    nvim_ruby_ide/
    ├── init.lua                      # Главный конфиг (плагины, LSP, темы)
    ├── install.sh                    # Скрипт автоустановки
    ├── LICENSE                       # MIT лицензия
    ├── README.md                     # Документация
    └── lua/
        ├── keymaps.lua               # Все шорткаты (Space + w, Space + ff и т.д.)
        └── jetbrains_ruby_theme.lua  # Тема Darcula Dark

**Где что находится:**
- **`init.lua`** — тут настраиваются все плагины, LSP, Treesitter, темы
- **`lua/keymaps.lua`** — тут все шорткаты (все команды на Space + что-то)
- **`lua/jetbrains_ruby_theme.lua`** — тема в стиле JetBrains RubyMine

---

## 🔧 Кастомизация

### Изменить тему

**Файл:** `~/.config/nvim/init.lua` (строки ~115-120)

    -- Darcula Dark (текущая тема)
    require('jetbrains_ruby_theme')
    vim.cmd.colorscheme('darcula-dark')

Чтобы сменить на другую тему (например, Tokyonight):

1. Добавь плагин в секцию плагинов (строка ~20-30 в `init.lua`):

       { "folke/tokyonight.nvim" }

2. Замени тему (строки ~115-120):

       require("tokyonight").setup()
       vim.cmd.colorscheme("tokyonight-night")

3. Перезапусти Neovim

---

### Добавить свои шорткаты

**Файл:** `~/.config/nvim/lua/keymaps.lua`

Добавь в конец файла:

    -- Мой кастомный шорткат
    vim.keymap.set('n', '<leader>x', ':YourCommand<CR>', { desc = 'Описание команды' })

**Разбор:**
- `'n'` — режим (n = Normal, i = Insert, v = Visual)
- `'<leader>x'` — комбинация (leader = Space, поэтому это Space + x)
- `':YourCommand<CR>'` — команда, которую выполнит Neovim
- `{ desc = 'Описание' }` — **это важно!** Описание появится в меню Which-key при нажатии Space

**Пример:**

    vim.keymap.set('n', '<leader>tt', ':terminal<CR>', { desc = 'Открыть терминал' })

Теперь при нажатии Space увидишь:
```
    Space + tt → Открыть терминал
```

---

### Изменить Leader Key

**Файл:** `~/.config/nvim/init.lua` (строка ~123)

По умолчанию Leader = Space. Для изменения:

    vim.g.mapleader = ','  -- Теперь все Space + x станут , + x

---

### Настроить LSP

**Файл:** `~/.config/nvim/init.lua` (строки ~400-450)

Секция LSP настройки:

    require('lspconfig').ruby_lsp.setup {}
    require('lspconfig').lua_ls.setup {}

Чтобы добавить новый LSP (например, для Python):

    require('lspconfig').pyright.setup {}

Список всех LSP: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

---

## 🎯 Разница между локальным и глобальным поиском/заменой

### Локальный (текущий файл):
- **Space + /** → поиск в текущем файле
- **Space + r** → замена в текущем файле
- **Space + rc** → замена слова под курсором в текущем файле

### Глобальный (весь проект):
- **Space + fg** → поиск по всему проекту (grep через ripgrep)
- **Space + S** → замена по всему проекту (Spectre с превью)
- **Space + rp** → замена слова под курсором по всему проекту
- **Space + rn** → умное переименование через LSP (учитывает контекст кода)

---

## 🐛 Частые проблемы и решения

### LSP не работает

    # Проверь, установлен ли ruby-lsp
    gem list | grep ruby-lsp
    
    # Если нет — установи
    gem install ruby-lsp

### Telescope grep не работает

    # Установи ripgrep
    brew install ripgrep           # macOS
    sudo apt install ripgrep       # Ubuntu
    sudo dnf install ripgrep       # Fedora
    sudo pacman -S ripgrep         # Arch

### Telescope find_files работает медленно

    # Установи fd
    brew install fd                # macOS
    sudo apt install fd-find       # Ubuntu
    sudo dnf install fd-find       # Fedora
    sudo pacman -S fd              # Arch

### Предупреждения про lspconfig deprecated

Они игнорируются автоматически конфигом (строки 7-14 в `init.lua`). Если всё равно мешают, можешь закомментировать эти строки.

### Плагины не устанавливаются

    # Удали кеш Lazy.nvim и попробуй снова
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
    nvim

---

---

## 🚀 Планы развития

Проект активно развивается! Вот что планируется в ближайшем будущем:

### 📦 Разные версии по весу (ветки)

Планируется создать несколько веток под разные сценарии использования:

- **minimal** — минимальная конфигурация (для слабых машин, VPS, серверов)
  - Только базовый LSP, навигация, Git
  - Без тяжёлых плагинов (Telescope минимальный, без Treesitter)
  - Размер: ~30-50 МБ

- **main** — стабильная версия (текущая, рекомендуется)
  - Полный набор для Ruby-разработки
  - Все основные плагины, LSP, Git, Telescope, Harpoon

- **advanced** — расширенная версия (больше плагинов)
  - Дополнительные плагины (debug, тестирование, БД-интеграции)
  - AI-помощники (Copilot, ChatGPT)
  - Расширенная Git-интеграция (git-worktree, diffview)

- **lua-dev** — версия для Lua-разработки
  - Настроенный Lua LSP
  - Отладка Lua-скриптов
  - Плагины для разработки Neovim-плагинов

- **web-dev** — версия для веб-разработки
  - LSP для JS/TS, HTML, CSS
  - Интеграция с ESLint, Prettier
  - Live server для фронтенда

**Переключение между ветками:**

    cd ~/.config/nvim
    git fetch --all
    git checkout minimal    # Переключиться на минимальную версию
    git checkout main       # Вернуться к основной

---

### 🎨 Несколько цветовых тем

Сейчас доступна только Darcula Dark. В планах добавить:

- **Tokyonight** (тёмная/светлая)
- **Gruvbox** (классика Vim)
- **Catppuccin** (мягкая пастельная)
- **Nord** (холодная минималистичная)
- **Solarized** (тёмная/светлая)
- **Monokai Pro**

**Переключение тем через команду:**

    :Colorscheme tokyonight    # Переключиться на Tokyonight
    :Colorscheme gruvbox       # Переключиться на Gruvbox

Или через меню Which-key: **Space + ct** (change theme)

---

### ⚙️ Конфигурация через YAML + панель настроек

Сейчас настройки разбросаны по `init.lua` и `keymaps.lua`. Планируется:

**Вариант 1: YAML-конфиг**

Создать файл `~/.config/nvim/config.yml`:

```
theme: darcula-dark
leader_key: space 
font_size: 14
plugins: 
  telescope: true
  harpoon: true
  git: true
lsp:
	• ruby
	• lua
	• python  # Опционально
keymaps: 
  save_file: “w”
  find_file: “ff”
```


Neovim будет читать этот файл и автоматически применять настройки.

**Вариант 2: Панель настроек (UI)**

Команда `:Settings` откроет интерактивное меню:

```
┌─────────────────────────────────┐ 
│ ⚙️  Настройки Neovim Ruby IDE   │ 
├─────────────────────────────────┤ 
│ Тема:          Darcula Dark ▼ │ │ 
│ Leader Key:    Space        ▼ │ │ 
│ Размер шрифта: 14           ▼ │ │ 
│                                 │ 
│ Плагины:                        │ 
│                                 │ 
│ ☑ Telescope                     │ 
│                                 │ 
│ ☑ Harpoon                       │ 
│                                 │ 
│ ☑ Git integration               │ 
│                                 │ 
│ ☐ AI Copilot (отключён)         │ 
│                                 │ 
│                                 │ 
│                                 │ 
│ Сохранить Отмена Сброс          │ 
│                                 │ 
└─────────────────────────────────┘ 
```

Изменения сохраняются в `config.yml` и применяются мгновенно.

---

### 🖥️ Интеграция с терминалами

Планируется оптимизация под разные терминалы:

**macOS:**
- **iTerm2** — полная поддержка (true colors, кастомные шорткаты)
- **Terminal.app** — базовая поддержка
- **Alacritty** — рекомендуемый (GPU-ускорение)
- **Kitty** — альтернатива Alacritty

**Linux:**
- **Alacritty** (рекомендуется)
- **Kitty**
- **GNOME Terminal**
- **Konsole** (KDE)
- **Terminator**

**Windows (WSL):**
- **Windows Terminal** (рекомендуется)
- **Alacritty**

**Что будет настроено:**
- Автоопределение терминала и оптимизация шорткатов
- Правильная работа Option/Alt в разных терминалах
- True color поддержка для всех тем
- Кастомные настройки для каждого терминала

---

### 📅 Роадмап

- **Q4 2025:**
  - Ветка `minimal` (облегчённая версия)
  - Добавление 3-4 цветовых тем
  - Улучшение документации

- **Q1 2026:**
  - Конфигурация через YAML
  - Ветка `advanced` с AI-интеграциями
  - Поддержка Docker-разработки

- **Q2 2026:**
  - Панель настроек (UI)
  - Ветки `lua-dev` и `web-dev`
  - Полная интеграция с популярными терминалами

---

### 🤝 Как помочь проекту

- 🐛 Найди баг — открой [Issue](https://github.com/leva84/nvim_ruby_ide/issues)
- 💡 Есть идея — предложи в [Discussions](https://github.com/leva84/nvim_ruby_ide/discussions)
- 🔧 Хочешь добавить фичу — сделай Pull Request
- ⭐ Нравится проект — поставь звезду на GitHub!

---

## 📖 Полезные ссылки

- [Документация Neovim](https://neovim.io/doc/)
- [Lazy.nvim (менеджер плагинов)](https://github.com/folke/lazy.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Ruby LSP](https://github.com/Shopify/ruby-lsp)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

---

## 📄 Лицензия

MIT License — делай что хочешь, форкай, модифицируй, используй в коммерческих проектах.

---

## 🤝 Вклад в проект

Pull requests приветствуются! Для больших изменений сначала открой Issue для обсуждения.

---

## 📧 Контакты и поддержка

Проблемы? Вопросы? Открывай [Issue](https://github.com/leva84/nvim_ruby_ide/issues).

---

**Наслаждайся мощным Neovim! Теперь ты кодишь как чемпион.** 🥊🚀


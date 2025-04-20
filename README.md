## libras

lib/
├── core/
│   ├── constants/
│   ├── utils/
│   └── database/        # SQLite-specific implementation
│       ├── app_database.dart
│       └── dao/         # Data Access Objects
├── data/
│   ├── models/          # SQLite table models
│   └── repositories/    # SQLite repository implementations
├── domain/
│   ├── entities/
│   └── repositories/    # Abstract repository contracts
└── presentation/
    ├── viewmodels/
    ├── views/
    └── widgets/
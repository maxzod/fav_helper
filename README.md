# fav_helper

A new Flutter package project.

## Getting Started

### installation

```yaml
dependencies:
  fab_helper:
    git: git@github.com:maxzod/fav_helper.git
```

### usage

```dart
/// call boot before run app

Future<void> main() async {
  await FavHelper.boot();
  runApp(MyApp());
}

```

```dart
// to add or remove item from the favorites
FavHelper.toggle('products','5')

// check if item is in favorites

FavHelper.isFav('products','5')
```

```dart

FavWidget(
   itemKey:'products',
   id:'5',
    builder: (BuildContext context, bool isFav) => InkWell(
      child: Text(isFav.toString()),
      onTap:()=>FavHelper.toggle('products','5'),
   )
)

```

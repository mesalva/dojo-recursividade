# Problemas de recursividade

Neste exercício solucionaremos 2 problemas de recursividade, um em javascript, outro em Ruby

## Problema 1

Dado um objeto complexto, com diversos a possibilidade de ter diversos "imports" em diferentes
níveis deste objeto, como no exemplo abaixo:

```json
{
  "children": [
    {
      "import": "some-import-1",
      "object": {
        "import": "some-import-2",
        "children": [
          {
            "import": "some-import-3"
          }
        ]
      }
    }
  ]
}
```

Crie uma função "extractImports" que receba esse objeto e retorne um array com todos os imports utilizados. 


## Problema 2

Dado um objeto complexo, que pode conter QUALQUER string com variáveis a serem interpoladas, como o objeto abaixo:
```ruby
object = {
  "name": "%{var_1}",
  "any_object": {
    "any_array": [
      {
        "value": "%{var_2}"
      },
      "mesalva.com/%{var_3}"
    ]
  }
}
```

Crie uma classe que receba este objeto no seu construtor e que possua um método "replace" que receba as variáveis a serem interpoladas.

Sendo assim o resultado para:

```ruby
RecursiveReplace.new(object).replace(var_1: 10, var_2: 20, var_3: 30)
```

deve ser:
```ruby
{
  "name": "10",
  "any_object": {
    "any_array": [
      {
        "value": "20"
      },
      "mesalva.com/30"
    ]
  }
}
```

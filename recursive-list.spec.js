import { extractImports } from './recursive-list';

describe('RecursiveList', () => {
  test('simple', () => {
    expect(extractImports({ "import": "some-import" })).toEqual(["some-import"]);
  });

  test('inside children', () => {
    expect(extractImports({
      "children": [
        { "import": "some-import" }
      ]
    })).toEqual(["some-import"]);
  });

  test('complex', () => {
    expect(extractImports({
      "children": [
        { "object": {
            "import": "some-import"
          } }
      ]
    })).toEqual(["some-import"]);
  });

  test('complex with multiple imports', () => {
    expect(extractImports({
      "children": [
        {
          "import": "some-import-1",
          "object": {
            "import": "some-import-2",
            "children": [
              { "import": "some-import-3" }
            ]
          } }
      ]
    })).toEqual(["some-import-1", "some-import-2", "some-import-3"]);
  });
});

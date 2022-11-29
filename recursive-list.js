export function extractImports (input) {
  let imports = []

  Object.entries(input).forEach(([key, value]) => {
      if (key === "import") {
        imports.push(value)
      } else if (Array.isArray(value)) {

        value.forEach((row) => {
          const imports_from_array = extractImports(row)
          imports = [...imports, ...imports_from_array]
        })
      } else if (typeof (value) == "object") {
        const imports_from_object = extractImports(value)
        imports = [...imports, ...imports_from_object]
      }
    }
  )

  return imports
}

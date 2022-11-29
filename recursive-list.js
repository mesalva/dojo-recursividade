export const extractImports = (children, list = []) => {
  if (children === null) return list
  Object.entries(children).forEach(([key, value]) => {
    if (key === 'import') {
      list.push(value)
    } else if (key === 'bucket' && typeof value === 'object') {
      list.push(`pages/common/${value.pathname}`)
    } else if (typeof value === 'object') {
      extractImports(value, list)
    }
  })
  return list
}

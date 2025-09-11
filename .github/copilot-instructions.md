# Project general coding guidelines

## Code Style
- Use semantic HTML5 elements (header, main, section, article, etc.)
- Prefer modern JavaScript (ES6+) features like const/let, arrow functions, and template literals
- When create terraform templates, group related resources into modules, and use variables and outputs to pass data between modules
- folder structure:
azure-infra-template/
  modules/
    <feature-or-resource>/
      main.tf
      variables.tf
      outputs.tf
      README.md
  environments/
    dev/
      main.tf
      variables.tf
    prod/
      main.tf
      variables.tf
  scripts/
    <helper-scripts>.sh
  .github/
    copilot-instructions.md
  README.md


## Naming Conventions
- Use PascalCase for component names, interfaces, and type aliases
- Use camelCase for variables, functions, and methods
- Prefix private class members with underscore (_)
- Use ALL_CAPS for constants

## Code Quality
- Use meaningful variable and function names that clearly describe their purpose
- Include helpful comments for complex logic
- Add error handling for user inputs and API calls

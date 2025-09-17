## Repo Structure
terraform-generator/
├── modules/                    # Standard reusable Terraform modules (HCL)
│   ├── data_lake/
│   │   └── main.tf
│   ├── rbac/
│   │   └── main.tf
│   └── policies/
│       └── main.tf
├── templates/                  # Auto-generated Jinja2 templates (from modules)
│   ├── data_lake/
│   │   └── main.tf.j2
│   ├── rbac/
│   │   └── main.tf.j2
│   └── policies/
│       └── main.tf.j2
├── generated/                  # Output Terraform for specific projects
│   └── project1.tf
├── generator/                  # Python scripts to generate templates / Terraform
│   ├── generate.py             # Main generator (checklist → project1.tf)
│   └── module_to_j2.py         # Script to convert modules/*.tf → templates/*.j2
├── checklist.json              # Project-specific input
└── README.md

## Key Points

modules/ → keep your standard reusable modules (HCL) untouched.

templates/ → store the Jinja2 templates generated from the modules. Your generator reads from here.

generator/module_to_j2.py → the script we wrote that converts standard modules into .j2.

generator/generate.py → your existing generator that reads .j2 + checklist → generated/project1.tf.
import os, re
from utils import is_unquoted  # Import helper function

MODULES_DIR = "../modules"
TEMPLATES_DIR = "../templates"

# Regex to detect Terraform variables
VAR_REGEX = re.compile(r'var\.([a-zA-Z0-9_]+)')

for root, dirs, files in os.walk(MODULES_DIR):
    # Skip folders without main.tf
    if "main.tf" not in files:
        continue

    # Preserve subfolder structure
    module_name = os.path.relpath(root, MODULES_DIR)
    module_path = os.path.join(root, "main.tf")

    output_dir = os.path.join(TEMPLATES_DIR, module_name)
    os.makedirs(output_dir, exist_ok=True)
    output_j2 = os.path.join(output_dir, "main.tf.j2")

    with open(module_path) as f:
        content = f.read()

    # Find all var.* references
    tf_vars = set(VAR_REGEX.findall(content))

    for var in tf_vars:
        # Try to detect the default value in the file (if present)
        pattern = re.compile(rf'{var}\s*=\s*(.+)')
        match = pattern.search(content)
        if match:
            value = match.group(1)
            if is_unquoted(value):
                j2_var = f"{{{{ {var} }}}}"  # no quotes
            else:
                j2_var = f'"{{{{ {var} }}}}"'  # wrap in quotes
        else:
            # default to quoted if we can't detect
            j2_var = f'"{{{{ {var} }}}}"'

        content = re.sub(rf'var\.{var}\b', j2_var, content)

    # Dynamically set the resource name for azurerm_storage_account
    content = re.sub(
        r'(resource\s+"azurerm_storage_account"\s+)"[^"]+"',
        r'\1"{{ name }}"',
        content
    )

    # Write output
    with open(output_j2, "w") as f:
        f.write(content)

    print(f"Generated template: {output_j2}")

import os, re

MODULES_DIR = "../modules"
TEMPLATES_DIR = "../templates"

for module_name in os.listdir(MODULES_DIR):
    module_path = os.path.join(MODULES_DIR, module_name, "main.tf")
    if not os.path.isfile(module_path):
        continue

    output_dir = os.path.join(TEMPLATES_DIR, module_name)
    os.makedirs(output_dir, exist_ok=True)
    output_j2 = os.path.join(output_dir, "main.tf.j2")

    with open(module_path) as f:
        content = f.read()

    # Convert var.* to {{ * }}
    content_j2 = re.sub(r'var\.([a-zA-Z0-9_]+)', r'{{ \1 }}', content)

    with open(output_j2, "w") as f:
        f.write(content_j2)

    print(f"Generated template: {output_j2}")

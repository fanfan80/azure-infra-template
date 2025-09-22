import os
import json
from jinja2 import Environment, FileSystemLoader

# ----------------------------
# Paths
# ----------------------------
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATES_PATH = os.path.join(BASE_DIR, "../templates")
GENERATED_PATH = os.path.join(BASE_DIR, "../generated")

# Ensure generated folder exists
os.makedirs(GENERATED_PATH, exist_ok=True)

# ----------------------------
# Load checklist
# ----------------------------
with open(os.path.join(BASE_DIR, "../checklist.json")) as f:
    checklist = json.load(f)

# ----------------------------
# Setup Jinja2 environment
# ----------------------------
env = Environment(loader=FileSystemLoader(TEMPLATES_PATH))

# ----------------------------
# Collect rendered Terraform blocks
# ----------------------------
rendered_blocks = []

# Loop through all modules in templates folder
for root, dirs, files in os.walk(TEMPLATES_PATH):
    template_file = None
    module_name = os.path.basename(root)

    if "main.tf.j2" in files:
        template_file = os.path.join(root, "main.tf.j2")
        print(f"Found template: {template_file}, module: {module_name}")

    
    # Determine checklist key (folder name or plural)
    checklist_key = module_name if module_name in checklist else f"{module_name}s"
    
    if checklist_key not in checklist:
        continue

    # Load Jinja2 template
    template = env.get_template(f"{module_name}/main.tf.j2")

    print(f"Loaded template: {module_name}/main.tf.j2")

    # Render blocks for each item in checklist
    for item in checklist[checklist_key]:
        # Render the template with variables from checklist item
        block = template.render(**item)

        # Add to the list of rendered blocks
        rendered_blocks.append(block)

# ----------------------------
# Combine all blocks into a single Terraform file
# ----------------------------
final_template = "\n\n".join(rendered_blocks)

# Write final Terraform file
output_file = os.path.join(GENERATED_PATH, "project1.tf")
with open(output_file, "w") as f:
    f.write(final_template)

print(f"Terraform template generated: {output_file}")

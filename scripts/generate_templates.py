import os
import json
from jinja2 import Environment, FileSystemLoader

# Set up Jinja2 environment
TEMPLATE_DIR = os.path.join(os.path.dirname(__file__), '../jinja2-templates')
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), '../environments/dev')  # Change as needed
CHECKLIST_PATH = os.path.join(os.path.dirname(__file__), '../checklist.json')

def render_template(template_name, context, output_path):
    env = Environment(loader=FileSystemLoader(TEMPLATE_DIR))
    template = env.get_template(template_name)
    output = template.render(context)
    with open(output_path, 'w') as f:
        f.write(output)

def load_checklist(path):
    with open(path, 'r') as f:
        return json.load(f)

if __name__ == "__main__":
    # Load checklist as context
    context = load_checklist(CHECKLIST_PATH)
    # Render main.tf.j2 to main.tf
    render_template('main.tf.j2', context, os.path.join(OUTPUT_DIR, 'main.tf'))
    # Add more templates as needed
    print("Templates generated successfully using checklist.")

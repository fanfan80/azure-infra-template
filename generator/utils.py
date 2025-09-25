# generator/utils.py

def dict_to_hcl(d: dict) -> str:
    """
    Convert a Python dict to Terraform HCL-style string.
    Example: {"env": "dev", "owner": "team-a"} -> { env = "dev", owner = "team-a" }
    Supports nested dicts and lists.
    """
    items = []
    for k, v in d.items():
        if isinstance(v, dict):
            v_str = dict_to_hcl(v)
        elif isinstance(v, list):
            v_str = "[" + ", ".join(f'"{i}"' for i in v) + "]"
        else:
            v_str = f'"{v}"'
        items.append(f'{k} = {v_str}')
    return "{ " + ", ".join(items) + " }"

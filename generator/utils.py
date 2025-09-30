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

def is_unquoted(value: str) -> bool:
    """
    Determine if a Terraform value should NOT be quoted in Jinja2.

    Returns True if value is boolean (true/false) or numeric.
    """
    value = value.strip().lower()
    if value in {"true", "false"}:
        return True
    try:
        float(value)
        return True
    except ValueError:
        return False

if __name__ == "__main__":
    # Simple test
    test_dict = {
        "env": "dev",
        "owner": "team-a",
        "tags": {
            "project": "example",
            "cost_center": "12345"
        },
        "numbers": [1, 2, 3]
    }
    print(dict_to_hcl(test_dict))
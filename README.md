# NixOS Configuration — `mango-only` Branch

This branch contains a specialized, modular NixOS and Home Manager configuration focused on the **MangoWM / DankMaterialShell (DMS)** desktop environment sandbox. 

## 📌 Branch Overview

The `mango-only` branch isolates configuration files related to the window manager layout, custom desktop scripting, and integrated application modules (like `ghostty` and `fish`) without bleeding into the main system branch.

.
├── home/
│   ├── dms.nix          # DMS-specific configurations
│   ├── fish.nix         # Fish shell aliases and functions
│   ├── ghostty.nix      # Ghostty terminal styling and behavior
│   ├── mango.nix        # Main window manager settings & keybind layers
│   └── ...
└── modules/             # System and hardware-level Nix definitions


---

## 🛠️ Key Components

*   **Window Manager (`mango.nix`):** Manages compositor rules, window rules, layer rules, and core UI spacing.
*   **Terminal (`ghostty.nix`):** Handles native terminal options and integration hooks.
*   **Shell (`fish.nix` & `packages.nix`):** Splits user-space packages and interactive environment shell configs.

---

## ⚠️ Important Configuration Notes

### Hybrid vs. Pure Nix Keybinds
This branch is currently transitioning from a **Hybrid Setup** to a **Pure Nix Setup** regarding hotkey management:

*   **Current State (Hybrid):** Keybinds are primarily managed imperatively by DMS via `~/.config/mango/dms/binds.conf`. 
*   **The Duplicate Window Trap:** Be careful not to define `spawn` hooks (like opening a terminal) simultaneously in `home/mango.nix` and `binds.conf`. Declaring identical bindings in both places will result in multiple instances launching on a single keystroke.
*   **Future Goal (Pure Nix):** Port all structural keybinds into a modular Nix layout (e.g., a dedicated `binds.nix` or split into respective component files) to lock down `~/.config/mango/dms/binds.conf` immutably using Home Manager.

---

## 🚀 Deployment

To test or apply this specific configuration branch on your system:

1. Ensure you are on the correct branch:
   ```bash
   git checkout mango-only

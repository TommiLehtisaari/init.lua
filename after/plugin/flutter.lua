require("flutter-tools").setup {
    debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true -- use dap instead of a plenary job to run flutter apps
    },
}

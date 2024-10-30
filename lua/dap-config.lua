local dap = require("dap")

-- Configure nvim-dap for Python
dap.adapters.python = {
    type = "executable",
    command = "poetry",
    args = { "run", "python", "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${workspaceFolder}/manage.py",
        console = "integratedTerminal",
        justMyCode = false,
        args = {
            'runserver', '--noreload'
        };
        django = true;
        pythonPath = function()
            return vim.fn.trim(vim.fn.system("poetry run which python"))
        end,
        env = {
            DJANGO_SETTINGS_MODULE="project.settings.local";
            PYTHONPATH = "${workspaceFolder}";
        }
    },
}


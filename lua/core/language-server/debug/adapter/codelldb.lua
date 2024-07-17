return {
    type = 'server',
    port = "${port}",
    name = 'codelldb',
    executable = {
        -- CHANGE THIS to your path!
        command = os.getenv('HOME')..'/.local/share/nvim/mason/bin/codelldb',
        args = {"--port", "${port}"},
        -- On windows you may have to uncomment this:
        -- detached = false
    }
}

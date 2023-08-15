local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
		local jdtls = require("jdtls")
		local extendedClientCapabilities = jdtls.extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(),':p:h:t')
		local config = {
			filetypes = { "java" },
			capabilities = capabilities,
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx4g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				"C:/Users/jinxin/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
				"-configuration",
				"C:/Users/jinxin/AppData/Local/nvim-data/mason/packages/jdtls/config_win",
				"-data",
				"C:/Users/jinxin/.cache/jdtls/workspace" .. project_name,
			},
			init_options = {
				--jvm_args = {},
				--workspace = "/Users/jinxin/.cache/jdtls/workspace"
			},
			settings = {
				java = {
					project = {
						referencedLibraries = {},
						sourcePaths = {'src/main/java'}
					},
					import = {
						maven = {
							 enabled = true
						 }
					},
					-- jdt = {
					--   ls = {
					--     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx2G -Xms100m -javaagent:/Users/jinxin/.local/share/nvim/mason/packages/jdtls/lombok.jar"
					--   }
					-- },
					eclipse = {
						downloadSources = true,
					},
					configuration = {
						updateBuildConfiguration = "interactive",
						runtimes = {
							{
								name = "JavaSE-1.8",
								path = "C:\\Program Files\\Java\\jdk-1.8"
							},
							{
								name = "JavaSE-11",
								path = "C:\\Program Files\\Java\\jdk-11.0.16.1"
							},
							{
								name = "JavaSE-17",
								path = "C:\\Program Files\\Java\\jdk-17.0.7"
							}
						},
					},
					maven = {
						downloadSources = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					format = {
						enabled = true,
						-- settings = {
						--   profile = "asdf"
						-- }
					},
				},
				signatureHelp = { enabled = true },
				completion = {
					favoriteStaticMembers = {
						"org.hamcrest.MatcherAssert.assertThat",
						"org.hamcrest.Matchers.*",
						"org.hamcrest.CoreMatchers.*",
						"org.junit.jupiter.api.Assertions.*",
						"java.util.Objects.requireNonNull",
						"java.util.Objects.requireNonNullElse",
						"org.mockito.Mockito.*",
					},
				},
				contentProvider = { preferred = "fernflower" },
				extendedClientCapabilities = extendedClientCapabilities,
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
				codeAction = {
					sortMembers = {
						avoidVolatileChanges = true
					}
				},
				codeGeneration = {
					toString = {
						template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
					},
					useBlocks = true,
				},
			},
		}
		local custom_jdtls_setup = require("custom.configs.jdtls_setup")
		config = custom_jdtls_setup.start_or_attach(config)
		lspconfig.jdtls.setup(config)


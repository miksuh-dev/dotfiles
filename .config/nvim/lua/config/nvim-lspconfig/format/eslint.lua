return {
  -- Cache?
  -- lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT} --cache', CACHee
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT} --cache',
  -- lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

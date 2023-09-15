-- this is my first attempt to write Lua!
--
-- I have tried to configure vim over the years mostly by copy-pasting other people's code.
-- This time I want to do it on my own based on my pragmatic working requirements.
-- And I want to use Lua for everything (as much as possible).
--
-- So let's see how it goes.
--
-- Things will be across various Lua modules. And this file will be mostly dealing with
-- importing all those modules.

require("ui")
require("plugins")
require("keys")
require("vars")

-- only for neovide
require("ui/neovide")

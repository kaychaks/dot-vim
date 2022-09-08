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

require "plugins"
require "keys"
require "ui/common"
require "ui"
require "vars"
require "opts"

-- lang settings
require "lang/common"
require "lang/rust"

-- other
require "tabs"
require "ui/filetree"

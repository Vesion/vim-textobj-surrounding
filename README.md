vim-textobj-surrounding
=================

A vim text object plugin for common surroundings based on vim-textobj-user([https://github.com/kana/vim-textobj-user](https://github.com/kana/vim-textobj-user)).

Including (), {}, [], <>, ' ', " ", \` \`

Support nesting and multi-lines.

Usage
-----
Select 'all' mapping `aj`, for the nearest former-surrounding to its matching part, including the surrouding itself.

Select 'in' mapping `ij`, for the nearest former-surrounding to its matching inside.


Examples
------------
* vij	
	'`hello surrounding`'
	
* vaj	
	"this is `[a bracket]` in quotes"
	
* vij	
	{
	
	`I am a line`
		
    }

Installation
------------
I recommend installing it via vundle ([https://github.com/gmarik/vundle](https://github.com/gmarik/vundle)):

    Plugin 'Vesion/vim-textobj-surrounding'

All DCFEB related firmware
================================================================
Official firmware for the Digital Cathode Front-End boards
(DCFEB, xDCFEB, DCFEBs with VTTX modification, and  GBT Stand-Alone test firmware for xDCFEBs)
Each project has its own GIT repository and versions are tracked in those
individual repositories.
Version scheme is as follows:
Project/Board	Version (count in hex)
dcfeb3a			[3-5].xx 
xdcfeb3b		[6-9].xx
dcfeb3a_vttx	[a-b].xx
GBT_sa_test		xx

Important Note:
In order to track files in project directories that are themselves GIT repositories,
it is necessary to rename the .git/HEAD files in each of the projects before any
GIT related commands are executed on the upper repository.
After committing the "HEAD" files in each project should be rnamaed back to their original
name so that the project repositories can be used.
 
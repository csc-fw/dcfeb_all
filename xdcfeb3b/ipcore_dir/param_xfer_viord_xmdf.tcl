# The package naming convention is <core_name>_xmdf
package provide param_xfer_viord_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::param_xfer_viord_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::param_xfer_viord_xmdf::xmdfInit { instance } {
# Variable containing name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name param_xfer_viord
}
# ::param_xfer_viord_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::param_xfer_viord_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.asy
utilities_xmdf::xmdfSetData $instance FileSet $fcount type asy
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.cdc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.constraints/param_xfer_viord.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ucf
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.ncf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ncf
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.constraints/param_xfer_viord.xdc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Xdc
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path param_xfer_viord_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module param_xfer_viord
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams


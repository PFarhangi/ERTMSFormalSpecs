package org.openetcs.es3f.importer;

import org.eclipse.emf.ecp.core.ECPProject;
import org.openetcs.model.ertmsformalspecs.*;
import org.openetcs.model.ertmsformalspecs.behaviour.*;
import org.openetcs.model.ertmsformalspecs.customization.*;
import org.openetcs.model.ertmsformalspecs.requirements.*;
import org.openetcs.model.ertmsformalspecs.requirements.messages.*;
import org.openetcs.model.ertmsformalspecs.shortcut.*;
import org.openetcs.model.ertmsformalspecs.test.*;
import org.openetcs.model.ertmsformalspecs.translation.*;
import org.openetcs.model.ertmsformalspecs.types.*;
import org.openetcs.model.ertmsformalspecs.util.*;
import org.openetcs.es3f.importer.utils.*;

public class mask
	extends org.openetcs.es3f.importer.generated.mask
{
	private static final long serialVersionUID = 2829494552401902734L;

	public org.openetcs.model.ertmsformalspecs.requirements.messages.Mask convert2EMF( ECPProject project )
	{
		org.openetcs.model.ertmsformalspecs.requirements.messages.Mask retVal = MessagesFactory.eINSTANCE.createMask();;
		
		retVal.setValue(getValue());

		return retVal;
	}
}
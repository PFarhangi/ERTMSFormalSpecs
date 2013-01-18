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

public class Expectation
	extends org.openetcs.es3f.importer.generated.Expectation
{
	private static final long serialVersionUID = 2829494552401902714L;

	public org.openetcs.model.ertmsformalspecs.test.Expectation convert2EMF( ECPProject project )
	{
		org.openetcs.model.ertmsformalspecs.test.Expectation retVal = TestFactory.eINSTANCE.createExpectation();;
		
		retVal.setName(getName());
		retVal.setVariable(getVariable());
		retVal.setBlocking(getBlocking());
		retVal.setDeadline(getDeadLine());
		retVal.setValue(getValue());

		return retVal;
	}
}
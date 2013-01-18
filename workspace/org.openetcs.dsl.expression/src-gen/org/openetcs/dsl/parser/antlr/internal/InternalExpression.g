/*
* generated by Xtext
*/
grammar InternalExpression;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package org.openetcs.dsl.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.openetcs.dsl.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import org.openetcs.dsl.services.ExpressionGrammarAccess;

}

@parser::members {

 	private ExpressionGrammarAccess grammarAccess;
 	
    public InternalExpressionParser(TokenStream input, ExpressionGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "Model";	
   	}
   	
   	@Override
   	protected ExpressionGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleModel
entryRuleModel returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getModelRule()); }
	 iv_ruleModel=ruleModel 
	 { $current=$iv_ruleModel.current; } 
	 EOF 
;

// Rule Model
ruleModel returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
(
		{ 
	        newCompositeNode(grammarAccess.getModelAccess().getExpressionExpressionParserRuleCall_0()); 
	    }
		lv_expression_0_0=ruleExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getModelRule());
	        }
       		set(
       			$current, 
       			"expression",
        		lv_expression_0_0, 
        		"Expression");
	        afterParserOrEnumRuleCall();
	    }

)
)
;





// Entry rule entryRuleExpression
entryRuleExpression returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpressionRule()); }
	 iv_ruleExpression=ruleExpression 
	 { $current=$iv_ruleExpression.current; } 
	 EOF 
;

// Rule Expression
ruleExpression returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:

    { 
        newCompositeNode(grammarAccess.getExpressionAccess().getOrParserRuleCall()); 
    }
    this_Or_0=ruleOr
    { 
        $current = $this_Or_0.current; 
        afterParserOrEnumRuleCall();
    }

;





// Entry rule entryRuleOr
entryRuleOr returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getOrRule()); }
	 iv_ruleOr=ruleOr 
	 { $current=$iv_ruleOr.current; } 
	 EOF 
;

// Rule Or
ruleOr returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
    {
        $current = forceCreateModelElement(
            grammarAccess.getOrAccess().getOrAction_0(),
            $current);
    }
)(
(
		{ 
	        newCompositeNode(grammarAccess.getOrAccess().getLeftAndParserRuleCall_1_0()); 
	    }
		lv_left_1_0=ruleAnd		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getOrRule());
	        }
       		set(
       			$current, 
       			"left",
        		lv_left_1_0, 
        		"And");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_2='OR' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getOrAccess().getORKeyword_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getOrAccess().getRightAndParserRuleCall_2_1_0()); 
	    }
		lv_right_3_0=ruleAnd		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getOrRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_3_0, 
        		"And");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleAnd
entryRuleAnd returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getAndRule()); }
	 iv_ruleAnd=ruleAnd 
	 { $current=$iv_ruleAnd.current; } 
	 EOF 
;

// Rule And
ruleAnd returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
    {
        $current = forceCreateModelElement(
            grammarAccess.getAndAccess().getAndAction_0(),
            $current);
    }
)(
(
		{ 
	        newCompositeNode(grammarAccess.getAndAccess().getLeftEqualityParserRuleCall_1_0()); 
	    }
		lv_left_1_0=ruleEquality		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getAndRule());
	        }
       		set(
       			$current, 
       			"left",
        		lv_left_1_0, 
        		"Equality");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_2='AND' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getAndAccess().getANDKeyword_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getAndAccess().getRightEqualityParserRuleCall_2_1_0()); 
	    }
		lv_right_3_0=ruleEquality		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getAndRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_3_0, 
        		"Equality");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleEquality
entryRuleEquality returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEqualityRule()); }
	 iv_ruleEquality=ruleEquality 
	 { $current=$iv_ruleEquality.current; } 
	 EOF 
;

// Rule Equality
ruleEquality returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
    {
        $current = forceCreateModelElement(
            grammarAccess.getEqualityAccess().getEqualityAction_0(),
            $current);
    }
)(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getLeftPrimaryExpressionParserRuleCall_1_0()); 
	    }
		lv_left_1_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"left",
        		lv_left_1_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
)((	otherlv_2='==' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getEqualityAccess().getEqualsSignEqualsSignKeyword_2_0_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getRightPrimaryExpressionParserRuleCall_2_0_1_0()); 
	    }
		lv_right_3_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_3_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
))
    |(	otherlv_4='!=' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getEqualityAccess().getExclamationMarkEqualsSignKeyword_2_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getRightPrimaryExpressionParserRuleCall_2_1_1_0()); 
	    }
		lv_right_5_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_5_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
))
    |(	otherlv_6='<=' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getEqualityAccess().getLessThanSignEqualsSignKeyword_2_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getRightPrimaryExpressionParserRuleCall_2_2_1_0()); 
	    }
		lv_right_7_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_7_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
))
    |(	otherlv_8='>=' 
    {
    	newLeafNode(otherlv_8, grammarAccess.getEqualityAccess().getGreaterThanSignEqualsSignKeyword_2_3_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getRightPrimaryExpressionParserRuleCall_2_3_1_0()); 
	    }
		lv_right_9_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_9_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
))
    |(	otherlv_10='not in' 
    {
    	newLeafNode(otherlv_10, grammarAccess.getEqualityAccess().getNotInKeyword_2_4_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getRightPrimaryExpressionParserRuleCall_2_4_1_0()); 
	    }
		lv_right_11_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_11_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
))
    |(	otherlv_12='in' 
    {
    	newLeafNode(otherlv_12, grammarAccess.getEqualityAccess().getInKeyword_2_5_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEqualityAccess().getRightPrimaryExpressionParserRuleCall_2_5_1_0()); 
	    }
		lv_right_13_0=rulePrimaryExpression		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEqualityRule());
	        }
       		set(
       			$current, 
       			"right",
        		lv_right_13_0, 
        		"PrimaryExpression");
	        afterParserOrEnumRuleCall();
	    }

)
)))?)
;





// Entry rule entryRulePrimaryExpression
entryRulePrimaryExpression returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getPrimaryExpressionRule()); }
	 iv_rulePrimaryExpression=rulePrimaryExpression 
	 { $current=$iv_rulePrimaryExpression.current; } 
	 EOF 
;

// Rule PrimaryExpression
rulePrimaryExpression returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:

    { 
        newCompositeNode(grammarAccess.getPrimaryExpressionAccess().getUnaryExpressionParserRuleCall()); 
    }
    this_UnaryExpression_0=ruleUnaryExpression
    { 
        $current = $this_UnaryExpression_0.current; 
        afterParserOrEnumRuleCall();
    }

;





// Entry rule entryRuleUnaryExpression
entryRuleUnaryExpression returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getUnaryExpressionRule()); }
	 iv_ruleUnaryExpression=ruleUnaryExpression 
	 { $current=$iv_ruleUnaryExpression.current; } 
	 EOF 
;

// Rule UnaryExpression
ruleUnaryExpression returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:

    { 
        newCompositeNode(grammarAccess.getUnaryExpressionAccess().getTermParserRuleCall()); 
    }
    this_Term_0=ruleTerm
    { 
        $current = $this_Term_0.current; 
        afterParserOrEnumRuleCall();
    }

;





// Entry rule entryRuleTerm
entryRuleTerm returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getTermRule()); }
	 iv_ruleTerm=ruleTerm 
	 { $current=$iv_ruleTerm.current; } 
	 EOF 
;

// Rule Term
ruleTerm returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
    { 
        newCompositeNode(grammarAccess.getTermAccess().getDesignatorParserRuleCall_0()); 
    }
    this_Designator_0=ruleDesignator
    { 
        $current = $this_Designator_0.current; 
        afterParserOrEnumRuleCall();
    }

    |((
    {
        $current = forceCreateModelElement(
            grammarAccess.getTermAccess().getStringValueAction_1_0(),
            $current);
    }
)(
(
		lv_value_2_0=RULE_STRING
		{
			newLeafNode(lv_value_2_0, grammarAccess.getTermAccess().getValueSTRINGTerminalRuleCall_1_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getTermRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"value",
        		lv_value_2_0, 
        		"STRING");
	    }

)
))
    |((
    {
        $current = forceCreateModelElement(
            grammarAccess.getTermAccess().getIntegerValueAction_2_0(),
            $current);
    }
)(
(
		lv_value_4_0=RULE_INT
		{
			newLeafNode(lv_value_4_0, grammarAccess.getTermAccess().getValueINTTerminalRuleCall_2_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getTermRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"value",
        		lv_value_4_0, 
        		"INT");
	    }

)
))
    |((
    {
        $current = forceCreateModelElement(
            grammarAccess.getTermAccess().getDoubleValueAction_3_0(),
            $current);
    }
)(
(
		lv_value_6_0=RULE_DOUBLE
		{
			newLeafNode(lv_value_6_0, grammarAccess.getTermAccess().getValueDOUBLETerminalRuleCall_3_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getTermRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"value",
        		lv_value_6_0, 
        		"DOUBLE");
	    }

)
)))
;





// Entry rule entryRuleDesignator
entryRuleDesignator returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getDesignatorRule()); }
	 iv_ruleDesignator=ruleDesignator 
	 { $current=$iv_ruleDesignator.current; } 
	 EOF 
;

// Rule Designator
ruleDesignator returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getDesignatorRule());
	        }
        }
	otherlv_0=RULE_ID
	{
		newLeafNode(otherlv_0, grammarAccess.getDesignatorAccess().getValueEObjectCrossReference_0()); 
	}

)
)
;





RULE_DOUBLE : RULE_INT '.' RULE_INT;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


// ------------------------------------------------------------------------------
// -- Copyright ERTMS Solutions
// -- Licensed under the EUPL V.1.1
// -- http://joinup.ec.europa.eu/software/page/eupl/licence-eupl
// --
// -- This file is part of ERTMSFormalSpec software and documentation
// --
// --  ERTMSFormalSpec is free software: you can redistribute it and/or modify
// --  it under the terms of the EUPL General Public License, v.1.1
// --
// -- ERTMSFormalSpec is distributed in the hope that it will be useful,
// -- but WITHOUT ANY WARRANTY; without even the implied warranty of
// -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// --
// ------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace GUI.DataDictionaryView
{
    public class RulesTreeNode : TypeTreeNode<DataDictionary.Types.Structure>
    {
        private class ItemEditor : TypeEditor
        {
            /// <summary>
            /// Constructor
            /// </summary>
            public ItemEditor()
                : base()
            {
            }
        }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="item"></param>
        public RulesTreeNode(DataDictionary.Types.Structure item)
            : base(item, "Rules", true, false)
        {
            foreach (DataDictionary.Rules.Rule rule in item.Rules)
            {
                Nodes.Add(new RuleTreeNode(rule));
            }
        }

        /// <summary>
        /// Creates the editor for this tree node
        /// </summary>
        /// <returns></returns>
        protected override Editor createEditor()
        {
            return new ItemEditor();
        }

        /// <summary>
        /// Create structure based on the subsystem structure
        /// </summary>
        /// <param name="SourceNode"></param>
        public override void AcceptDrop(BaseTreeNode SourceNode)
        {
            base.AcceptDrop(SourceNode);

            if (SourceNode is RuleTreeNode)
            {
                RuleTreeNode node = SourceNode as RuleTreeNode;
                DataDictionary.Rules.Rule rule = node.Item;
                node.Delete();
                AddRule(rule);
            }
            else if (SourceNode is SpecificationView.ParagraphTreeNode)
            {
                SpecificationView.ParagraphTreeNode node = SourceNode as SpecificationView.ParagraphTreeNode;
                DataDictionary.Specification.Paragraph paragaph = node.Item;

                DataDictionary.Rules.Rule rule = (DataDictionary.Rules.Rule)DataDictionary.Generated.acceptor.getFactory().createRule();
                rule.Name = paragaph.Name;

                DataDictionary.ReqRef reqRef = (DataDictionary.ReqRef)DataDictionary.Generated.acceptor.getFactory().createReqRef();
                reqRef.Name = paragaph.FullId;
                rule.appendRequirements(reqRef);
                AddRule(rule);
            }
        }

        private void AddHandler(object sender, EventArgs args)
        {
            DataDictionary.Rules.Rule rule = (DataDictionary.Rules.Rule)DataDictionary.Generated.acceptor.getFactory().createRule();
            rule.Name = "<Rule" + (GetNodeCount(false) + 1) + ">";
            AddRule(rule);
        }

        /// <summary>
        /// Adds a new rule to the model
        /// </summary>
        /// <param name="rule"></param>
        public void AddRule(DataDictionary.Rules.Rule rule)
        {
            Item.appendRules(rule);
            Nodes.Add(new DataDictionaryView.RuleTreeNode(rule));
            SortSubNodes();
        }

        /// <summary>
        /// The menu items for this tree node
        /// </summary>
        /// <returns></returns>
        protected override List<MenuItem> GetMenuItems()
        {
            List<MenuItem> retVal = base.GetMenuItems();

            retVal.Add(new MenuItem("Add", new EventHandler(AddHandler)));

            return retVal;
        }
    }
}

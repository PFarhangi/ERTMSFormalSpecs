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
using System.ComponentModel;
using System.Windows.Forms;
using DataDictionary;
using DataDictionary.Types;

namespace GUI.DataDictionaryView
{
    public class VariableTreeNode : ReqRelatedTreeNode<DataDictionary.Variables.Variable>
    {
        private class InternalTypesConverter : TypesConverter
        {
            public override StandardValuesCollection
            GetStandardValues(ITypeDescriptorContext context)
            {
                ItemEditor editor = (ItemEditor)context.Instance;
                return GetValues(editor.Item);
            }
        }

        private class InternalValuesConverter : ValuesConverter
        {
            public override StandardValuesCollection
            GetStandardValues(ITypeDescriptorContext context)
            {
                ItemEditor editor = (ItemEditor)context.Instance;
                DataDictionary.Types.NameSpace nameSpace = editor.Item.NameSpace;
                DataDictionary.Types.Type type = editor.Item.Type;

                return GetValues(nameSpace, type);
            }
        }

        /// <summary>
        /// The editor for Train data variables
        /// </summary>
        private class ItemEditor : ReqRelatedEditor
        {
            /// <summary>
            /// Constructor
            /// </summary>
            public ItemEditor()
                : base()
            {
            }

            [Category("Description")]
            public override string Name
            {
                get { return base.Name; }
                set { base.Name = value; }
            }

            /// <summary>
            /// The variable type
            /// </summary>
            [Category("Description"), TypeConverter(typeof(InternalTypesConverter))]
            public string Type
            {
                get { return Item.getTypeName(); }
                set
                {
                    Item.Type = null;
                    Item.setTypeName(value);
                    Item.Value = null;

                    VariableTreeNode node = Node as VariableTreeNode;
                    if (node != null)
                    {
                        node.Nodes.Remove(node.subVariables);
                        node.subVariables = new SubVariablesTreeNode(Item, new HashSet<DataDictionary.Types.Type>());
                        node.Nodes.Add(node.subVariables);
                    }
                }
            }

            /// <summary>
            /// The default value for this variable
            /// </summary>
            [Category("Description"), TypeConverter(typeof(InternalValuesConverter))]
            public string DefaultValue
            {
                get { return Item.getDefaultValue(); }
                set { Item.setDefaultValue(value); }
            }

            /// <summary>
            /// The variable mode
            /// </summary>
            [Category("Description"), TypeConverter(typeof(VariableModeConverter))]
            public DataDictionary.Generated.acceptor.VariableModeEnumType Mode
            {
                get { return Item.getVariableMode(); }
                set { Item.setVariableMode(value); }
            }

            /// <summary>
            /// The variable value
            /// </summary>
            [Category("Description")]
            public string Value
            {
                get
                {
                    if (Item.Value != null)
                    {
                        return Item.Value.Name;
                    }
                    else
                    {
                        return "<unknown>";
                    }
                }
                set { Item.Value = Item.Type.getValue(value); }
            }
        }

        private bool IsASubVariable;
        private SubVariablesTreeNode subVariables;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="item"></param>
        /// <param name="children"></param>
        /// <param name="encounteredTypes">the types that have already been encountered in the path to create this variable </param>
        public VariableTreeNode(DataDictionary.Variables.Variable item, HashSet<DataDictionary.Types.Type> encounteredTypes, bool isASubVariable = false)
            : base(item)
        {
            encounteredTypes.Add(item.Type);
            IsASubVariable = isASubVariable;
            subVariables = new SubVariablesTreeNode(item, encounteredTypes);
            Nodes.Add(subVariables);
            encounteredTypes.Remove(item.Type);
        }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="item"></param>
        /// <param name="children"></param>
        /// <param name="encounteredTypes">the types that have already been encountered in the path to create this variable </param>
        public VariableTreeNode(DataDictionary.Variables.Variable item, string name, HashSet<DataDictionary.Types.Type> encounteredTypes, bool isASubVariable = false)
            : base(item, name, false)
        {
            encounteredTypes.Add(item.Type);
            IsASubVariable = isASubVariable;
            subVariables = new SubVariablesTreeNode(item, encounteredTypes);
            Nodes.Add(subVariables);
            encounteredTypes.Remove(item.Type);
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
        /// Display the associated state diagram
        /// </summary>
        public void ViewDiagram()
        {
            if (Item.Type is StateMachine)
            {
                StateDiagram.StateDiagramWindow window = new StateDiagram.StateDiagramWindow();
                BaseTreeView.ParentForm.MDIWindow.AddChildWindow(window);
                window.SetStateMachine(Item);
                window.Text = Item.Name + " state diagram";
            }
        }

        protected void ViewStateDiagramHandler(object sender, EventArgs args)
        {
            ViewDiagram();
        }

        /// <summary>
        /// The menu items for this tree node
        /// </summary>
        /// <returns></returns>
        protected override List<MenuItem> GetMenuItems()
        {
            List<MenuItem> retVal;

            if (!IsASubVariable)
            {
                retVal = base.GetMenuItems();
                retVal.Add(new MenuItem("Delete", new EventHandler(DeleteHandler)));
            }
            else
            {
                retVal = new List<MenuItem>();
                retVal.Add(new MenuItem("Refresh", new EventHandler(RefreshNodeHandler)));
            }

            DataDictionary.Functions.Function function = Item.Value as DataDictionary.Functions.Function;
            if (function != null)
            {
                DataDictionary.Interpreter.InterpretationContext context = new DataDictionary.Interpreter.InterpretationContext(Item);
                if (function.FormalParameters.Count == 1)
                {
                    Parameter parameter = (Parameter)function.FormalParameters[0];
                    DataDictionary.Functions.Graph graph = function.createGraph(context, parameter);
                    if (graph != null && graph.Segments.Count != 0)
                    {
                        retVal.Add(new MenuItem("-"));
                        retVal.Add(new MenuItem("Display", new EventHandler(DisplayHandler)));
                    }
                }
                else if (function.FormalParameters.Count == 2)
                {
                    DataDictionary.Functions.Surface surface = function.createSurface(context);
                    if (surface != null && surface.Segments.Count != 0)
                    {
                        retVal.Add(new MenuItem("-"));
                        retVal.Add(new MenuItem("Display", new EventHandler(DisplayHandler)));
                    }
                }
            }

            if (Item.Type is StateMachine)
            {
                retVal.Add(new MenuItem("-"));
                retVal.Add(new MenuItem("View state diagram", new EventHandler(ViewStateDiagramHandler)));
            }

            return retVal;
        }


        public void DisplayHandler(object sender, EventArgs args)
        {
            DataDictionary.Functions.Function function = Item.Value as DataDictionary.Functions.Function;
            if (function != null)
            {
                GraphView.GraphView view = new GraphView.GraphView();
                MainWindow.AddChildWindow(view);
                view.Functions.Add(function);
                view.Refresh();
            }
        }
    }
}

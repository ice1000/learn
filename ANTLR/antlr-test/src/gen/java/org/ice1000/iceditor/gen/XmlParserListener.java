// Generated from XmlParser.g4 by ANTLR 4.7.1

    package org.ice1000.iceditor.gen;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link XmlParser}.
 */
public interface XmlParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link XmlParser#document}.
	 * @param ctx the parse tree
	 */
	void enterDocument(XmlParser.DocumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#document}.
	 * @param ctx the parse tree
	 */
	void exitDocument(XmlParser.DocumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#prolog}.
	 * @param ctx the parse tree
	 */
	void enterProlog(XmlParser.PrologContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#prolog}.
	 * @param ctx the parse tree
	 */
	void exitProlog(XmlParser.PrologContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#content}.
	 * @param ctx the parse tree
	 */
	void enterContent(XmlParser.ContentContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#content}.
	 * @param ctx the parse tree
	 */
	void exitContent(XmlParser.ContentContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#element}.
	 * @param ctx the parse tree
	 */
	void enterElement(XmlParser.ElementContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#element}.
	 * @param ctx the parse tree
	 */
	void exitElement(XmlParser.ElementContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#reference}.
	 * @param ctx the parse tree
	 */
	void enterReference(XmlParser.ReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#reference}.
	 * @param ctx the parse tree
	 */
	void exitReference(XmlParser.ReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#attribute}.
	 * @param ctx the parse tree
	 */
	void enterAttribute(XmlParser.AttributeContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#attribute}.
	 * @param ctx the parse tree
	 */
	void exitAttribute(XmlParser.AttributeContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#chardata}.
	 * @param ctx the parse tree
	 */
	void enterChardata(XmlParser.ChardataContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#chardata}.
	 * @param ctx the parse tree
	 */
	void exitChardata(XmlParser.ChardataContext ctx);
	/**
	 * Enter a parse tree produced by {@link XmlParser#misc}.
	 * @param ctx the parse tree
	 */
	void enterMisc(XmlParser.MiscContext ctx);
	/**
	 * Exit a parse tree produced by {@link XmlParser#misc}.
	 * @param ctx the parse tree
	 */
	void exitMisc(XmlParser.MiscContext ctx);
}
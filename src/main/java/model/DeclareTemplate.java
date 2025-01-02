package model;

import java.util.HashMap;
import java.util.Map;

public enum DeclareTemplate {
  Absence("Absence",false, "unary"),
  Absence2("Absence2",false, "unary"),
  Absence3("Absence3",false, "unary"),
  //End("End",false, "unary"),
  Exactly1("Exactly1",false, "unary"),
  Exactly2("Exactly2",false, "unary"),
  Existence("Existence",false, "unary"),
  Existence2("Existence2",false, "unary"),
  Existence3("Existence3",false, "unary"),
  Init("Init",false, "unary"),
  Alternate_Precedence("Alternate Precedence",true, "binary"),
  Alternate_Response("Alternate Response",false, "binary"),
  Chain_Precedence("Chain Precedence",true, "binary"),
  Chain_Response("Chain Response", false, "binary"),
  Precedence("Precedence", true, "binary"),
  Responded_Existence("Responded Existence", false, "binary"),
  Response("Response", false, "binary"),
  Choice("Choice", false, "binary"),
  Exclusive_Choice("Exclusive Choice", false, "binary"),
  Not_Chain_Precedence("Not Chain Precedence", true, "binary"),
  Not_Chain_Response("Not Chain Response", false, "binary"),
  Not_Precedence("Not Precedence", true, "binary"),
  Not_Responded_Existence("Not Responded Existence", false, "binary"),
  Not_Response("Not Response", false, "binary"),
  Succession("Succession", false, "agnostic"),
  Alternate_Succession("Alternate Succession", false, "agnostic"),
  Chain_Succession("Chain Succession", false, "agnostic"),
  Not_Succession("Not Succession", false, "agnostic"),
  Not_Chain_Succession("Not Chain Succession", false, "agnostic"),
  CoExistence("Co-Existence", false, "agnostic"),
  Not_CoExistence("Not Co-Existence", false, "agnostic");
  
  private final String templateName, flag;
  private final boolean reverseActivationTarget;
  private static final Map<String, DeclareTemplate> templateNameToTemplate = new HashMap<>();
  
  static {
    for (DeclareTemplate constraintTemplate : DeclareTemplate.values()) {
      templateNameToTemplate.put(constraintTemplate.getTemplateName(), constraintTemplate);
    }
  }
  
  DeclareTemplate(String templateName, boolean reverseActivationTarget, String flag) {
    this.templateName = templateName;
    this.flag = flag;
    this.reverseActivationTarget = reverseActivationTarget;
  }
  
  public String getTemplateName() {
    return templateName;
  }
  
  public String getFlag() {
    return flag;
  }
  
  public boolean getReverseActivationTarget() {
    return reverseActivationTarget;
  }
  
  public static DeclareTemplate getByTemplateName(String templateName) {
    return templateNameToTemplate.get(templateName);
  }
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.studentmanagement.web.converter;

import com.studentmanagement.domain.Subject;
import com.studentmanagement.domain.SubjectRepository;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect SubjectConverter_Roo_Converter {
    
    declare parents: SubjectConverter implements Converter;
    
    declare @type: SubjectConverter: @FacesConverter("com.studentmanagement.web.converter.SubjectConverter");
    
    @Autowired
    SubjectRepository SubjectConverter.subjectRepository;
    
    public java.lang.Object SubjectConverter.getAsObject(FacesContext context, UIComponent component, java.lang.String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return subjectRepository.findOne(id);
    }
    
    public java.lang.String SubjectConverter.getAsString(FacesContext context, UIComponent component, java.lang.Object value) {
        return value instanceof Subject ? ((Subject) value).getId().toString() : "";
    }
    
}

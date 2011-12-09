// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.studentmanagement.web.converter;

import com.studentmanagement.domain.Student;
import com.studentmanagement.domain.StudentRepository;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect StudentConverter_Roo_Converter {
    
    declare parents: StudentConverter implements Converter;
    
    declare @type: StudentConverter: @FacesConverter("com.studentmanagement.web.converter.StudentConverter");
    
    @Autowired
    StudentRepository StudentConverter.studentRepository;
    
    public java.lang.Object StudentConverter.getAsObject(FacesContext context, UIComponent component, java.lang.String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return studentRepository.findOne(id);
    }
    
    public java.lang.String StudentConverter.getAsString(FacesContext context, UIComponent component, java.lang.Object value) {
        return value instanceof Student ? ((Student) value).getId().toString() : "";
    }
    
}

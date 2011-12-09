// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.studentmanagement.web;

import com.studentmanagement.domain.Student;
import com.studentmanagement.domain.StudentRepository;
import com.studentmanagement.domain.Subject;
import com.studentmanagement.shared.Degrees;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.commandbutton.CommandButton;
import org.primefaces.component.filedownload.FileDownloadActionListener;
import org.primefaces.component.fileupload.FileUpload;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect StudentBean_Roo_ManagedBean {
    
    declare @type: StudentBean: @ManagedBean(name = "studentBean");
    
    declare @type: StudentBean: @SessionScoped;
    
    @Autowired
    StudentRepository StudentBean.studentRepository;
    
    private java.lang.String StudentBean.name = "Students";
    
    private Student StudentBean.student;
    
    private List<Student> StudentBean.allStudents;
    
    private boolean StudentBean.dataVisible = false;
    
    private List<java.lang.String> StudentBean.columns;
    
    private HtmlPanelGrid StudentBean.createPanelGrid;
    
    private HtmlPanelGrid StudentBean.editPanelGrid;
    
    private HtmlPanelGrid StudentBean.viewPanelGrid;
    
    private boolean StudentBean.createDialogVisible = false;
    
    private List<Subject> StudentBean.selectedSubjects;
    
    @PostConstruct
    public void StudentBean.init() {
        columns = new ArrayList<String>();
        columns.add("name");
        columns.add("surname");
        columns.add("birthDate");
        columns.add("login");
        columns.add("password");
    }
    
    public java.lang.String StudentBean.getName() {
        return name;
    }
    
    public List<java.lang.String> StudentBean.getColumns() {
        return columns;
    }
    
    public List<Student> StudentBean.getAllStudents() {
        return allStudents;
    }
    
    public void StudentBean.setAllStudents(List<Student> allStudents) {
        this.allStudents = allStudents;
    }
    
    public java.lang.String StudentBean.findAllStudents() {
        allStudents = studentRepository.findAll();
        dataVisible = !allStudents.isEmpty();
        return null;
    }
    
    public boolean StudentBean.isDataVisible() {
        return dataVisible;
    }
    
    public void StudentBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid StudentBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void StudentBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid StudentBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void StudentBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid StudentBean.getViewPanelGrid() {
        if (viewPanelGrid == null) {
            viewPanelGrid = populateViewPanel();
        }
        return viewPanelGrid;
    }
    
    public void StudentBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid StudentBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameCreateOutput.setId("nameCreateOutput");
        nameCreateOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(nameCreateOutput);
        
        InputText nameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameCreateInput.setId("nameCreateInput");
        nameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.name}", String.class));
        LengthValidator nameCreateInputValidator = new LengthValidator();
        nameCreateInputValidator.setMaximum(25);
        nameCreateInput.addValidator(nameCreateInputValidator);
        nameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nameCreateInput);
        
        Message nameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameCreateInputMessage.setId("nameCreateInputMessage");
        nameCreateInputMessage.setFor("nameCreateInput");
        nameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameCreateInputMessage);
        
        HtmlOutputText surnameCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        surnameCreateOutput.setId("surnameCreateOutput");
        surnameCreateOutput.setValue("Surname: * ");
        htmlPanelGrid.getChildren().add(surnameCreateOutput);
        
        InputText surnameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        surnameCreateInput.setId("surnameCreateInput");
        surnameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.surname}", String.class));
        LengthValidator surnameCreateInputValidator = new LengthValidator();
        surnameCreateInputValidator.setMaximum(25);
        surnameCreateInput.addValidator(surnameCreateInputValidator);
        surnameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(surnameCreateInput);
        
        Message surnameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        surnameCreateInputMessage.setId("surnameCreateInputMessage");
        surnameCreateInputMessage.setFor("surnameCreateInput");
        surnameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(surnameCreateInputMessage);
        
        HtmlOutputText birthDateCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        birthDateCreateOutput.setId("birthDateCreateOutput");
        birthDateCreateOutput.setValue("Birth Date:   ");
        htmlPanelGrid.getChildren().add(birthDateCreateOutput);
        
        Calendar birthDateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        birthDateCreateInput.setId("birthDateCreateInput");
        birthDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.birthDate}", Date.class));
        birthDateCreateInput.setNavigator(true);
        birthDateCreateInput.setEffect("slideDown");
        birthDateCreateInput.setPattern("dd/MM/yyyy");
        birthDateCreateInput.setRequired(false);
        birthDateCreateInput.setMaxdate(new Date());
        htmlPanelGrid.getChildren().add(birthDateCreateInput);
        
        Message birthDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        birthDateCreateInputMessage.setId("birthDateCreateInputMessage");
        birthDateCreateInputMessage.setFor("birthDateCreateInput");
        birthDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(birthDateCreateInputMessage);
        
        HtmlOutputText loginCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        loginCreateOutput.setId("loginCreateOutput");
        loginCreateOutput.setValue("Login: * ");
        htmlPanelGrid.getChildren().add(loginCreateOutput);
        
        InputText loginCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        loginCreateInput.setId("loginCreateInput");
        loginCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.login}", String.class));
        LengthValidator loginCreateInputValidator = new LengthValidator();
        loginCreateInputValidator.setMinimum(5);
        loginCreateInputValidator.setMaximum(15);
        loginCreateInput.addValidator(loginCreateInputValidator);
        loginCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(loginCreateInput);
        
        Message loginCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        loginCreateInputMessage.setId("loginCreateInputMessage");
        loginCreateInputMessage.setFor("loginCreateInput");
        loginCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(loginCreateInputMessage);
        
        HtmlOutputText passwordCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        passwordCreateOutput.setId("passwordCreateOutput");
        passwordCreateOutput.setValue("Password: * ");
        htmlPanelGrid.getChildren().add(passwordCreateOutput);
        
        InputText passwordCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        passwordCreateInput.setId("passwordCreateInput");
        passwordCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.password}", String.class));
        LengthValidator passwordCreateInputValidator = new LengthValidator();
        passwordCreateInputValidator.setMinimum(5);
        passwordCreateInputValidator.setMaximum(15);
        passwordCreateInput.addValidator(passwordCreateInputValidator);
        passwordCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(passwordCreateInput);
        
        Message passwordCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        passwordCreateInputMessage.setId("passwordCreateInputMessage");
        passwordCreateInputMessage.setFor("passwordCreateInput");
        passwordCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(passwordCreateInputMessage);
        
        HtmlOutputText degreeCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        degreeCreateOutput.setId("degreeCreateOutput");
        degreeCreateOutput.setValue("Degree: * ");
        htmlPanelGrid.getChildren().add(degreeCreateOutput);
        
        AutoComplete degreeCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        degreeCreateInput.setId("degreeCreateInput");
        degreeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.degree}", Degrees.class));
        degreeCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{studentBean.completeDegree}", List.class, new Class[] { String.class }));
        degreeCreateInput.setDropdown(true);
        degreeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(degreeCreateInput);
        
        Message degreeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        degreeCreateInputMessage.setId("degreeCreateInputMessage");
        degreeCreateInputMessage.setFor("degreeCreateInput");
        degreeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(degreeCreateInputMessage);
        
        HtmlOutputText imageCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        imageCreateOutput.setId("imageCreateOutput");
        imageCreateOutput.setValue("Image:   ");
        htmlPanelGrid.getChildren().add(imageCreateOutput);
        
        FileUpload imageCreateInput = (FileUpload) application.createComponent(FileUpload.COMPONENT_TYPE);
        imageCreateInput.setId("imageCreateInput");
        imageCreateInput.setFileUploadListener(expressionFactory.createMethodExpression(elContext, "#{studentBean.handleFileUploadForImage}", void.class, new Class[] { FileUploadEvent.class }));
        imageCreateInput.setMode("advanced");
        imageCreateInput.setAllowTypes("/(\\.|\\/)([jJ][pP][gG]|[jJ][pP][eE][gG])$/");
        htmlPanelGrid.getChildren().add(imageCreateInput);
        
        Message imageCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        imageCreateInputMessage.setId("imageCreateInputMessage");
        imageCreateInputMessage.setFor("imageCreateInput");
        imageCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(imageCreateInputMessage);
        
        HtmlOutputText subjectsCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        subjectsCreateOutput.setId("subjectsCreateOutput");
        subjectsCreateOutput.setValue("Subjects:   ");
        htmlPanelGrid.getChildren().add(subjectsCreateOutput);
        
        HtmlOutputText subjectsCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        subjectsCreateInput.setId("subjectsCreateInput");
        subjectsCreateInput.setValue("This relationship is managed from the Subject side");
        htmlPanelGrid.getChildren().add(subjectsCreateInput);
        
        Message subjectsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        subjectsCreateInputMessage.setId("subjectsCreateInputMessage");
        subjectsCreateInputMessage.setFor("subjectsCreateInput");
        subjectsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(subjectsCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid StudentBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameEditOutput.setId("nameEditOutput");
        nameEditOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(nameEditOutput);
        
        InputText nameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameEditInput.setId("nameEditInput");
        nameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.name}", String.class));
        LengthValidator nameEditInputValidator = new LengthValidator();
        nameEditInputValidator.setMaximum(25);
        nameEditInput.addValidator(nameEditInputValidator);
        nameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nameEditInput);
        
        Message nameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameEditInputMessage.setId("nameEditInputMessage");
        nameEditInputMessage.setFor("nameEditInput");
        nameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameEditInputMessage);
        
        HtmlOutputText surnameEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        surnameEditOutput.setId("surnameEditOutput");
        surnameEditOutput.setValue("Surname: * ");
        htmlPanelGrid.getChildren().add(surnameEditOutput);
        
        InputText surnameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        surnameEditInput.setId("surnameEditInput");
        surnameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.surname}", String.class));
        LengthValidator surnameEditInputValidator = new LengthValidator();
        surnameEditInputValidator.setMaximum(25);
        surnameEditInput.addValidator(surnameEditInputValidator);
        surnameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(surnameEditInput);
        
        Message surnameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        surnameEditInputMessage.setId("surnameEditInputMessage");
        surnameEditInputMessage.setFor("surnameEditInput");
        surnameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(surnameEditInputMessage);
        
        HtmlOutputText birthDateEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        birthDateEditOutput.setId("birthDateEditOutput");
        birthDateEditOutput.setValue("Birth Date:   ");
        htmlPanelGrid.getChildren().add(birthDateEditOutput);
        
        Calendar birthDateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        birthDateEditInput.setId("birthDateEditInput");
        birthDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.birthDate}", Date.class));
        birthDateEditInput.setNavigator(true);
        birthDateEditInput.setEffect("slideDown");
        birthDateEditInput.setPattern("dd/MM/yyyy");
        birthDateEditInput.setRequired(false);
        birthDateEditInput.setMaxdate(new Date());
        htmlPanelGrid.getChildren().add(birthDateEditInput);
        
        Message birthDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        birthDateEditInputMessage.setId("birthDateEditInputMessage");
        birthDateEditInputMessage.setFor("birthDateEditInput");
        birthDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(birthDateEditInputMessage);
        
        HtmlOutputText loginEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        loginEditOutput.setId("loginEditOutput");
        loginEditOutput.setValue("Login: * ");
        htmlPanelGrid.getChildren().add(loginEditOutput);
        
        InputText loginEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        loginEditInput.setId("loginEditInput");
        loginEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.login}", String.class));
        LengthValidator loginEditInputValidator = new LengthValidator();
        loginEditInputValidator.setMinimum(5);
        loginEditInputValidator.setMaximum(15);
        loginEditInput.addValidator(loginEditInputValidator);
        loginEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(loginEditInput);
        
        Message loginEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        loginEditInputMessage.setId("loginEditInputMessage");
        loginEditInputMessage.setFor("loginEditInput");
        loginEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(loginEditInputMessage);
        
        HtmlOutputText passwordEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        passwordEditOutput.setId("passwordEditOutput");
        passwordEditOutput.setValue("Password: * ");
        htmlPanelGrid.getChildren().add(passwordEditOutput);
        
        InputText passwordEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        passwordEditInput.setId("passwordEditInput");
        passwordEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.password}", String.class));
        LengthValidator passwordEditInputValidator = new LengthValidator();
        passwordEditInputValidator.setMinimum(5);
        passwordEditInputValidator.setMaximum(15);
        passwordEditInput.addValidator(passwordEditInputValidator);
        passwordEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(passwordEditInput);
        
        Message passwordEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        passwordEditInputMessage.setId("passwordEditInputMessage");
        passwordEditInputMessage.setFor("passwordEditInput");
        passwordEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(passwordEditInputMessage);
        
        HtmlOutputText degreeEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        degreeEditOutput.setId("degreeEditOutput");
        degreeEditOutput.setValue("Degree: * ");
        htmlPanelGrid.getChildren().add(degreeEditOutput);
        
        AutoComplete degreeEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        degreeEditInput.setId("degreeEditInput");
        degreeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.degree}", Degrees.class));
        degreeEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{studentBean.completeDegree}", List.class, new Class[] { String.class }));
        degreeEditInput.setDropdown(true);
        degreeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(degreeEditInput);
        
        Message degreeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        degreeEditInputMessage.setId("degreeEditInputMessage");
        degreeEditInputMessage.setFor("degreeEditInput");
        degreeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(degreeEditInputMessage);
        
        HtmlOutputText imageEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        imageEditOutput.setId("imageEditOutput");
        imageEditOutput.setValue("Image:   ");
        htmlPanelGrid.getChildren().add(imageEditOutput);
        
        FileUpload imageEditInput = (FileUpload) application.createComponent(FileUpload.COMPONENT_TYPE);
        imageEditInput.setId("imageEditInput");
        imageEditInput.setFileUploadListener(expressionFactory.createMethodExpression(elContext, "#{studentBean.handleFileUploadForImage}", void.class, new Class[] { FileUploadEvent.class }));
        imageEditInput.setMode("advanced");
        imageEditInput.setAllowTypes("/(\\.|\\/)([jJ][pP][gG]|[jJ][pP][eE][gG])$/");
        htmlPanelGrid.getChildren().add(imageEditInput);
        
        Message imageEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        imageEditInputMessage.setId("imageEditInputMessage");
        imageEditInputMessage.setFor("imageEditInput");
        imageEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(imageEditInputMessage);
        
        HtmlOutputText subjectsEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        subjectsEditOutput.setId("subjectsEditOutput");
        subjectsEditOutput.setValue("Subjects:   ");
        htmlPanelGrid.getChildren().add(subjectsEditOutput);
        
        HtmlOutputText subjectsEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        subjectsEditInput.setId("subjectsEditInput");
        subjectsEditInput.setValue("This relationship is managed from the Subject side");
        htmlPanelGrid.getChildren().add(subjectsEditInput);
        
        Message subjectsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        subjectsEditInputMessage.setId("subjectsEditInputMessage");
        subjectsEditInputMessage.setFor("subjectsEditInput");
        subjectsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(subjectsEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid StudentBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameLabel.setId("nameLabel");
        nameLabel.setValue("Name:   ");
        htmlPanelGrid.getChildren().add(nameLabel);
        
        HtmlOutputText nameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameValue.setId("nameValue");
        nameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.name}", String.class));
        htmlPanelGrid.getChildren().add(nameValue);
        
        HtmlOutputText surnameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        surnameLabel.setId("surnameLabel");
        surnameLabel.setValue("Surname:   ");
        htmlPanelGrid.getChildren().add(surnameLabel);
        
        HtmlOutputText surnameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        surnameValue.setId("surnameValue");
        surnameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.surname}", String.class));
        htmlPanelGrid.getChildren().add(surnameValue);
        
        HtmlOutputText birthDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        birthDateLabel.setId("birthDateLabel");
        birthDateLabel.setValue("Birth Date:   ");
        htmlPanelGrid.getChildren().add(birthDateLabel);
        
        HtmlOutputText birthDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        birthDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.birthDate}", Date.class));
        DateTimeConverter birthDateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        birthDateValueConverter.setPattern("dd/MM/yyyy");
        birthDateValue.setConverter(birthDateValueConverter);
        htmlPanelGrid.getChildren().add(birthDateValue);
        
        HtmlOutputText loginLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        loginLabel.setId("loginLabel");
        loginLabel.setValue("Login:   ");
        htmlPanelGrid.getChildren().add(loginLabel);
        
        HtmlOutputText loginValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        loginValue.setId("loginValue");
        loginValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.login}", String.class));
        htmlPanelGrid.getChildren().add(loginValue);
        
        HtmlOutputText passwordLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        passwordLabel.setId("passwordLabel");
        passwordLabel.setValue("Password:   ");
        htmlPanelGrid.getChildren().add(passwordLabel);
        
        HtmlOutputText passwordValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        passwordValue.setId("passwordValue");
        passwordValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.password}", String.class));
        htmlPanelGrid.getChildren().add(passwordValue);
        
        HtmlOutputText degreeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        degreeLabel.setId("degreeLabel");
        degreeLabel.setValue("Degree:   ");
        htmlPanelGrid.getChildren().add(degreeLabel);
        
        HtmlOutputText degreeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        degreeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{studentBean.student.degree}", String.class));
        htmlPanelGrid.getChildren().add(degreeValue);
        
        HtmlOutputText imageLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        imageLabel.setId("imageLabel");
        imageLabel.setValue("Image:   ");
        htmlPanelGrid.getChildren().add(imageLabel);
        
        UIComponent imageValue;
        if (student != null && student.getImage() != null && student.getImage().length > 0) {
            imageValue = (CommandButton) application.createComponent(CommandButton.COMPONENT_TYPE);
            ((CommandButton) imageValue).addActionListener(new FileDownloadActionListener(expressionFactory.createValueExpression(elContext, "#{studentBean.imageStreamedContent}", StreamedContent.class), null));
            ((CommandButton) imageValue).setValue("Download");
            ((CommandButton) imageValue).setAjax(false);
        } else {
            imageValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
            ((HtmlOutputText) imageValue).setValue("");
        }
        htmlPanelGrid.getChildren().add(imageValue);
        
        HtmlOutputText subjectsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        subjectsLabel.setId("subjectsLabel");
        subjectsLabel.setValue("Subjects:   ");
        htmlPanelGrid.getChildren().add(subjectsLabel);
        
        HtmlOutputText subjectsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        subjectsValue.setId("subjectsValue");
        subjectsValue.setValue("This relationship is managed from the Subject side");
        htmlPanelGrid.getChildren().add(subjectsValue);
        
        return htmlPanelGrid;
    }
    
    public Student StudentBean.getStudent() {
        if (student == null) {
            student = new Student();
        }
        return student;
    }
    
    public void StudentBean.setStudent(Student student) {
        this.student = student;
    }
    
    public List<Degrees> StudentBean.completeDegree(java.lang.String query) {
        List<Degrees> suggestions = new ArrayList<Degrees>();
        for (Degrees degrees : Degrees.values()) {
            if (degrees.name().toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(degrees);
            }
        }
        return suggestions;
    }
    
    public void StudentBean.handleFileUploadForImage(FileUploadEvent event) {
        student.setImage(event.getFile().getContents());
        FacesContext facesContext = FacesContext.getCurrentInstance();
        FacesMessage facesMessage = new FacesMessage("Successful", event.getFile().getFileName() + " is uploaded.");
        facesContext.addMessage(null, facesMessage);
    }
    
    public StreamedContent StudentBean.getImageStreamedContent() {
        if (student != null && student.getImage() != null) {
            return new DefaultStreamedContent(new ByteArrayInputStream(student.getImage()), "image/jpeg", "image.jpg");
        }
        return new DefaultStreamedContent(new ByteArrayInputStream("".getBytes()));
    }
    
    public List<Subject> StudentBean.getSelectedSubjects() {
        return selectedSubjects;
    }
    
    public void StudentBean.setSelectedSubjects(List<Subject> selectedSubjects) {
        if (selectedSubjects != null) {
            student.setSubjects(new HashSet<Subject>(selectedSubjects));
        }
        this.selectedSubjects = selectedSubjects;
    }
    
    public java.lang.String StudentBean.onEdit() {
        if (student != null && student.getSubjects() != null) {
            selectedSubjects = new ArrayList<Subject>(student.getSubjects());
        }
        return null;
    }
    
    public boolean StudentBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void StudentBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public java.lang.String StudentBean.displayList() {
        createDialogVisible = false;
        findAllStudents();
        return "student";
    }
    
    public java.lang.String StudentBean.displayCreateDialog() {
        student = new Student();
        createDialogVisible = true;
        return "student";
    }
    
    public java.lang.String StudentBean.persist() {
        String message = "";
        if (student.getId() != null) {
            studentRepository.save(student);
            message = "Successfully updated";
        } else {
            studentRepository.save(student);
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllStudents();
    }
    
    public java.lang.String StudentBean.delete() {
        studentRepository.delete(student);
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllStudents();
    }
    
    public void StudentBean.reset() {
        student = null;
        selectedSubjects = null;
        createDialogVisible = false;
    }
    
    public void StudentBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}

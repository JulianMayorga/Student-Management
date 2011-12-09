// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.studentmanagement.domain;

import com.studentmanagement.domain.StudentDataOnDemand;
import com.studentmanagement.domain.StudentRepository;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StudentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StudentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StudentIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StudentIntegrationTest: @Transactional;
    
    @Autowired
    private StudentDataOnDemand StudentIntegrationTest.dod;
    
    @Autowired
    StudentRepository StudentIntegrationTest.studentRepository;
    
    @Test
    public void StudentIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        long count = studentRepository.count();
        Assert.assertTrue("Counter for 'Student' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StudentIntegrationTest.testFind() {
        Student obj = dod.getRandomStudent();
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Student' failed to provide an identifier", id);
        obj = studentRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Student' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Student' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void StudentIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        long count = studentRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Student', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Student> result = studentRepository.findAll();
        Assert.assertNotNull("Find all method for 'Student' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Student' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StudentIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        long count = studentRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Student> result = studentRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Student' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Student' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StudentIntegrationTest.testFlush() {
        Student obj = dod.getRandomStudent();
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Student' failed to provide an identifier", id);
        obj = studentRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Student' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyStudent(obj);
        Integer currentVersion = obj.getVersion();
        studentRepository.flush();
        Assert.assertTrue("Version for 'Student' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void StudentIntegrationTest.testSaveUpdate() {
        Student obj = dod.getRandomStudent();
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Student' failed to provide an identifier", id);
        obj = studentRepository.findOne(id);
        boolean modified =  dod.modifyStudent(obj);
        Integer currentVersion = obj.getVersion();
        Student merged = studentRepository.save(obj);
        studentRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Student' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void StudentIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", dod.getRandomStudent());
        Student obj = dod.getNewTransientStudent(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Student' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Student' identifier to be null", obj.getId());
        studentRepository.save(obj);
        studentRepository.flush();
        Assert.assertNotNull("Expected 'Student' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void StudentIntegrationTest.testDelete() {
        Student obj = dod.getRandomStudent();
        Assert.assertNotNull("Data on demand for 'Student' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Student' failed to provide an identifier", id);
        obj = studentRepository.findOne(id);
        studentRepository.delete(obj);
        studentRepository.flush();
        Assert.assertNull("Failed to remove 'Student' with identifier '" + id + "'", studentRepository.findOne(id));
    }
    
}

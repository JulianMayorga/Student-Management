// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.studentmanagement.domain;

import com.studentmanagement.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect StudentRepository_Roo_Jpa_Repository {
    
    declare parents: StudentRepository extends JpaRepository<Student, java.lang.Long>;
    
    declare parents: StudentRepository extends JpaSpecificationExecutor<Student>;
    
    declare @type: StudentRepository: @Repository;
    
}

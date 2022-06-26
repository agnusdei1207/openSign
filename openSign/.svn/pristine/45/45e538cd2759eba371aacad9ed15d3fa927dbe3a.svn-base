package com.open.cmmn.util;

import java.util.Collection;

import javax.validation.Validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.SpringValidatorAdapter;

public class CustomCollectionValidator implements Validator {

    private SpringValidatorAdapter validator;

    public CustomCollectionValidator() {
        this.validator = new SpringValidatorAdapter(
                Validation.buildDefaultValidatorFactory().getValidator()
        );
    }

    @Override
    public boolean supports(Class cls) {
        return true;
    }

    @Override
    public void validate(Object target, Errors errors) {
        if(target instanceof Collection){
            Collection collection = (Collection) target;

            for (Object object : collection) {
                validator.validate(object, errors);
            }
        } else {
            validator.validate(target, errors);
        }

    }
}
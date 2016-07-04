class MyMailer < Devise::Mailer 
  # mail to employer
  def apply_job_of_employer(employee, mail)
    @job = Job.find(mail[:job_id])
  	@employer = Employer.find(@job.employer_id)
    @employee = employee
    
  	# @content has :employee_name, :employee_email, :content
  	@content = mail.permit(:content, :employee_resume)
  
    email_with_name = %("#{@employee.first_name}" <#{@employee.email}>)

    cv = @content[:employee_resume]
  	attachments["#{cv.original_filename}"] = File.read(cv.path)
  	mail(from: email_with_name,
  			 to: @employer.email,
  			 subject: "Apply for #{@job.name}")
  end
end

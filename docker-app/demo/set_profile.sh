echo 'PATH=/root/.local/bin:$PATH; export PATH' >> /root/.profile
echo 'ANSIBLE_CONFIG=/app/ansible.cfg; export ANSIBLE_CONFIG' >> /root/.profile
echo "alias ap='ansible -i inventory '" >>/root/.profile
echo "alias aplay='ansible-playbook -i inventory '" >>/root/.profile
echo 'cd /app;echo ls -ltr' >>/root/.profile
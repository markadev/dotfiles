# Start the ssh-agent

AGENT_ENV="${HOME}/.ssh/agent-env.sh"
START_AGENT=0

if [ -f "${AGENT_ENV}" ]; then
	# Try to use the already running agent
	. "${AGENT_ENV}" > /dev/null
fi

# See if the agent is still running
if [ "${SSH_AGENT_PID}" ]; then
	ps x |egrep "^ *${SSH_AGENT_PID}\>.+ssh-agent\>" > /dev/null
	START_AGENT=$?
else
	START_AGENT=1
fi

if [ ${START_AGENT} -ne 0 ]; then
	ssh-agent > "${AGENT_ENV}"
	. "${AGENT_ENV}"
fi

unset AGENT_ENV
unset START_AGENT

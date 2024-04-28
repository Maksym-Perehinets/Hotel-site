import kickbox
from re import compile
from backend.app.config.config import config


class Validation:

    @staticmethod
    def password(data):
        re_validator = compile(r"^(?=\S{6,20}$)(?=.*?\d)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[^A-Za-z\s0-9])")
        if re_validator.match(data):
            return data
        else:
            raise ValueError(
                'invalid password format it should contain at least 1 uppercase letter, numbers and special characters'
            )

    @staticmethod
    def email(data):
        re_validator = compile(r"^([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7})")
        if config.DEBUG is True:
            if re_validator.match(data):
                return data
            else:
                raise ValueError(
                    'invalid email format'
                )
        else:
            email_validator = kickbox.Client(config.KICKBOX_API_TOKEN).kickbox()
            result = email_validator.verify(data)
            if re_validator.match(data) and result.body['result'] != "undeliverable":
                print(result, "\n\n",  result.body['result'])
                return data
            else:
                raise ValueError(
                    'invalid email format'
                )


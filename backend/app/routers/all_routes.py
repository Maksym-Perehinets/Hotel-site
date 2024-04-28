from fastapi import APIRouter
from . import home_page, authentication


def get_apps_router():
    """
    Place where all routes are defined into one route that latter imported
    """
    router = APIRouter()
    router.include_router(home_page.router)
    router.include_router(authentication.router)
    return router


